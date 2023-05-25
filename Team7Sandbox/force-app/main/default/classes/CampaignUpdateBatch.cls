public class CampaignUpdateBatch implements Database.Batchable<sObject> {
    //* start
    public Database.QueryLocator start(Database.BatchableContext BC) {
        Database.QueryLocator q = Database.getQueryLocator(
            [SELECT Id, Name, EndDate ,Status, Remaining_Donation_Amount__c
            FROM Campaign
            WHERE EndDate = YESTERDAY
            AND Status != 'Expired'
            AND Remaining_Donation_Amount__c > 0]);
		return q;
    }
    //* execute
    public void execute(Database.BatchableContext BC, List<Campaign> campaignList) {
        List<Campaign> cmpList = new List<Campaign>();
        for(Campaign cmp : campaignList){
            cmp.Status = 'Expired';
            cmpList.add(cmp);
        }
        update cmpList;
    }
    //* finish
    public void finish(Database.BatchableContext BC) {
        system.debug('CampaignUpdateBatch Class running');
    }

}