trigger duplicaterecsize on Contact (before insert) {
    Set<string> lastname= new Set<string>();
    for(Contact Contact : Trigger.new)
    {
        lastname.add(Contact.lastname);
    }
    List<Contact> duplicateContactList = [Select lastname From Contact where lastname = :lastname];
    integer count=duplicateContactList.size();
    if(duplicateContactList.size()>0)
    {
        for(Contact s : Trigger.new)
        {
            {
                s.addError('Record already exist with same Name');
            }
        }
    }
    
}