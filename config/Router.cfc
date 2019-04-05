component{

	function configure(){
		setFullRewrites( true );

        resources( "users" );
		route( ":handler/:action?" ).end();
	}

}
