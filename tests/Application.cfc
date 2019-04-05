/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
*/
component{

	// APPLICATION CFC PROPERTIES
	this.name 				= "ColdBoxTestingSuite" & hash(getCurrentTemplatePath());
	this.sessionManagement 	= true;
	this.sessionTimeout 	= createTimeSpan( 0, 0, 15, 0 );
	this.applicationTimeout = createTimeSpan( 0, 0, 15, 0 );
    this.setClientCookies 	= true;

    this.datasource = getSystemSetting( "TEST_DB_DATABASE" );

	// Create testing mapping
	this.mappings[ "/tests" ] = getDirectoryFromPath( getCurrentTemplatePath() );
	// Map back to its root
	rootPath = REReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
    this.mappings["/root"]   = rootPath;

    this.mappings[ "/quick" ] = rootPath & "/modules/quick";

    function onRequestStart() {
        structDelete( application, "cbController" );
    }

    function getSystemSetting( required string key, defaultValue ) {
        var javaSystem = createObject( "java", "java.lang.System" );
        var value = javaSystem.getProperty( arguments.key );
        if ( ! isNull( value ) ) {
            return value;
        }

        value = javaSystem.getEnv( arguments.key );
        if ( ! isNull( value ) ) {
            return value;
        }

        if ( ! isNull( arguments.defaultValue ) ) {
            return arguments.defaultValue;
        }

        throw(
            type = "SystemSettingNotFound",
            message = "Could not find a Java System property or Env setting with key [#arguments.key#]."
        );
    }

}
