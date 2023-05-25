@isTest
private class SendEmailWithApexTest {

    @isTest
    static void testSendEmail() {
        // Create test data
        EmailTemplate emailTemplate = new EmailTemplate(Name='MassEmailforDonors', DeveloperName='Mass_Email_for_Donors');
        insert emailTemplate;
        Id campaignId = '7017h000000LQGDAA4';

        List<String> emailList = new List<String>{
            'test1@example.com',
            'test2@example.com'
        };

        SendEmailWithApex.FlowEmailData inputData = new SendEmailWithApex.FlowEmailData();
        inputData.emailList = emailList;
        inputData.campaignId = campaignId;

        List<SendEmailWithApex.FlowEmailData> inputEmailDatas = new List<SendEmailWithApex.FlowEmailData>();
        inputEmailDatas.add(inputData);

        Test.startTest();
        // Call the sendEMail method
        SendEmailWithApex.sendEMail(inputEmailDatas);
        Test.stopTest();

        // Verify that the emails were sent
        List<EmailMessage> emailMessages = [SELECT Id FROM EmailMessage];
        System.assertEquals(emailList.size(), emailMessages.size(), 'Incorrect number of email messages created');
    }
}
