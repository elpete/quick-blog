component {

    property name="userService" inject="quickService:User";
    property name="messagebox" inject="messagebox@cbmessagebox";
    property name="flash" inject="coldbox:flash";

    function index( event, rc, prc ) {
        prc.title = "Users";
        prc.users = userService.withLatestPost().get();
        event.setView( "users/index" );
    }

    function new( event, rc, prc ) {
        prc.title = "New User";
        event.setView( "users/new" );
    }

    function create( event, rc, prc ) {
        var result = validateModel(
            target = rc,
            constraints = {
                email = { required = true },
                password = { required = true },
                passwordConfirmation = { required = true, sameAs = "password" }
            }
        );

        if ( result.hasErrors() ) {
            flash.put( "errors", result.getAllErrorsAsStruct() );
            messagebox.appendArray( result.getAllErrors(), "error" );
            return redirectBack();
        }

        userService.create( {
            "email" = rc.email,
            "password" = rc.password, // not really secure
            "createdDate" = now(),
            "modifiedDate" = now()
        } );

        relocate( "users" );
    }

    function show( event, rc, prc ) {
        param rc.id = "";
        prc.user = userService.withLatestPost().findOrFail( rc.id );
        prc.title = prc.user.getEmail();
        event.setView( "users/show" );
    }

    function delete( event, rc, prc ) {
        param rc.id = "";
        userService.findOrFail( rc.id ).delete();
        relocate( "users" );
    }

}
