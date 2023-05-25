trigger Customer1Trigger on Customer1__c (before insert,before update, before delete,after insert, after update) {
    // a. Whenever a new Customer is created, create following default Payment records
    // - Amount = $0.1, Mode = Online
    // - Amount = $1, Mode = Crypto
    if (trigger.isAfter && trigger.isInsert) {
        Customer1Handler.Customer1Handler(Trigger.new);
    }
    if (trigger.isBefore && trigger.isDelete) {
        Customer1Handler.DeleteCustomer(Trigger.old);
    }
    if (trigger.isBefore && trigger.isDelete) {
        Customer1Handler.DeleteCustomer2(Trigger.old);
    }
    



    
}