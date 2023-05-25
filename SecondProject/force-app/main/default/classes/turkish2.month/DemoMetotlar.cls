public class DemoMetotlar {
    public static void printWelcome() {
        System.debug('Hosgeldiniz..');
    }
    public static void welcomePerson(string nm) {
        System.debug('Hosgeldin ' + nm);
    }
    public static integer toplama(integer a, integer b) {
        // integer sum = a + b;
        // return sum;
        return a + b;
    }
    public static void createAccount() {
        Account acc = new account();
        acc.Name = 'Salesforce';
        insert acc;
    }
    public static void createAndUpdateAccount() {
        Account acc = new account();
        acc.name = 'Softinnovas';
        insert acc;

        acc.Name = 'Softinnovas Inc.';
        update acc;
    }
    public static void createContact() {
        account acc = [select id, name from account where name = 'Salesforce' limit 1];

        contact cnt = new contact();
        cnt.LastName = 'Doe';
        cnt.AccountId = acc.id;
        insert cnt;
    }
}