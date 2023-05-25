public class PaymentHandler {
    public static void insertpayment(set<Id> newcustmId) {

        List<customer1__c> custm = [select id,Total_Amount__c,( select id, Amount__c from Payments__r) FROM Customer1__c WHERE Id =: newcustmId];
        for (customer1__c cus : custm) {
            cus.Total_Amount__c = 0;
            for (payment__c pay : cus.Payments__r) {
                cus.Total_Amount__c += pay.Amount__c;
            }
        }
        update custm;
    }
}