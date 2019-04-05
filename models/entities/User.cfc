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

    function getMemento() {
        return {
            "id" = retrieveAttribute( "id" ),
            "email" = retrieveAttribute( "email" ),
            "createdDate" = dateFormat( retrieveAttribute( "createdDate" ), "dd mmm yyyy" )
        };
    }

}
