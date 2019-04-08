component {

    property name="postService" inject="quickService:Post";
    property name="userService" inject="quickService:User";
    property name="messagebox" inject="messagebox@cbmessagebox";
    property name="flash" inject="coldbox:flash";

    function index( event, rc, prc ) {
        prc.posts = postService.with( "author" ).all();
        event.setView( "posts/index" );
    }

    function new( event, rc, prc ) {
        prc.users = userService.all();
        if ( prc.users.isEmpty() ) {
            messagebox.info( "There are no users in the system.  Create one before creating a post." );
            relocate( "users" );
            return;
        }
        event.setView( "posts/new" );
    }

    function create( event, rc, prc ) {
        var result = validateModel(
            target = rc,
            constraints = {
                title = { required = true },
                body = { required = true },
                user_id = { required = true }
            }
        );

        if ( result.hasErrors() ) {
            flash.put( "errors", result.getAllErrorsAsStruct() );
            messagebox.appendArray( result.getAllErrors(), "error" );
            return redirectBack();
        }

        postService.create( {
            "title" = rc.title,
            "body" = rc.body,
            "userId" = rc.user_id,
            "createdDate" = now(),
            "modifiedDate" = now()
        } );

        relocate( "posts" );
    }

    function show( event, rc, prc ) {
        param rc.id = "";
        prc.post = postService.findOrFail( rc.id );
        event.setView( "posts/show" );
    }

    function edit( event, rc, prc ) {
        param rc.id = "";
        prc.post = postService.findOrFail( rc.id );
        event.setView( "posts/edit" );
    }

    function update( event, rc, prc ) {
        param rc.id = "";
        var post = postService.findOrFail( rc.id );

        var result = validateModel(
            target = rc,
            constraints = {
                title = { required = true },
                body = { required = true }
            }
        );

        if ( result.hasErrors() ) {
            flash.put( "errors", result.getAllErrorsAsStruct() );
            messagebox.appendArray( result.getAllErrors(), "error" );
            return redirectBack();
        }

        post.update( {
            "title" = rc.title,
            "body" = rc.body,
            "modifiedDate" = now()
        } );

        relocate( "posts.#post.getId()#" );
    }

    function delete( event, rc, prc ) {
        param rc.id = "";
        postService.findOrFail( rc.id ).delete();
        relocate( "posts" );
    }

}
