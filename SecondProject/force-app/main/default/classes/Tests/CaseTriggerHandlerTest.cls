@isTest
public class CaseTriggerHandlerTest {
    @isTest
    public static void createCaseTest() {
         list<case> listcs = new list<case>();
         for (Integer i = 0; i < 200; i++) {
            case cs = new case();
            cs.status = 'New';
            cs.origin = 'Web';
            if (i>=100) {
                cs.description = 'here is password';
            }else {
                cs.description = 'here is nothing';
            }
            listcs.add(cs);
         }
         insert listcs;
         list<case> item = [select id from case];
         System.assertEquals(300, item.size());
    }
}
