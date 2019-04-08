<cfoutput>
    <a href="#event.buildLink( "users" )#" class="btn btn-sm btn-default">
        <i class="fa fa-chevron-left"></i> Back to Users
    </a>

    <h1>#prc.user.getEmail()#</h1>

    <dl>
        <dt>Latest Post Title</dt>
        <dd>
            <cfif isNull( prc.user.getLatestPost() )>
                No posts yet!
            <cfelse>
                <a href="#event.buildLink( "posts.#prc.user.getLatestPost().getId()#" )#">
                    #prc.user.getLatestPost().getTitle()#
                </a>
            </cfif>
        </dd>

        <dt>Created At</dt>
        <dd>#dateTimeFormat( prc.user.getCreatedDate(), "full" )#

        <dt>Last Modified At</dt>
        <dd>#dateTimeFormat( prc.user.getModifiedDate(), "full" )#
    </dl>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Excerpt</th>
            </tr>
        </thead>
        <tbody>
            <cfif prc.user.getPosts().isEmpty()>
                <tr>
                    <td colspan="2" class="text-center">
                        <p>No posts yet</p>
                        <p>Why not create one now?</p>
                        <a href="#event.buildLink( "posts.new" )#" class="btn btn-primary">
                            Create a New Post
                        </a>
                    </td>
                </tr>
            <cfelse>
                <cfloop array="#prc.user.getPosts()#" index="post">
                    <tr>
                        <td>
                            <a href="#event.buildLink( "posts.#post.getId()#" )#">#post.getTitle()#</a>
                        </td>
                        <td>#post.getTruncatedBody()#</td>
                    </tr>
                </cfloop>
            </cfif>
        </tbody>
    </table>
</cfoutput>
