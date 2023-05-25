@isTest
public with sharing class SendEmailWithApexTest {
@isTest
    private static void testData(){
       /*  Date tdy = System.today();
        Date endDt = tdy.addDays (30); */
        Campaign camp = new Campaign();
        camp.Name = 'FlowTestCampaign';
        camp.StartDate = Date.today();
        camp.Campaign_Completion_Date__c = StartDate.addDays(30);
        camp.Target_Donation_Amount__c = '1000';
        insert camp;

        SendEmailWithApex.FlowEmailData innerFlowData = new SendEmailWithApex.FlowEmailData(); 
        innerFlowData.campaignId = camp.Id;
        innerFlowData.emaillist = new List<String>{'Team7@test.com'};
        List<SendEmailWithApex.FlowEmailData> invocableData = new List<SendEmailWithApex.FlowEmailData>{innerFlowData.campaignId,innerFlowData.emaillist};
        Test.startTest();
        SendEmailWithApex.sendEMail(invocableData);
        Integer invocations = Limits.getEmailInvocations();
        Test.stopTest();
        Assert.areEqual(1, invocations, 'Error occurred please check your class');
    }
}


      
