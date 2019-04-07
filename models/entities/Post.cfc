component extends="quick.models.BaseEntity" {

    property name="str" inject="@Str" persistent="false";

    property name="id";
    property name="title";
    property name="body";
    property name="userId" column="user_id";
    property name="createdDate" column="created_date";
    property name="modifiedDate" column="modified_date";

    function author() {
        return belongsTo( "User" );
    }

    function scopeLatest( query ) {
        query.orderBy( "created_date", "desc" );
    }

    function getTruncatedBody() {
        return str.limitWords( super.getBody(), 15 );
    }

}
