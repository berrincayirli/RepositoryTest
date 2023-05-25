public class ThaksgivingEmailBatch implements Database.Batchable<sObject> {

    //* start
    public Database.QueryLocator start(Database.BatchableContext BC) {

        Database.QueryLocator q = Database.getQueryLocator([SELECT Id, Name, PersonHasOptedOutOfEmail, PersonEmail , PersonContactId
                                                            FROM Account 
                                                            WHERE PersonHasOptedOutOfEmail = FALSE 
                                                            AND PersonEmail != NULL]);
        return q;
        
    }

    //* execute
    public void execute(Database.BatchableContext BC, List<Account> scope) {

        try {
            List<EmailTemplate> emailTemplate= [SELECT Id, Name, DeveloperName 
                                                FROM EmailTemplate 
                                                WHERE DeveloperName ='ChristmasBerrin'
                                                WITH SECURITY_ENFORCED];
        
            List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
            System.debug(emailTemplate[0].Id);
            
            for (Account eachAcc : scope) {
                Messaging.SingleEmailMessage tEmail = new Messaging.SingleEmailMessage();
                tEmail.setTemplateId(emailTemplate[0].Id);
                tEmail.setSaveAsActivity(true);
                tEmail.setTargetObjectId(eachAcc.PersonContactId);
                //
                tEmail.setToAddresses(new String[] {eachAcc.PersonEmail});
                emailList.add(tEmail);
            }
            Messaging.sendEmail(emailList, false);
            
        } catch (Exception ex) {
            System.debug(ex);
        }
    }

    //* finish
    public void finish(Database.BatchableContext BC) {
        System.debug('Batch Class  Complated..:)');
    }

}