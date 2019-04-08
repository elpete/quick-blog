<cfoutput>
    <h1>Users</h1>

    <div class="form-group text-right">
        <a href="#event.buildLink( "users.new" )#" class="btn btn-primary">
            New User
        </a>
    </div>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Email</th>
                <th>Latest Post Title</th>
                <th>Created Date</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <cfif prc.users.isEmpty()>
                <tr>
                    <td colspan="4" class="text-center">
                        <p>No users yet</p>
                        <p>Why not create one now?</p>
                        <a href="#event.buildLink( "users.new" )#" class="btn btn-primary">
                            Create a New User
                        </a>
                    </td>
            <cfelse>
                <cfloop array="#prc.users#" item="user">
                    <tr>
                        <td>
                            <a href="#event.buildLink("users.#user.getId()#")#">
                                #user.getEmail()#
                            </a>
                        </td>
                        <td>
                            <cfif isNull( user.getLatestPost() )>
                                No posts yet!
                            <cfelse>
                                <a href="#event.buildLink( "posts.#user.getLatestPost().getId()#" )#">
                                    #user.getLatestPost().getTitle()#
                                </a>
                            </cfif>
                        </td>
                        <td>#dateFormat( user.getCreatedDate(), "dd mmm yyyy" )#</td>
                        <td>
                            <form method="POST" action="#event.buildLink( "users.#user.getId()#" )#">
                                <input type="hidden" name="_method" value="DELETE" />
                                <button type="submit" class="btn btn-danger">
                                    <i class="fa fa-times"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </cfloop>
            </cfif>
        </tbody>
    </table>
</cfoutput>
