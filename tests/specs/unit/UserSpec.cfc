component extends="coldbox.system.testing.BaseTestCase" {

    function run() {
        describe( "user spec", function() {
            it( "hashes the password when set", function() {
                var user = getWireBox().getInstance( "User" );
                user.setPassword( "1234" );
                expect( user.getPassword() ).notToBe( "1234" );
            } );
        } );
    }

}
