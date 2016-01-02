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
  renderLoginForm: function() {
  	return (
    	<div>
	    	<div>Hello {this.props.name}. Signed in {this.state.signedIn} 
	    		<button onClick={this.signIn}>Sign In</button>
	    		<button onClick={this.signOut}>Sign Out</button>
	    	</div>

	  		<form class="form-horizontal">
		  <fieldset>
		    <legend>Legend</legend>
		    <div class="form-group">
		      <label for="inputEmail" class="col-lg-2 control-label">Email</label>
		      <div class="col-lg-10">
		        <input type="text" class="form-control" id="inputEmail" placeholder="Email" />
		      </div>
		    </div>
		    <div class="form-group">
		      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
		      <div class="col-lg-10">
		        <input type="password" class="form-control" id="inputPassword" placeholder="Password" />
		        <div class="checkbox">
		          <label>
		            <input type="checkbox" /> Checkbox
		          </label>
		        </div>
		      </div>
		    </div>
		    <div class="form-group">
		      <div class="col-lg-10 col-lg-offset-2">
		        <button type="reset" class="btn btn-default">Cancel</button>
		        <button onClick={this.signIn} type="submit" class="btn btn-primary">Submit</button>
		      </div>
		    </div>
		  </fieldset>
		</form>
    	</div>
	);
  },
  render: function() {
  	if (this.state.signedIn) {
  		return this.renderDashboard();
  	} else {
  		return this.renderLoginForm();
  	}
  }
});



var ready = function () {
  ReactDOM.render(
    <HelloMessage name="Jared" signedIn="false" />,
    document.getElementById('app')
  );
};

$(document).ready(ready);