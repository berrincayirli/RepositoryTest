public class Queuable113 implements Queueable{
    //Annual Revenuesi 10000 olan accountlara bağlı olan contaclarin lead source leri 'Partner Referal' olanların Description kısmına 'Queuable chain' yazın.. 
    //bizden istenen recordlari ,public statik bir listenin icine soql ile eklerim.
    public static List<Account> accList = [select id,(select id, Description from Contacts where leadSource = 'Partner Referal') from account where AnnualRevenue = 10000];

    //execute-istenen formattaki tum contactlari getirip description fieldine 'Queuable chain' ekleyecegiz..
    public void execute(QueueableContext contex){
        System.debug('Queuable113 calsiti..');
        List<Contact> conList = new List<Contact>();
        for (account ac : accList) {
            conList.addAll(ac.Contacts);
        }
        for (contact c : conList) {
            c.Description = 'Queuable chain';
        }
        update conList;
    }

    
}