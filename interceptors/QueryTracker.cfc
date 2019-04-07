component extends="coldbox.system.Interceptor" {

    function preQBExecute( event, interceptData, buffer, rc, prc ) {
        param prc.queries = [];
        prc.queries.append( interceptData );
    }

}
