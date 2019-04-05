<cfoutput>
    <h1>Create a new user</h1>

    <div class="col-md-6 col-sm-12">
        <form method="POST" action="#event.buildLink( "users" )#">
            <div class="form-group">
                <label for="email" class="control-label">Email</label>
                <input id="email" name="email" type="email" class="form-control">
            </div>

            <div class="form-group">
                <label for="password" class="control-label">Password</label>
                <input id="password" name="password" type="password" class="form-control">
            </div>

            <div class="form-group">
                <label for="passwordConfirmation" class="control-label">Confirm Password</label>
                <input id="passwordConfirmation" name="passwordConfirmation" type="password" class="form-control">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary">
                    Create
                </button>
            </div>
        </form>
    </div>
</cfoutput>
