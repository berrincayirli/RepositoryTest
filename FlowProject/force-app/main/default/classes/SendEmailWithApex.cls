public with sharing class SendEmailWithApex {
    @InvocableMethod(label='Send Email Notification')
    public static void sendEMail(List<FlowEmailData> inputEmailDatas){
        System.debug(inputEmailDatas);
        FlowEmailData inputValue=inputEmailDatas.get(0);
        System.debug(inputValue.campaignId);
        System.debug(inputValue.emailList);

        List<EmailTemplate> emailTemplate= [SELECT Id, Name, DeveloperName 
                                            FROM EmailTemplate 
                                            WHERE Name  =:'MassEmailforDonors'
                                            WITH SECURITY_ENFORCED];

        List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
        Set<String> emailAddress = new Set<String>();
        
        for(String eachEmailAddreess:inputValue.emailList){
            System.debug(eachEmailAddreess);        
            Messaging.SingleEmailMessage emailMsg = Messaging.renderStoredEmailTemplate(emailTemplate[0].Id,
                                                                                    UserInfo.getUserId(),
                                                                                    inputValue.campaignId);
            emailMsg.setSaveAsActivity(false);
            emailAddress.add(eachEmailAddreess);
            emailMsg.setToAddresses(new List<String>(emailAddress));
            //emailMsg.setBccAddresses(new List<String>(emailAddress));
            emailMsgs.add(emailMsg);
        }
        System.debug(emailAddress); 
        try {
            System.debug(emailMsgs);        
            Messaging.SendEmailResult[] results=Messaging.sendEmail(emailMsgs);
            System.debug(results);
        }catch(Exception exc){
            System.debug(exc.getMessage());
        }
    }
        //Inner Class
        public class FlowEmailData{

            @InvocableVariable(label='Donor Email List' description='pass the email list from flow' required=true)
            public List<String> emailList;
            @InvocableVariable(label='Donation Campaign Id' description='pass the Campaign Id from flow' required=true)
            public Id campaignId;
        }
}