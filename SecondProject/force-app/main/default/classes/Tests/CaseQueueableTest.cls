@isTest
public class CaseQueueableTest {
    @isTest
    public  void method1() {
        Test.startTest();
        CaseQueueable ob = new CaseQueueable();
        System.enqueueJob(ob);
        Test.stopTest();
        List<case> listCase = [select id from case];
        System.assertEquals(10,listCase.size());
    }
}