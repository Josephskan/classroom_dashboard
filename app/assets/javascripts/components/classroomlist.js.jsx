
var ClassList = React.createClass({
  //this.props.classrooms
  render: function() {
    debugger
    var that = this.props.current_user

    if(this.props.classrooms) {
      var ClassroomInfo = this.props.classrooms.map(function (classroom) {
        var ClassTeacherRelationship;
          if (classroom.teacher_id === that.id) {
            ClassTeacherRelationship = <a href={"/classrooms/"+classroom.id}>show</a>
          } else {
            ClassTeacherRelationship = <p>You are not a teacher of this classroom</p>
          }

        return(
          <div>
            <hr></hr>
            <h3>{classroom.classroom_name}</h3>
            <p>{classroom.passcode}</p>
            <p>{classroom.teacher.username}</p>
            {ClassTeacherRelationship}
          </div>
        );
      });
    };
    return(
      <div className="ClassList">
        <h1>ClassList goes here</h1>
        <ul>
          {ClassroomInfo}
        </ul>
      </div>
    );
  }
});

var readyToGo = function() {
  React.renderComponent(
    <ClassList />,
    document.getElementById('classList')
  );
};

$(document).ready(readyToGo);