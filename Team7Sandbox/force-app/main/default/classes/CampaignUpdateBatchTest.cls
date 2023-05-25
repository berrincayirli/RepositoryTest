@Istest
public class CampaignUpdateBatchTest {
	
    @TestSetup
    static void makeData(){
        List<Campaign> cmpList = new List<Campaign>();
        for(Integer i =0; i<=5; i++){
            Campaign cm = new Campaign();
            cm.Name = 'Campaign '+ i;
            cm.EndDate = Date.today()-1;
            cm.Status = 'Active';
            cm.Target_Donation_Amount__c = 100;
            cm.Achieved_Donation_Amount__c = 3;
            cmpList.add(cm);
        }
        insert cmpList;
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