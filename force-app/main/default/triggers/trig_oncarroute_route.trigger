trigger trig_oncarroute_route on Car_Route__c (after update) {
    
    set<id> ids=new set<id>();
    
    
    for(Car_Route__c c1:trigger.old)
    {
        ids.add(trigger.oldmap.get(c1.Id).Route__c);
        system.debug(trigger.oldmap.get(c1.Id).Route__c);
        ids.add(c1.Route__c);
        system.debug(ids);
    }
    
     
    
   
    
    
    Route__c rt=[select id,tot__c,(select id,Charge__c,Route__c from Car_Routes__r) from Route__c where id=:ids];
    Decimal tot=0;
   system.debug(rt.Car_Routes__r);
    for(Car_Route__c c: rt.Car_Routes__r)
    {
         
        Tot=tot+c.Charge__c;
        
        
    }
     System.debug('tot__c'+Tot);
  System.debug('id'+rt.id);
     Route__c r=new Route__c();
    r.tot__c=Tot;
    r.id=rt.id;
    update r;
     
}