global class ex implements database.batchable<sobject>
{
    global database.queryLocator start(database.batchablecontext bc)
    {
        String query;
        return database.getQueryLocator(query);
        
    }
    global void execute(database.batchablecontext bc,List<account> scope)
    {
    }
    global void finish(database.batchablecontext bc)
    {
    }
    
    
    
}