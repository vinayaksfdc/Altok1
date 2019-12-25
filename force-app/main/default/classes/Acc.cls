public class Acc {
    
    @AuraEnabled
    public static Account getAcc(Id accid) {
        // Getting the list of contacts from where Id is in accountIds
        Account acc = [SELECT Id, Name,industry, Phone,rating FROM Account WHERE id= :accid];
        // Returning the contact list
        return acc;
    }
}