public  class Case_assg {
    public static void CaseInsert() {
        case c = new case();
        c.subject = 'Testcase';
        c.origin = 'Phone';
        insert c;
    }

    public static void caseUpdate(){
        case c  = [select id, subject FROM case WHERE Subject like 'Testcase' LIMIT 1];
        c.subject = 'Testing case 1';
        upsert c;

    }

    public static void caseDelete(){
        case c = [select id, Subject FROM case WHERE Subject like '%case 1%'];
         delete c;
    }
}
