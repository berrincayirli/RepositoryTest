public  class Customer1Handler {
    public static void Customer1Handler( List<Customer1__c> triggernew ) {
        List<payment__c> listpayment = new List<payment__c>();
        for (customer1__c newcustm : triggernew) {
            payment__c newpayment = new payment__c();
            newpayment.Amount__c = 0.1;
            newpayment.Mode__c = 'Online';
            newpayment.Customer1__c = newcustm.Id;

            listpayment.add(newpayment);

            payment__c newpayment1 = new payment__c();
            newpayment1.Amount__c = 1;
            newpayment1.Mode__c = 'Crypto';
            newpayment1.Customer1__c = newcustm.Id;

            listpayment.add(newpayment1);

        }
        insert listpayment;
    }

    public static void DeleteCustomer(List<customer1__c> oldlist){
        Set<Id> setid = new Set<Id>();
        for (customer1__c item : oldlist) {
            if (item.active__c = true ) {
                setid.add(item.id);
            }
        }
        list<payment__c> paylist = [Select id FROM payment__c where Customer1__c IN : setid];
        if (!paylist.isEmpty()) {
            delete paylist;
        }
    }

    public static void DeleteCustomer2(List<customer1__c> oldlist){
        Set<Id> setid = new Set<Id>();
        for (customer1__c item : oldlist) {
            if (item.active__c = False ) {
                setid.add(item.id);
            }
        }
        list<payment__c> paylist = [Select id FROM payment__c where Mode__c = 'Online' and Customer1__c IN : setid];
        if (!paylist.isEmpty()) {
            delete paylist;
        }
    }

    
}