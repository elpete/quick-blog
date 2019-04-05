component extends="coldbox.system.testing.BaseTestCase" {

    function beforeAll() {
        super.beforeAll();
        getWireBox().autowire( this );

        param request.migrationsRan = false;
        if ( ! request.migrationsRan ) {
            var migrationService = getWireBox().getInstance( "MigrationService@cfmigrations" );
            migrationService.setMigrationsDirectory( "/resources/database/migrations" );
            migrationService.setDefaultGrammar( "PostgresGrammar" );
            migrationService.setDatasource( getUtil().getSystemSetting( "TEST_DB_DATABASE" ) );
            migrationService.reset();
            migrationService.install();
            migrationService.runAllMigrations( "up" );
            request.migrationsRan = true;
        }
    }

    function afterAll() {
        super.afterAll();
    }

    /**
     * @aroundEach
     */
    function bootstrapIntegrationTest( spec ) {
        transaction action="begin" {
            try {
                setup();
                arguments.spec.body();
            }
            catch ( any e ) {
                rethrow;
            }
            finally {
                transaction action="rollback";
            }
        }
    }

}
