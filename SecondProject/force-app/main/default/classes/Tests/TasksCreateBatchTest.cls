@isTest
public class TasksCreateBatchTest {
    @isTest
    public static void method1() {
        List<Case> caseList = new List<Case>();
        for (Integer i = 0; i < 200; i++) {
            case cs = new case();
            cs.status = 'Closed';
            cs.origin = 'Phone';
            //cs.lastmodifiedDate = date.today().addDays(-6);
            caseList.add(cs);
        }
        insert caseList;
        Test.startTest();
        TasksCreateBatch ob = new TasksCreateBatch();
        Database.executeBatch(ob,200);
        Test.stopTest();
        List<Task> taskList = [select id from task];
        System.AssertEquals(200,taskList.size());
    }
}