trigger prevent_delting_car_rec on Car__c (before delete) 
{
	List<car_route__c> lstcr=[SELECT Id,Name,Car__c FROM Car_Route__c];
    
    for(Car__c c: trigger.old)
    {
        
    }
    
    
}