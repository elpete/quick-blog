component {

    function up( schema ) {
        schema.create( "users", function( table ) {
            table.increments( "id" );
            table.string( "email" );
            table.string( "password" );
            table.timestamp( "created_date" );
            table.timestamp( "modified_date" );
            table.timestamp( "last_logged_in" ).nullable();
        } );
    }

    function down( schema ) {
        schema.drop( "users" );
    }

}
