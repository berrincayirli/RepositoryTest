public class Queuable111 implements Queueable{
    //Accountlardan Annual Revenuesi 10000 olanlara birer contact create edip bağlayalım.
    //bizden istenen recordlari public statik bir listenin icine soql ile eklerim
    public static List<Account> accList = [select id, name from account where AnnualRevenue = 10000];

    //execute-her bir accounta bir contact create edip baglayacagiz..
    public void execute(QueueableContext contex){
        System.debug('Queuable111 calisti..');
        List<Contact> conList = new List<Contact>();
        for (account acc : accList) {
            contact c = new contact();
            c.LastName = 'Queuable111 Test';
            c.AccountId = acc.id;
            conList.add(c);
        }
        insert conList;
        system.enqueueJob(new Queuable112());
    }
}