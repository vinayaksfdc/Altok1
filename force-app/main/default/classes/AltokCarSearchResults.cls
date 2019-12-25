public class AltokCarSearchResults  {
    //public class CarSearchResults
    public list<Car__c> Cars{get;set;}
    
    @AuraEnabled
    public static List<string> getcartypes() {
        List<string> myPicklist = new List<String>();
        
        Schema.DescribeFieldResult field = car__c.CarType_Values__c.getDescribe();
        
        for (Schema.PicklistEntry f : field.getPicklistValues()){
            myPicklist.add(f.getLabel());
        }
        //   list<Car__c> cartypelist =[SELECT CarType_Values__c FROM Car__c];
        return myPicklist;
    }
    
    @AuraEnabled
    public static List<Car__c> getCars(string CarTypeId ) {
        system.debug('working'+ CarTypeId);
        list<Car__c> obj = new list<Car__c>();
        if(CarTypeId!='') {
            //return list of Car of thisType
            //SELECT id, Car_Type__c, picture__c, name, Registration_Number__c FROM Car__c   WHERE Car_Type__c =: CarTypeId
            
            obj=[SELECT id, CarType_Values__c,	City__c, 	Image_url__c, Name, Reg_No__c FROM Car__c WHERE CarType_Values__c =: CarTypeId];
        }else {
            //return a list of all Cars
            obj=[SELECT id, CarType_Values__c, 	City__c,	Image_url__c, Name, Reg_No__c  FROM Car__c];
        }
        system.debug('obj '+obj);
        return obj;
    }
    
}