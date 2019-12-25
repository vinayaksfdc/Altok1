trigger compareemail on Contact (before update) {
    for(Contact c: trigger.old){
        for(Contact d: trigger.new){
            if(c.Email != d.Email){
                d.AddError( 'You cant change the Email');
            }
        }
    }
}