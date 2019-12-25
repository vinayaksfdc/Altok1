public class sizegrtr3 {
    public List<Account> alist{set;get;}
     public List<Contact> clist {set;get;}
    public sizegrtr3()
    {
        List<Account> alist = [SELECT Id, Name FROM Account];

	System.debug('a' + alist);

		List<Contact> clist = [SELECT Id, Name FROM Contact WHERE Contact.AccountId IN :alist];
		  
		System.debug('c' + clist);
        
        
    }

}