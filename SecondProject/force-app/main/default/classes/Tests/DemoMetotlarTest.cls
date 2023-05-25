@istest
public class DemoMetotlarTest {
    @istest
    private static void printWelcomeTest() {
        DemoMetotlar.printWelcome();
    }

    @istest
    private static void welcomePersonTest() {
        DemoMetotlar.welcomePerson('fatma');
    }

    @istest
    private static void toplamaTest() {
        integer sum = DemoMetotlar.toplama(11, 22);
        system.assertEquals(33, sum);
    }

    @istest
    private static void createAccountTest() {
        DemoMetotlar.createAccount();
        List<Account> accList = [select id, name from account where name = 'Salesforce'];
        System.assertEquals(1, accList.size());
        system.assertEquals('Salesforce', acclist[0].name);
    }

    @istest
    private static void createAndUpdateAccountTest() {
        DemoMetotlar.createAndUpdateAccount();
        List<Account> accList = [select id, name from account];
        System.assertEquals(1, accList.size());
        system.assertEquals('Softinnovas Inc.', accList[0].Name);
    }

    @istest
    private static void createContactTest() {
        Account acc = new Account();
        acc.Name = 'Salesforce';
        insert acc;
        DemoMetotlar.createContact();
        List<Contact> conList = [select id, lastname from Contact where lastName = 'Doe'];
        system.assertEquals(1, conList.size());
    }
    @istest
    private static void triggerAccount() {
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
    }
   

}