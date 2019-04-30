<cfoutput>
    <form method="POST" action="#event.buildLink( "posts.#prc.post.getId()#" )#">
        <input type="hidden" name="_method" value="PATCH" />

        <div class="form-group">
            <label for="title" class="control-label">Title</label>
            <input id="title" name="title" type="text" class="form-control" value="#prc.post.getTitle()#" />
        </div>

        <div class="form-group">
            <label for="body" class="control-label">Body</label>
            <textarea id="body" name="body" class="form-control">#prc.post.getBody()#</textarea>
        </div>

        <div class="form-group">
            <label for="user" class="control-label">Author</label>
            <select name="user_id" id="user" class="form-control">
                <cfloop array="#prc.users#" index="user">
                    <option
                        value="#user.getId()#"
                        <cfif user.getId() EQ prc.post.getAuthor().getId()>selected</cfif>
                    >
                        #user.getEmail()#
                    </option>
                </cfloop>
            </select>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
</cfoutput>
