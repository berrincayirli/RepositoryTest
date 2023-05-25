public class OpportunityBatchDelete implements Database.Batchable<SObject>, Database.stateful {
    public integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator q = Database.getQueryLocator([select id, name, stagename from opportunity where stagename = 'Closed Lost']);
        return q;
    }
    public void execute(Database.BatchableContext bc, List<opportunity> oppList){

       count += oppList.size();
        
        delete oppList;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug(count + ' adet opportunity silinmiştir.');
    }
}

