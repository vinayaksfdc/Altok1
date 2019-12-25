trigger dup_cons_bestpractises on Contact (before insert) {
    
    List<contact> cons=[select id,name,email,phone from contact where email!=NULL];
    Map<string,contact> mp= new Map<string,contact>();
    for(contact c:cons)
    {
        mp.put(c.email,c);
        system.debug(mp);  
    }
    Set<string> emls = mp.keySet();  
    system.debug('email are'+emls);
    List<contact> mpcon = mp.values();
    system.debug('values are'+mpcon);
    
    /*
* Set<string> emls = mp.keySet(); 
* a_young@dickenson.com=Contact:{Id=0032v00002jRDlcAAG, Name=Andy Young, Email=a_young@dickenson.com, Phone=(785) 241-6200}, 
barr_tim@grandhotels.com=Contact:{Id=0032v00002jRDldAAG, Name=Tim Barr, Email=barr_tim@grandhotels.com, Phone=(312) 596-1000}, 
bond_john@grandhotels.com=Contact:{Id=0032v00002jRDleAAG, Name=John Bond, Email=bond_john@grandhotels.com, Phone=(312) 596-1000}}


email are
{
List<contact> mpcon = mp.values();
a_young@dickenson.com, 
barr_tim@grandhotels.com, 
bond_john@grandhotels.com
}

Contact:{Id=0032v00002jRDlcAAG, Name=Andy Young, Email=a_young@dickenson.com, Phone=(785) 241-6200}, 
Contact:{Id=0032v00002jRDldAAG, Name=Tim Barr, Email=barr_tim@grandhotels.com, Phone=(312) 596-1000}, 
Contact:{Id=0032v00002jRDleAAG, Name=John Bond, Email=bond_john@grandhotels.com, Phone=(312) 596-1000})
*    for(Contact c:trigger.new)
{
if (mp.get(c.email).Contact.size()>0)
{

system.debug('email value from trigger.new'+c.email);
c.AddError('Duplicate email cannot be created');

}
}   
*/ 
    // colorCodes.containsKey('Blue');
    
    for(Contact c:trigger.new)
    {
        if (mp.containsKey(c.email)) 
        {
             system.debug('email value from trigger.new'+c.email);
            c.AddError('Duplicate email cannot be created');
            
        }
    }   
    
}