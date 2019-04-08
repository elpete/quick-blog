<cfoutput>
    <h1>Posts</h1>

    <div class="form-group text-right">
        <a href="#event.buildLink( "posts.new" )#" class="btn btn-primary">
            New Post
        </a>
    </div>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Body</th>
                <th>Author</th>
                <th>Created Date</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <cfif prc.posts.isEmpty()>
                <tr>
                    <td colspan="6" class="text-center">
                        <p>No posts yet</p>
                        <p>Why not create one now?</p>
                        <a href="#event.buildLink( "posts.new" )#" class="btn btn-primary">
                            Create a New Post
                        </a>
                    </td>
            <cfelse>
                <cfloop array="#prc.posts#" item="post">
                    <tr>
                        <td>
                            <a href="#event.buildLink("posts.#post.getId()#")#">
                                #post.getTitle()#
                            </a>
                        </td>
                        <td>#post.getTruncatedBody()#</td>
                        <td>#post.getAuthor().getEmail()#</td>
                        <td>#dateFormat( post.getCreatedDate(), "dd mmm yyyy" )#</td>
                        <td>
                            <a class="btn btn-primary" href="#event.buildLink( "posts.#post.getId()#.edit" )#">
                                <i class="fa fa-edit"></i>
                            </a>
                        </td>
                        <td>
                            <form method="POST" action="#event.buildLink( "posts.#post.getId()#" )#">
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
