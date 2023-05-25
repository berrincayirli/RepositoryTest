public class OpportunityBatchSunday implements Database.Batchable<Sobject>, Database.stateful {
    //* 1- Write a logic to Create tasks for all the opportunities other than the closed won or closed lost and on which there was no activity since last 7 days. Implement using Batch APEX.
    public integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator q1 = Database.getQueryLocator([select id, name, closedate, ownerid from opportunity where (stageName != 'Closed Won' or stageName != 'Closed Lost') and LastModifiedDate < LAST_N_DAYS:7]);
        return q1;
    }
    public void execute(Database.BatchableContext bc, List<opportunity> opList){
        List<task> upTaskList = new List<task>();
        for (opportunity opp : opList) {
            task ts = new task();
            ts.Subject = 'Other';
            ts.description = 'Please take action on the Opportunity';
            ts.OwnerId = opp.ownerid;
            ts.WhatId = opp.id;
            ts.Status = 'In Progress';
            if(opp.closedate < date.today()){
                ts.ActivityDate = date.today();
            } else {
                ts.ActivityDate = opp.closedate.addDays(-2);
            }
            upTaskList.add(ts);
            count++;
        }
        if (!upTaskList.isEmpty()) {
            insert upTaskList;
        }
    }
    public void finish(Database.BatchableContext bc){
        System.debug(count + ' adet task oluşturuldu.');
    }
}
