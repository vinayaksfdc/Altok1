public class accWithContController {
    @AuraEnabled
    public static List<Contact> getContactList(List<Id> accountIds) {
        // Getting the list of contacts from where Id is in accountIds
                List<Contact> contactList = [SELECT Id, Name, Email, Phone, AccountId FROM Contact WHERE AccountId in :accountIds];
                // Returning the contact list
        return contactList;
    }
}