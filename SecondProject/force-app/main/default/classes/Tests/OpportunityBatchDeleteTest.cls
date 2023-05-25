@isTest
public class OpportunityBatchDeleteTest {
    @isTest
    public static void testMethod1() {
        List<opportunity> oppList = new List<Opportunity>();
        for (Integer i = 0; i < 200; i++) {
            opportunity opp = new opportunity();
            opp.name = 'Deneme';
            opp.closedate = date.today();
            opp.stagename = 'Closed Lost';
            oppList.add(opp);
        }
        insert oppList;
        //System.assertEquals(200, oppList.size());
        Test.startTest();
        OpportunityBatchDelete ob = new OpportunityBatchDelete();
        Database.executeBatch(ob,200);
        Test.stopTest();
        List<opportunity> opList = [select id from Opportunity];
        System.assertEquals(0, opList.size());
    }
}