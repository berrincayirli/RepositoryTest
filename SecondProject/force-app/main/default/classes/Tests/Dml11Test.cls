@isTest

public with sharing class Dml11Test {
    @isTest

    static void createAccountsAndContactsTest() {
        Test.startTest();
        Dml11.createAccountsAndContacts(5);
        Test.stopTest();

        List<Account> acclist = [select id, name, (select id, lastname from contacts) from Account];
        Integer acSys = acclist.size();
        System.assertEquals(5, acSys);

        Integer oneAccofCon = acclist[0].Contacts.size();

        system.assertEquals(5, oneAccofCon);

        string conName = acclist[0].contacts[0].lastname;
        System.assertEquals('contact 1.1', conName);
    }
}
