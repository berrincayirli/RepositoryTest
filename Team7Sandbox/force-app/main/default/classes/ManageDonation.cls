public class ManageDonation {
    @AuraEnabled
    public static List<Account> fetchTopContributors() {
        
        List<Account> accList = [SELECT Id, Name, Total_Donation__c, Anonymous__c
                                FROM Account
                                WHERE isPersonAccount = true
                                AND Total_Donation__c != NULL
                                ORDER BY Total_Donation__c DESC
                                LIMIT 3];

        return accList;
    }
}