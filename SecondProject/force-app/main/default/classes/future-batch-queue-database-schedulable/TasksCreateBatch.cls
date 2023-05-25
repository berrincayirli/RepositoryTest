public class TasksCreateBatch implements Database.Batchable<SObject>{
    //* Write a logic in Batch to Create tasks for all the cases other than the closed and on which there was no activity since last 5 days.
    //* a. Implement the above logic in such a way that whenever required subject and Comments field value can be changed without the code change.
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator q1 = Database.getQueryLocator([select id, ownerid, status, lastmodifiedDate from case where status = 'Closed' and lastmodifiedDate < LAST_N_DAYS:5]);
        return q1;
    }
    public void execute(Database.BatchableContext bc, List<Case> caseList){
        List<Task> taskList = new List<Task>();
        for (case cs : caseList) {
            task t = new task();
            t.subject = system.label.TaskSubject; //* org da oluşturulan custom label (TaskSubject) çağırıldı.
            t.ActivityDate = date.today().addDays(2);
            t.Description = system.label.TaskComments;
            t.whatid = cs.id;
            t.ownerid = cs.ownerid;
            t.status = 'In Progress';
            taskList.add(t);
        }
        insert taskList;
    }
    public void finish(Database.BatchableContext bc){
    }
}