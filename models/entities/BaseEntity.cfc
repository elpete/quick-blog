component extends="quick.models.BaseEntity" {

    function keyType() {
        return variables._wirebox.getInstance( "AutoIncrementingKeyType@quick" );
    }

}
