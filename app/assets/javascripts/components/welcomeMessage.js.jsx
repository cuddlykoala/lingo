var HelloMessage = React.createClass({
  render: function() {
    return <div>Hello {this.props.name}</div>;
  }
});

var ready = function () {
  ReactDOM.render(
    <HelloMessage name="John" />,
    document.getElementById('app')
  );
};

$(document).ready(ready);