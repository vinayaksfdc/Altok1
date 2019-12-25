trigger duplicaterec on Contact (before insert) {
    
    List<contact> cons=[select id,name,email from contact];
       for(contact db:cons)
        {
            for(contact cs:trigger.new)
            {
                if(db.email==cs.email)
                {
                    cs.adderror('Already email exists');
                }
            }
         }   
    
 }