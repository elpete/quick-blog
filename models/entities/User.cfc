component extends="quick.models.BaseEntity" {

    property name="id";
    property name="email";
    property name="password";
    property name="createdDate" column="created_date";
    property name="modifiedDate" column="modified_date";
    property name="lastLoggedIn" column="last_logged_in";

    function setPassword( password ) {
        assignAttribute( "password", hash( password ) );
    }

    function scopeWithLatestPost( query ) {
        query.select( "users.*" )
            .subselect( "latestPostId", function( query ) {
                query.select( "id" )
                    .from( "posts" )
                    .whereColumn( "user_id", "users.id" )
                    .orderBy( "created_date", "desc" )
                    .limit( 1 );
            } )
            .with( "latestPost" );
    }

    function latestPost() {
        return belongsTo( "Post", "latestPostId" );
    }

}
