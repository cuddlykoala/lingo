var HelloMessage = React.createClass({

  getInitialState: function() {
  	return {
  		signedIn: this.props.signedIn
  	};
  },
  signIn: function() {
  	this.setState({ signedIn: true });
  },
  signOut: function() {
  	this.setState({ signedIn: false });
  },
  renderDashboard: function() {
  	return (
    	<div>
    		<div>Hello {this.props.name} 
	    		<button onClick={this.signIn}>Sign In</button>
	    		<button onClick={this.signOut}>Sign Out</button>
	    	</div>
	  		<div>Welcome, You are signed in!</div>
	  	</div>
  		);
  },
  render: function() {
  	if (this.state.signedIn) {
  		return this.renderDashboard();
  	} else {
	return (
		<Login />
		);
  	}
  }
});



var ready = function () {
  ReactDOM.render(
    <HelloMessage name="Jared" signedIn={false} />,
    document.getElementById('app')
  );
};

// $(document).ready(ready);