var Login = React.createClass({

	getInitialState: function() {
		return {editing: false};
	},
  render: function() {
  	return (
  		<div>
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
			    </div>
			  </fieldset>
			</form>
			 <div class="col-lg-10 col-lg-offset-2">
		        <button type="reset" class="btn btn-default">Cancel</button>
		        <button onClick={this.signIn} class="btn btn-primary">Submit</button>
		      </div>
	    	</div>
	    	);
  }

});

// var ready = function () {
//   ReactDOM.render(
//     <Login/>,
//     document.getElementById('app')
//   );
// };

// $(document).ready(ready);