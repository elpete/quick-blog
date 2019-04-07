component extends="tests.resources.BaseIntegrationSpec" {

    property name="postService" inject="quickService:Post";
    property name="flash" inject="coldbox:flash";

    function run() {
        describe( "posts spec", function() {
            it( "can create a post", function() {
                expect( postService.count() ).toBe( 0 );
                var event = post( "/posts", validParams() );
                expect( postService.count() ).toBe( 1 );
            } );

            it( "title is required", function() {
                expect( postService.count() ).toBe( 0 );
                var event = post( "/posts", validParams( { title = "" } ) );
                expect( postService.count() ).toBe( 0, "No posts should be in the database" );
                expect( flash.get( "errors" ) ).toHaveKey( "title" );
            } );

            it( "body is required", function() {
                expect( postService.count() ).toBe( 0 );
                var event = post( "/posts", validParams( { body = "" } ) );
                expect( postService.count() ).toBe( 0, "No posts should be in the database" );
                expect( flash.get( "errors" ) ).toHaveKey( "body" );
            } );

            it( "user_id is required", function() {
                expect( postService.count() ).toBe( 0 );
                var event = post( "/posts", validParams( { user_id = "" } ) );
                expect( postService.count() ).toBe( 0, "No posts should be in the database" );
                expect( flash.get( "errors" ) ).toHaveKey( "user_id" );
            } );
        } );
    }

    function validParams( overrides = {} ) {
        var params = {
            "title" = "Post title",
            "body" = "Post body",
            "user_id" = function() {
                return getWireBox().getInstance( "User" ).create( {
                    "email" = "bob@example.com",
                    "password" = "1234",
                    "created_date" = now(),
                    "modified_date" = now()
                } );
            }
        };
        structAppend( params, overrides, true );
        return params.map( function( key, value ) {
            if ( isClosure( value ) || isCustomFunction( value ) ) {
                return value();
            }
            return value;
        } );
    }

}
