trigger PaymentTrigger on Payment__c (before insert,before update, before delete, after insert,after update, after delete) {
    Set<id> custmId = new Set<id>();
    if (trigger.isAfter && trigger.isInsert) {
        for (payment__c item : trigger.new) {
            if (item.customer1__c != null && item.Amount__c != null) {
                custmId.add(item.customer1__c);
            }
        }
    }
    if (trigger.isAfter && trigger.isUpdate) {
        for (payment__c item : trigger.new) {
            if (item.amount__c!= trigger.oldMap.get(item.id).amount__c) {
                custmId.add(item.customer1__c);
            }
            
        }
    }

    if (trigger.isAfter && trigger.isDelete) {
        for (payment__c item : trigger.old) {
            if (item.customer1__c != null) {
                custmId.add(item.customer1__c);
            }
        }
    }

    if (!custmId.isEmpty()) {
        PaymentHandler.insertpayment(custmId);
    }


}