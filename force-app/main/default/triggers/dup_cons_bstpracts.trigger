trigger dup_cons_bstpracts on Contact (before insert) {
    for(Contact con : Trigger.new)
    {
        system.debug('thevalue of con'+con);
        for(Contact c1 : [select email from contact where email =: con.email])
            
        {
             system.debug('thevalue of c1 '+c1);
            if(c1.email!=null)
            {
                con.adderror('This email already exists');
            }
            
        }
        //    emailid.add(con.email);
    }
    
     
}