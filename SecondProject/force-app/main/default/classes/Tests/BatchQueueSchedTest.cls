@istest
public class BatchQueueSchedTest {
    @TestSetup
    static void makeData(){
        List<Account> accList = new List<Account>();
        for (Integer i = 1; i <= 200; i++) {
            if (i<=100) {
                account acc = new account();
                acc.name = 'Account ' + i;
                accList.add(acc);
            } else {
                account acc = new account();
                acc.name = 'Account ' + i;
                acc.AnnualRevenue = 10000;
                accList.add(acc);
            }
        }
        insert accList;
        List<Contact> conList = new List<Contact>();
        for (account acc : accList) {
            if (acc.name == 'Account 100') {
                contact c = new Contact();
                c.LastName = 'Test';
                c.AccountId = acc.id;
                conList.add(c);
            }
            contact c = new Contact();
            c.LastName = 'Test';
            c.LeadSource = 'Partner Referal';
            c.Description = 'hello';
            c.AccountId = acc.id;
            conList.add(c);
        }
        insert conList;
    }

    @istest
    private static void batchTest() {
        test.startTest();
        Batch11 b1 = new Batch11();
        Database.executeBatch(b1);
        test.stopTest();
        List<Account> accList = [select id, name from account where AnnualRevenue = 10000];
        system.assertEquals(200, accList.size());
    }

    @istest
    private static void Queuable111Test() {
        test.startTest();
        System.enqueueJob(new Queuable111());
        test.stopTest();
    }

    @istest
    private static void Queuable112Test() {
        test.startTest();
        System.enqueueJob(new Queuable112());
        test.stopTest();
    }

    @istest
    private static void Queuable113Test() {
        test.startTest();
        System.enqueueJob(new Queuable113());
        test.stopTest();
    }

}
// Diger konu birbirine zincirli classlar zincirli haldeyken test edemiyoruz.. onlari test etmek icin:
// batch11 de //ID jobId = system.enqueueJob(new Queuable111());
// Queuable111 de //system.enqueueJob(new Queuable112());
// Queuable112 de //system.enqueueJob(new Queuable113());
// satirlarini comment satiri yapinca testler %100 olmus oluyor.. Bu sekilde test etmis olacagiz..