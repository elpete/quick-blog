component extends="tests.resources.BaseIntegrationSpec" {

    property name="userService" inject="quickService:User";
    property name="flash" inject="coldbox:flash";

    function run() {
        describe( "users spec", function() {
            it( "can create a user", function() {
                expect( userService.count() ).toBe( 0 );
                var event = post( "/users", validParams() );
                expect( userService.where( "email", "bob@example.com" ).exists() )
                    .toBeTrue( "bob@example.com should be in the database" );
                expect( userService.count() ).toBe( 1 );
            } );

            it( "email is required", function() {
                var event = post( "/users", validParams( { email = "" } ) );
                expect( userService.where( "email", "bob@example.com" ).exists() )
                    .toBeFalse( "bob@example.com should not be in the database" );
                expect( flash.get( "errors" ) ).toHaveKey( "email" );
            } );

            it( "password is required", function() {
                var event = post( "/users", validParams( { password = "" } ) );
                expect( userService.where( "email", "bob@example.com" ).exists() )
                    .toBeFalse( "bob@example.com should not be in the database" );
                expect( flash.get( "errors" ) ).toHaveKey( "password" );
            } );

            it( "password confirmation must match password", function() {
                var event = post( "/users", validParams( {
                    password = "1234",
                    passwordConfirmation = "4321"
                } ) );
                expect( userService.where( "email", "bob@example.com" ).exists() )
                    .toBeFalse( "bob@example.com should not be in the database" );
                expect( flash.get( "errors" ) ).toHaveKey( "passwordConfirmation" );
            } );
        } );
    }

    function validParams( overrides = {} ) {
        var params = {
            "email" = "bob@example.com",
            "password" = "1234",
            "passwordConfirmation" = "1234"
        };
        structAppend( params, overrides, true );
        return params;
    }

}
