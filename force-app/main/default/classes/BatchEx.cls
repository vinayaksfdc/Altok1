global class BatchEx implements Database.Batchable<sObject>{
  
    global Database.QueryLocator start(database.BatchableContext bc){
        String query='select id,name,phone,industry from Account';
       return Database.getQueryLocator(query);
        
    }
    global void execute(database.BatchableContext bc,List<Account> scope){
        for(Account a:scope)
            if(a.industry==null)
        {
            a.rating='hot';
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
        
    }
    
}