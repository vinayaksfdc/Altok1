trigger trig on Opportunity (before insert) {
    
    for(opportunity op:trigger.new)	
    {
        for(opportunity o1:[select id,account.id from opportunity])
        {
            system.debug(o1);
            if(o1.account.id==op.Account.Id)
            {
                op.adderror('another opp cant be created');
            }
        }
    }
    
}