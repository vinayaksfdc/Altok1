trigger rstrct_carrecord_if_related_carroute_exists on Car__c (before delete) {
    
    list<car__c> cr=[select id,name from car__c where id in (SELECT Car__c FROM Car_Route__c)];
    system.debug('listOfcars'+cr);	
   
    
    if(cr.size()>0){
        for(car__c soql: cr)
        {
            for(Car__c c:trigger.old)
            {
                if(c.id==soql.id)
                {
                    c.adderror('Car record cant be deleted as it has related record');
                }    
            }
        } 
    }
    
}