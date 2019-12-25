trigger contrigger on Contact (after insert, before Insert, before update, after update) {

                if(Trigger.operationType == triggerOperation.AFTER_INSERT || Trigger.operationType == triggerOperation.AFTER_UPDATE) {
                    set<Id> IdSet =new set<Id>();
                    for(Contact cot : trigger.new) {
                        if(cot.accountID != null) {
                            IdSet.add(cot.accountId);
                        }
                    }

                    Integer contactListCount = [Select count() from contact where accountID IN: IdSet];

                if(contactListCount > 2) {
                    for(contact cop : trigger.new) {
                        cop.addError('cannot have more than 2 contacts per account');
                    }
                }
            }
}