var HelloMessage = React.createClass({

  getInitialState: function() {
  	return {
  		signedIn: this.props.signedIn
  	};
  },
  signIn: function() {
  	this.setState({ signedIn: "true" });
  },
  signOut: function() {
  	this.setState({ signedIn: "false" });
  },
  render: function() {
    return (
    	<div>Hello {this.props.name}. Signed in {this.state.signedIn} 
    		<button onClick={this.signIn}>Sign In</button>
    		<button onClick={this.signOut}>Sign Out</button>
    	</div>
    );
  }
});



var ready = function () {
  ReactDOM.render(
    <HelloMessage name="Jared" signedIn="false" />,
    document.getElementById('app')
  );
};

$(document).ready(ready);