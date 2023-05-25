trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update, after delete) {
    set<Id> accList = new set<Id>();
    if (trigger.isAfter && trigger.isUpdate) {
        for (opportunity eachOp : trigger.new) {
            if (eachOp.amount != trigger.oldMap.get(eachOp.Id).amount) {
                accList.add(eachOp.accountId);
            }if (eachOp.StageName != trigger.oldMap.get(eachOp.Id).StageName) {
                accList.add(eachOp.accountId);
            }if (eachOp.AccountId != trigger.oldMap.get(eachOp.Id).AccountId) {
                accList.add(eachOp.accountId);
                accList.add(trigger.oldMap.get(eachOp.Id).AccountId);
            }
        }
    }
    if (trigger.isAfter&&(trigger.isInsert||trigger.isUndelete)) {
        for (opportunity eachOp : trigger.new) {
            if (eachOp.AccountId != null) {
                accList.add(eachOp.accountId);
            }
        }
    }
    if (trigger.isDelete &&trigger.isAfter) {
        for (opportunity eachOp : trigger.old) {
            if (eachOp.AccountId != null ) {
                accList.add(eachOp.accountId);
            }
        }
    }
    if (!accList.isEmpty()) {
        OpportunityTriggerHandler.UpdateHAON(accList);
        OpportunityTriggerHandler.UpdateTAAON(accList);
        OpportunityTriggerHandler.UpdateTAG(accList);
    }

}
   
