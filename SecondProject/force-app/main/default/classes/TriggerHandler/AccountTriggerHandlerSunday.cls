public class AccountTriggerHandlerSunday {
        //sunday assignment 1. soru. Yeni bir Account oluşturulduğunda ona bağlı bir contact oluşsun.ve account name i contactın lastname iolsun ve account phonu contact phoneu ile aynı olmalı.oluşturulan accountlar liste, onunşa birliktew oluşan contact larda liste.!!!dikkat herzaman ikili oluşumlarda böyle yap.
        // public static void createContact(List<Account> accList){
        //     List<Contact> cont = new List<Contact>();
        //     for (account acc1 : accList) {
        //         contact c1= new contact();
        //         c1.AccountId = acc1.Id;
        //         c1.LastName = acc1.Name;
        //         c1.Phone = acc1.Phone;
        //         cont.add(c1);
                
        //     }
        //     insert cont;
        // }
 }
     //account  update yapıldığnda , update olan accountların opplarını (close won olmaynları) closed lost yap.

       
        // public static void updateOpp(List<Account> accTriggerNew, List<account> accTriggerOld, Map<id, account> accTriggerNewMap, Map<id, account> accTriggerOldMap){
        
        //         set<id> accIds = new set<id>(); 
        //        for (account eachAcc : accTriggerNew){
        //             accIds.add(eachAcc.Id);
        
        //     }
        
           //2. versiyon 17-19.satirlar arasina alternatif
           //set<id> accIds2 = accTriggerNewMap.keySet();
        
        
        //     List<Opportunity> oppList=[Select id, name, stageName from Opportunity where stageName != 'Closed Won' and AccountId IN: accIds];
        
        //     for (opportunity item : oppList) {
        //         item.StageName = 'Closed Lost';
               
                
        //     }
        
        //     update oppList;
        // }

        // public static void AccountTriggerHandler(List<Account> triggernew, List<account> triggerOld, Map<id, Account> triggerNewMap,  Map<id, Account> triggerOldMap){
        //     for(account  newAcc : triggernew) {
        //         List<Account> filtered = [select name from account where name =: newAcc.name];

        //         if (!filtered.isEmpty()) {
        //             newAcc.name.addError('Aynı isim ile zaten bir account var. Başka bir isim giriniz');
        //         }
        //     }


        // }
        /*
        public static void CreateContOpp (List<Account> triggernew, List<account> triggerOld){
            List<contact> newcont = new List<contact>();
            List<opportunity> newopp = new List<opportunity>();
            for (account acc : triggernew) {
            contact cont = new contact();
            cont.AccountId = acc.Id;
            cont.LastName = ' contactwithAccount';
            newcont.add(cont);

            opportunity opp = new opportunity();
            opp.accountId = acc.Id;
            opp.name = 'oppwithAccount';
            opp.CloseDate = date.newInstance(2023, 10, 10);
            opp.StageName = 'Prospecting';
            newopp.add(opp);
            }
            insert newcont;
            insert newopp;
        }

        public class AccountTriggerHandler {
            public static void createContact(List<Account> accTriggernew) {
                List<Contact> conList = new List<Contact>();
                for (account acc : accTriggernew) {
                    for (Integer i = 1; i <= 7; i++) {
                        contact c = new contact();
                        c.FirstName = acc.name;
                        c.LastName = 'Contact ' + i;
                        c.AccountId = acc.id;
                        conList.add(c);
                    }
                }
        
                insert conList;
            }
            public static void updateName(List<Account> triggerNew, Map<Id, Account> triggerOldMap) {
                for (account acc : triggerNew) {
                    if (acc.name != triggerOldMap.get(acc.id).name) {
                        acc.Description = 'Bu recordda isim degisikligi oldu..';
                    }
                }
            }
        }
        
}

       
    

