// Bir Account'a bağlı;
// - Opportunity yoksa bir opportunity,
// - Contact yoksa bir Contact,
// - Opportunity ve Contact yoksa birer Opportunity ve Contact
// oluşturan bir batchable apex tasarlayınız, finish() kısmında kaç adet Opportunity ve Contact oluşturulduğunu system.debug() vasıtası ile yazdırınız ve her cumartesi 02:00 AM saatinde execute edilecek şekilde planlayınız.
public class BatchAssgnmt implements Database.Batchable<SObject>, Database.stateful{
    public integer oppsize = 0;
    public integer contsize = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator q1 = Database.getQueryLocator([select id, name, (select id, accountid, name from Opportunities),(select id, accountid, name From Contacts) from Account ]);
        return q1;
    }

    public void execute(Database.BatchableContext bc, List<Account> scope){
       
        List<Opportunity> listopp = new List<Opportunity>();
        list<Contact> listcont = new list<contact>();
        for (account acc : scope) {
            if (acc.Opportunities.size()== 0) {
                Opportunity opp = new Opportunity();
                opp.name = 'Batch';
                opp.closedate = date.newinstance(2023, 12,12);
                opp.stagename = 'close won';
                opp.accountid = acc.id;
                listopp.add(opp);

            }
        
            System.debug(acc.Opportunities.size());
            if (acc.contacts.size() == 0) {
                Contact cont = new contact();
                cont.lastname = 'batch11';
                cont.accountid = acc.id;
                listcont.add(cont);
            }
            
            
        }
        upsert listopp;
        upsert listcont;

        oppsize += listopp.size();
        contsize += listcont.size();
    }
    public void finish(Database.BatchableContext bc){
        System.debug('toplam' + oppsize + 'tane opp. oluştu.');
        System.debug('toplam' + contsize + 'tane cont. oluştu.');

    }

}
