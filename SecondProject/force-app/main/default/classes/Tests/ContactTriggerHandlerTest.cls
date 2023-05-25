@isTest
public class ContactTriggerHandlerTest {
    @TestSetup
    static void makeData(){
        List<Account> accList = new List<Account>();
        List<Contact> cntList = new List<Contact>();

        for (Integer i = 0; i < 200; i++) {
            account acc = new account();
            acc.Name = 'Account' + i;
            acc.fax = '1111';
            accList.add(acc);

        }
        insert accList;
        for (account acc : accList) {
            
            for (Integer a = 0; a < 2; a++) {
                Contact cnt = new Contact();
                cnt.lastname = 'Contact ' + a;
                cnt.AccountId = acc.id;
                cnt.fax = '2222';
                cnt.Main_Contact_Person__c = false;
                cntList.add(cnt);
            }
        }
        insert cntList;
    }
    @isTest
    private static void contactPersonCheckboxTest() {
        List<Contact> contList = [select id,lastname,fax,Main_Contact_Person__c,AccountId from Contact];
        Test.startTest();
        contList[0].Main_Contact_Person__c = true;
        update contList;
        Test.stopTest();

        List<Account> acList = [select id,fax from account where id = : contList[0].AccountId];
        System.assertEquals('2222',acList[0].fax);
        System.assertNotEquals('1111',acList[0].fax);

    }
}