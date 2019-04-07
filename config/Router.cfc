component{

	function configure(){
		setFullRewrites( true );

        resources( "users" );
        resources( "posts" );
		route( ":handler/:action?" ).end();
	}

}
