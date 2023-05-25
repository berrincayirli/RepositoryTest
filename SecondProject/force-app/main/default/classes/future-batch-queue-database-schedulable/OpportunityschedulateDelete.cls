public class OpportunityschedulateDelete  implements Schedulable{
    public void execute (SchedulableContext sc) {
        OpportunityBatchDelete ob = new OpportunityBatchDelete();
        Database.executeBatch(ob,2);
    }
}
