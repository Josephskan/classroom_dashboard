var StudentContent = React.createClass({
  render: function () {
    var self = this
    var user = this.props.user
    var memberships = this.props.memberships
    var classrooms = this.props.classrooms

    if(memberships) {
      var MembershipInfo = self.props.memberships.map(function (membership) {
        return(
          <div key={membership.classroom.id}>
            <hr></hr>
            <h3>{membership.classroom.classroom_name}</h3>
            <p>{membership.classroom.passcode}</p>
            <p>{membership.classroom.teacher.name}</p>
            <a href={"/classrooms/"+membership.classroom.id}>Enter classroom</a>
          </div>
        );
      });
    };
    return(
      <div className="StudentContent">
        <h1>ClassList goes here</h1>
        <ul>
          {MembershipInfo}
        </ul>
      </div>
    );
  }

//   _checkMembershipForClassroom: function(classroom, membership) {
//     if (classroom.id === membership.classroom_id) {
//       return <a href={"/classrooms/"+classroom.id}>Enter classroom</a>
//     } 
//   }
});

var ParentContent = React.createClass({
render: function () {
    var self = this
    var user = this.props.current_user
    var classrooms = this.props.classrooms
    var memberships = this.props.memberships

    if(memberships) {
      var MembershipInfo = self.props.memberships.map(function (membership) {
        return(
          <div key={membership.classroom.id}>
            <hr></hr>
            <h3>{membership.classroom.classroom_name}</h3>
            <p>{membership.classroom.passcode}</p>
            <p>{membership.classroom.teacher.name}</p>
            <a href={"/classrooms/"+membership.classroom.id}>Enter classroom</a>
          </div>
        );
      });
    };
    return(
      <div className="StudentContent">
        <h1>ClassList goes here</h1>
        <ul>
          {MembershipInfo}
        </ul>
      </div>
    );
  }

  // _checkIfTeacherIfClassroom: function(classroom, user) {

  //   if (classroom.teacher_id === user.id) {
  //     return <a href={"/classrooms/"+classroom.id}>show</a>
  //   } 
  //   return <p>You are not a teacher of this classroom</p>
  // }
});

var TeacherContent = React.createClass({
  propTypes: {
    classrooms: React.PropTypes.array,
    user:       React.PropTypes.object
  },

  render: function () {
    var self = this
    var classrooms = this.props.classrooms
    var user = this.props.user

    if(this.props.classrooms) {
      var ClassroomInfo = this.props.classrooms.map(function (classroom) {

        var ClassTeacherRelationship = self._checkIfTeacherIfClassroom(classroom, user)
        if (ClassTeacherRelationship != null) { 
          return(
            <div key={classroom.id}>
              <hr></hr>
              {ClassTeacherRelationship}
            </div>
          );
        };
      });
    };

    return(
      <div className="TeacherContent">
        <h1>ClassList goes here</h1>
        <ul>
          {ClassroomInfo}
        </ul>
      </div>
    );
  },

  _checkIfTeacherIfClassroom: function(classroom, user) {

    if (classroom.teacher_id === user.id) {
      return(
        <div>  
          <a href={"/classrooms/"+classroom.id}>show</a>
          <h3>{classroom.classroom_name}</h3>
          <p>{classroom.passcode}</p>
          <p>{classroom.teacher.name}</p>
        </div>
      )
    } 
  }
});

var ClassroomSearchForm = React.createClass({
  getInitialState: function() {
    return { searchClassroomName: ''};
  },

  handleChange: function(e) {
    this.setState({searchClassroomName:e.target.value});
  },



  render: function() {
    var classrooms = []
    var allClassrooms = this.props.classrooms
    var searchClassroomName = this.state.searchClassroomName.trim().toLowerCase();
    var memberships = this.props.memberships
    var userType = this.props.userType

    if(searchClassroomName.length > 0 ){

      // We are searching. Filter the results.
      classrooms = allClassrooms
      classrooms = classrooms.filter(function(classroom){
          return (
            classroom.classroom_name.toLowerCase().match( searchClassroomName )
          )
      });
    } else if(searchClassroomName.length == 0 ) {
      classrooms = []
    } 

    var ListOfValidMemberships = memberships.map(function(m){ return m.classroom_id})

    return (
      <div>
        <input type="text" value={this.state.searchClassroomName} onChange={this.handleChange} placeholder="Search by Classroom name" />
          <ul> 
            { classrooms.map(function(classroom) {
              if ( ListOfValidMemberships.indexOf(classroom.id) != -1) {
                return( 
                  <div id="searchClassroomNameResult">
                    <h3>{classroom.classroom_name}</h3>
                    <p>{classroom.passcode}</p>
                    <p>{classroom.teacher.name}</p>
                    <a href={"/classrooms/"+classroom.id}>Enter classroom</a>
                  </div>
                )
              } else {
                return(
                  <div id="searchClassroomNameResult">
                    <h3>{classroom.classroom_name}</h3>
                    <p>{classroom.passcode}</p>
                    <p>{classroom.teacher.name}</p>
                    <a href={"/classrooms/"+classroom.id+"/"+userType.toLowerCase()+"_memberships/new"}>Join Classroom</a>
                  </div>
                )
              };
            })}
          </ul>
      </div>
    );
  },
});

var ClassList = React.createClass({
  //this.props.classrooms
  render: function() {


    var self = this
    var user = this.props.current_user
    var classrooms = this.props.classrooms
    var memberships = this.props.memberships
    var ClassUserView = this._getUserType(this.props.userType);
    var CheckIfTeacher = this._checkTeacherType(this.props.userType)

    return(
      <div className="ClassList">
        { ClassUserView }
        { CheckIfTeacher }
      </div>
    );
  },

  _getUserType: function (userType) {

    var self = this
    var user = this.props.current_user
    var classrooms = this.props.classrooms
    var memberships = this.props.memberships

    switch (userType) {
      case 'Teacher':
      return <TeacherContent classrooms={classrooms} user={user} />
      break;
      
      case 'Parent':
      return <ParentContent classrooms={classrooms} user={user} memberships={memberships} />
      break;
      
      case 'Student':
      return <StudentContent classrooms={classrooms} user={user} memberships={memberships} />
      break;

      default:
      return <div><h1>Not Authorized</h1></div>
      break;
    }
  },
  _checkTeacherType: function(userType) {

    var user = this.props.current_user
    var classrooms = this.props.classrooms
    var memberships = this.props.memberships
    var userType = this.props.userType

    if (userType != 'Teacher') {
      return <ClassroomSearchForm classrooms={classrooms} user={user} memberships={memberships} userType={userType}/>
    }
  }
});

// var readyToGo = function() {
//   React.renderComponent(
//     <ClassList />,
//     document.getElementById('classList')
//   );
// };

// $(document).ready(readyToGo);

//<ClassList>
  // <Student\ParentContent>
  //    <MembershipInfo />
  // <Student\ParentContent>
  //     or
  //  <TeacherContent>
  //   <ClassroomInfo />
  // </TeacherContent>
//  <ClassroomSearchForm>
//  <ClassroomNewForm
//
// 
//</ClassList>