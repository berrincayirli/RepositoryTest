public class BatchExample implements Database.Batchable<Sobject>{
    //Tüm Accountların name lerininin yanına update kelimesini ekleyelim. Annual revenue si olmayanların da Annual Revenueleri 10000 yapılsın..

    //start-soql islem yapilacak tum veriler tek seferde alinir ve execute yapilmasi icin return edilir..
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator q1 = Database.getQueryLocator([select id, name, AnnualRevenue from account]);
        return q1;
    }

    //execute-parca parca islem yapilir..
    public void execute(Database.BatchableContext bc, List<account> scope){
        List<Account> updateAccounts = new List<Account>();
        for (account acc : scope) {
            //name fieldi max 40 karakter aliyor..
            acc.Name += ' update';
            if (acc.AnnualRevenue == null) {
                acc.AnnualRevenue = 10000;
            }
            updateAccounts.add(acc);
        }
        update updateAccounts;
    }

    //finish-bitis mesaji veya mail gibi islemin bittigi ile ilgili haber verme gerceklesir..baska bir class cagrilmasi da burada olur.
    public void finish(Database.BatchableContext bc){
        System.debug('batch islemi bitti..');
        // Queuable111 q111 = new Queuable111();
        // system.enqueueJob(q111);
        ID jobId = system.enqueueJob(new Queuable111());
        //System.debug(jobId);
    }
}
