<cfoutput>
    <h1>Create a new post</h1>

    <div class="col-md-6 col-sm-12">
        <form method="POST" action="#event.buildLink( "posts" )#">
            <div class="form-group">
                <label for="title" class="control-label">Title</label>
                <input id="title" name="title" type="text" class="form-control">
            </div>

            <div class="form-group">
                <label for="body" class="control-label">Body</label>
                <textarea id="body" name="body" class="form-control"></textarea>
            </div>

            <div class="form-group">
                <label for="user" class="control-label">Author</label>
                <select name="user_id" id="user" class="form-control">
                    <cfloop array="#prc.users#" item="user">
                        <option value="#user.getId()#">#user.getEmail()#</option>
                    </cfloop>
                </select>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary">
                    Create
                </button>
            </div>
        </form>
    </div>
</cfoutput>
