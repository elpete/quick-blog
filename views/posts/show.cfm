<cfoutput>
    <a href="#event.buildLink( "posts" )#" class="btn btn-sm btn-default">
        <i class="fa fa-chevron-left"></i> Back to Posts
    </a>

    <h1>#prc.post.getTitle()#</h1>
    <h3>#prc.post.getAuthor().getEmail()#</h3>

    <p>#prc.post.getBody()#</p>

    <dl>
        <dt>Created At</dt>
        <dd>#dateTimeFormat( prc.post.getCreatedDate(), "full" )#

        <dt>Last Modified At</dt>
        <dd>#dateTimeFormat( prc.post.getModifiedDate(), "full" )#
    </dl>
</cfoutput>
