public class OppDeleteBatch implements Database.Batchable<sobject>, Database.stateful{
    //* 2. Write a logic to delete all the opportunities which were updated as closed Lost using BATCH apex, also print total number of opportunities DELETED.
    public integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator q1 = Database.getQueryLocator([select id,stageName from opportunity where stageName = 'Closed Lost']);
        return q1;
    }
    public void execute(Database.BatchableContext bc, List<opportunity> opList){
        if(!opList.isEmpty()){
            count += opList.size();
            delete opList;
        }
    }
    public void finish(Database.BatchableContext bc){
        System.debug(count + ' adet task silindi.');
    }
}
