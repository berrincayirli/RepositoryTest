@istest
public class SoqlDemo11Test {
    @istest
    public static void accountIndustryTest() {
        List<account> acclist = new List<account>();
        account acc = new account();
        acc.name = 'Test 1';
        acc.Industry = 'Education';
        acclist.add(acc);
        insert acc;

        account acc2 = new account();
        acc2.name = 'Test 2';
        acc2.Industry = 'Education';
        acclist.add(acc2);
        insert acc2;

        Test.startTest();
        Integer rs = SoqlDemo11.accountIndustry('Education');
        Test.stopTest();
    }
}
