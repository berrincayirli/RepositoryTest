public  class Queuable112 implements Queueable{
    //Queuable2=> Annual Revenuesi 10000 olan accountlara bağlı olan contaclarin lead source ni 'Partner Referal' yapın..
    //bizden istenen recordlari public statik bir listenin icine soql ile eklerim
    public static List<Account> accList = [select id, (select id, LeadSource from Contacts) from account where AnnualRevenue = 10000];

    //execute-istenen formattaki tum contactlari getirip lead source sini 'Partner Referal' yapacagiz.
    public void execute(QueueableContext contex){
        System.debug('Queuable112 calsiti..');
        List<Contact> conList = new List<Contact>();
        for (account ac : accList) {
            conList.addAll(ac.Contacts);
        }
        for (contact c : conList) {
            c.LeadSource = 'Partner Referal';
        }
        update conList; 
        system.enqueueJob(new Queuable113());
    }
    
}