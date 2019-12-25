public class CarSearchResults {
  
    @AuraEnabled   
    //methodname
    public static List<String> getPickListValuesIntoList(){
        List<String> pickListValuesList = new List<String>();
        Schema.DescribeFieldResult fieldResult = car__c.CarType_Values__c.getDescribe();
        system.debug('fieldResult is'+fieldResult);
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        system.debug('ple is'+ple);
        for(Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
            System.debug('Values in Rating are: '+pickListValuesList);
        }     
        return pickListValuesList;
    }
     
 	@AuraEnabled
    public static List<car__c> getCars(string carTypeval ) {
      system.debug('working'+ carTypeval);
        list<car__c> obj = new list<car__c>();
        
        if(carTypeval!='') {
            //return list of boat of thisType
            obj=[SELECT id, Image_url__c, name,	CarType_Values__c, Make__c
                    FROM car__c
                    WHERE CarType_Values__c =: carTypeval];
        }else {
            //return a list of all boats
           obj=[SELECT id, Image_url__c, name,	CarType_Values__c, Make__c
                    FROM car__c
                    WHERE CarType_Values__c =: carTypeval];
        }
        system.debug('obj '+obj);
    	return obj;
 
    }
}