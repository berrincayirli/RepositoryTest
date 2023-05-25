@Istest
public class CampaignUpdateSchedulableTest {
    @TestSetup
    static void makeData(){
        List<Campaign> campaignList = new List<Campaign>();
        for(Integer i =0; i<=20; i++){
            Campaign cmp = new Campaign();
            cmp.Name = 'Campaign '+ i;
            cmp.Target_Donation_Amount__c = 900;
            cmp.Achieved_Donation_Amount__c = 90;
            cmp.EndDate = Date.today()-1;
            cmp.Status = 'Active';
            campaignList.add(cmp);
        }
        insert campaignList;
    }
    @IsTest
    static void batchTest(){
        List<Campaign> cList = [SELECT Name, EndDate, Status FROM Campaign];
        
        test.startTest();
        CampaignUpdateBatch c = new CampaignUpdateBatch();
        Database.executeBatch(c);
        test.stopTest();
        
        List<Campaign> cmpList = [SELECT Name, EndDate, Status FROM Campaign];
        
        system.assertEquals('Expired', cmpList[0].Status);
        
    }
}