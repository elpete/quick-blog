<cfoutput>
    <a href="#event.buildLink( "posts" )#" class="btn btn-sm btn-default">
        <i class="fa fa-chevron-left"></i> Back to Posts
    </a>

    <h1>#prc.post.getTitle()#</h1>
    <h3><small>By</small> <a href="#event.buildLink( "users.#prc.post.getAuthor().getId()#" )#">#prc.post.getAuthor().getEmail()#</a></h3>
    <a class="btn btn-small btn-default" href="#event.buildLink( "posts.#prc.post.getId()#.edit" )#">Edit</a>

    <p>#prc.post.getBody()#</p>

    <dl>
        <dt>Created At</dt>
        <dd>#dateTimeFormat( prc.post.getCreatedDate(), "full" )#

        <dt>Last Modified At</dt>
        <dd>#dateTimeFormat( prc.post.getModifiedDate(), "full" )#
    </dl>
</cfoutput>
