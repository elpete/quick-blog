<cfoutput>
    <a href="#event.buildLink( "users" )#" class="btn btn-sm btn-default">
        <i class="fa fa-chevron-left"></i> Back to Users
    </a>

    <h1>#prc.user.getEmail()#</h1>

    <dl>
        <dt>Latest Post Title</dt>
        <dd>#prc.user.getLatestPost().getTitle()#</dd>

        <dt>Created At</dt>
        <dd>#dateTimeFormat( prc.user.getCreatedDate(), "full" )#

        <dt>Last Modified At</dt>
        <dd>#dateTimeFormat( prc.user.getModifiedDate(), "full" )#
    </dl>
</cfoutput>
