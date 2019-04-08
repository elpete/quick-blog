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
                #prc.user.getLatestPost().getTitle()#
            </cfif>
        </dd>

        <dt>Created At</dt>
        <dd>#dateTimeFormat( prc.user.getCreatedDate(), "full" )#

        <dt>Last Modified At</dt>
        <dd>#dateTimeFormat( prc.user.getModifiedDate(), "full" )#
    </dl>
</cfoutput>
