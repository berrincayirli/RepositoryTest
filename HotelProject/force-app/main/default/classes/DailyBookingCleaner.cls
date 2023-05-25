public with sharing class DailyBookingCleaner implements Database.Batchable<sObject>, Schedulable{

    
        public void execute(SchedulableContext SC) {
            Database.executeBatch(new DailyBookingCleaner());
            Database.executeBatch(new DailyBookingCleaner(), 1);
        }
     
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([Select id, name, Status__c
                                        FROM Booking__c
                                        WHERE Check_out_Date_Time__c <=: Datetime.now().addmonths(-2)
                                        And Status__c =: 'Completed']);
    }

    public void execute(Database.BatchableContext bc, List<Booking__c> records){
        delete records;
    }
    public void finish(Database.BatchableContext bc){

        List<GroupMember> members = [ Select  UserOrGroupId 
                                    FROM  GroupMember 
                                    WHERE  Group.DeveloperName = 'DailyJobs'];

        set<Id> UserIds = new set<Id>();
        for(GroupMember gm : members){
            UserIds.add(gm.UserOrGroupId);
        }

        Set<String> toAddresses = new Set<String>();
        for (User us : [Select Email From User Where Id IN: userIds AND IsActive = true]) {
            
        }
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Daily Purge Booking Job Has Run');
        email.setHtmlBody('Hello, <br/><br/>Daily mail Job has finished. <br/>');
        email.setToAddresses(new List<String>(toAddresses));
        try{
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ email });
        }catch(exception exc){
            ErrorlogHandler.createErrorlog('DailyBookingCleaner', 'sendEmail',  exc.getMessage());
        }
     
    }
}