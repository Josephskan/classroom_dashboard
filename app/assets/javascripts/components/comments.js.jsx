var CommentBox = React.createClass({
    // this.props.comment
  render: function() {
    return(
      <div className="CommentBox">
        <p>{this.props.comment.text}</p>
        <small>--{this.props.username}</small>
      </div>
    );
  }
});

var readyToGo = function() {
  React.renderComponent(
    <CommentBox />,
    document.getElementById('commentBox')
  );
};

$(document).ready(readyToGo);


