trigger compare_emails_lst_db on Contact (before update,before insert) {
    
   List<string> es=new List<string>();
    List<lstofemails__c> mcs = lstofemails__c.getall().values();
    for(lstofemails__c m: mcs)
    {
        es.add(m.email__c);
        system.debug('list of emails'+es);
    }
      //for loop for query
      for(contact con:[select email from contact])
        {
           //for loop for trignew
           //asong@uog.com, a_young@dickenson.com, agreen@uog.com
            for(contact cnw: trigger.new)
            {
                //for loop for getting string value
                for(String str:es)
                {
                   if(con.email==str || cnw.email==str)
                           system.debug('con.email==str------->'+con.email+'STR VALUE IS'+str
                                       +'cnw.email==str'+cnw.email);
                      
                      
                             cnw.adderror('duplicate email');
                        }   
                    
                }     
                    
            }   
                
}