
var ClassList = React.createClass({
  render: function() {
    return(
      <div className="ClassList">

        <h1>ClassList goes here</h1>
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