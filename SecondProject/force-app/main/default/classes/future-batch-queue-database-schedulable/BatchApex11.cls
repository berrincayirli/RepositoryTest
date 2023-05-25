public class BatchApex11 implements Database.Batchable<SObject>{
    //Tum accountlarin isimlerinin sonuna batch11 ekleyelim..
    //start
    public Database.QueryLocator start(Database.BatchableContext bc){
        string query = 'select id, name from Account';
        return Database.getQueryLocator(query);
    }

    //execute
    public void execute(Database.BatchableContext bc, List<Account> scope){
        for (Account acc : scope) {
            acc.Name = acc.Name + ' batch 11';
        }
        //update scope;
        try {
            update scope;
        } catch (Exception e) {
            System.debug(e);
        }
    }OpportunityBatch x1 = new OpportunityBatch();
        id batchid = Database.executeBatch(x1,5);
        System.debug(batchid);



    //finish
    public void finish(Database.BatchableContext bc){
        System.debug('islem bitti');
        AsyncApexJob a = [select id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email from AsyncApexJob where id =:bc.getJobId()];

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAdresses = new String[]{'betulozbudak@gmail.com', 'ebruca889@gmail.com', 'uzumcufatma45@gmail.com', 'aydinbezgin3@gmail.com', 'betulagar.pt@gmail.com', 'rabiaselli@gmail.com', 'burak.061634@gmail.com'};
        mail.setToAddresses(toAdresses);
        mail.setSubject(a.status);
        mail.setPlainTextBody(system.label.accountNameUpdate + '\n' + ' The batch Apex job proccessed ' + a.TotalJobItems + '\n' + ' batches with ' + a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}