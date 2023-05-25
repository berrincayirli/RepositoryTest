public  class ScheduleAccOppCont implements Schedulable {
    public void execute(SchedulableContext sc){
        BatchAssgnmt oc = new BatchAssgnmt();
        Database.executeBatch(oc, 5);
    }
}
