component {

    function up( schema ) {
        schema.create( "posts", function( table ) {
            table.increments( "id" );
            table.string( "title" );
            table.text( "body" );
            table.unsignedInteger( "user_id" );
            table.timestamp( "created_date" );
            table.timestamp( "modified_date" );
        } );
    }

    function down( schema ) {
        schema.drop( "posts" );
    }

}
