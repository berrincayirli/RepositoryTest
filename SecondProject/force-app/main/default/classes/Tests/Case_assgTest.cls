@istest
public  class Case_assgTest { 
    @istest
    public static void CaseInsertTest(){
        list<case> listcase = new List<case>();
        case c = new case();
        c.subject = 'Testcase';
        c.origin = 'Phone';
        listcase.add(c);
        insert listcase;
        Test.starttest();
        Case_assg.CaseInsert();
        Test.stoptest();
        
        System.assertEquals(1, listcase.size());
        System.assertEquals('Testcase', listcase[0].subject);
    }
    @istest
    public  static void caseUpdateTest() { 
        List<case> listcase = new List<case>();
        case c = new case();
        c.subject = 'Testcase';
        c.origin = 'Phone';
        listcase.add(c);
        insert listcase;
        listcase[0].subject = 'Testing case 1';
        upsert listcase;
        string newsubject = listcase[0].subject = 'Testing case 1';
        System.debug('new Subject is:' + newsubject);
        Test.starttest();
        Case_assg.caseUpdate();
        Test.stoptest();
    }
    @istest
    public  static void caseDeleteTest() {
        Case_assg.CaseInsert();
        Case_assg.caseUpdate();
        List<case> listcase =[select id FROM case];
        System.debug(listcase.size());
        Case_assg.caseDelete();
        System.debug(listcase.size());
        

    }

}

