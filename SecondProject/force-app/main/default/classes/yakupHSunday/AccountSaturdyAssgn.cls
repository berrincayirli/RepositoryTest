//1)
public  class AccountSaturdyAssgn {
    public static void dmlinsertAssignmt() {
        List<Account> acclist = new List<Account>();

        account acc1 = new account();
        acc1.Name = 'Assignment1';
        acc1.Phone = '2344566777878';
        acc1.Site = 'accountSite1';
        acc1.Website = 'www.account1.com';
        acclist.add(acc1);

        account acc2 = new account();
        acc2.Name = 'Assignment2';
        acc2.Phone = '2374875858588';
        acc2.Site = 'accountSite2';
        acc2.Website = 'www.account2.com';
        acclist.add(acc2);

        insert acclist;
        
    }

    public static void dmlupdateAssignmt(){
        List<Account> acclist = [select id, name, phone FROM Account ];

        List<Account> updateAccount = new List<Account>();

        for (account acc :acclist){
            if(acc.name == 'Assignment1'){
            acc.name = acc.name + '1';
            acc.phone = '23334455677';
            updateAccount.add(acc);
            } else if( acc.name == 'Assignment2') {
            acc.name = acc.name + '2';
            acc.phone = '37475674788';
            updateAccount.add(acc);
            }
        }

        if (!updateAccount.isEmpty()) {
            update updateAccount;
        }
        
    }

    public static void dmlDeleteMultible(){
        List<Account> accList = [select id, name FROM  Account WHERE Name = 'Assignment11' or Name = 'Assignment22'];
        System.debug(accList.size());
        delete accList;
        System.debug(accList.size());
        system.debug(accList.isEmpty());

    }
    public static void dmlInsertMultiple(){
        List<Opportunity> listOpp = new List<Opportunity>();

        for (Integer i = 0; i< 149; i++) {
            Opportunity opp = new Opportunity();
            opp.name = 'Homework' + i;
            opp.Type = 'New   Customer';
            opp.stageName = 'Qualification';
            opp.closeDate =Date.newInstance(2024, 02, 02);
            opp.description = ' Please stay with us';
            listOpp.add(opp);
        }
        if (!listOpp.isEmpty()) {
            insert listOpp;
        }
        System.debug(listOpp);
        System.debug(listOpp.size());
    }

    public static void dmldeleteOpp(){
        List<Opportunity> listOpp = [select id, name, CreatedDate FROM Opportunity WHERE CloseDate = 2024-02-02];
        System.debug(listOpp.size());
        delete listOpp;
        System.debug(listOpp.size());
        system.debug(listOpp.isEmpty());



    }
    public static void newAccount(){

    account acc1 = new account();
    acc1.Name = 'Summer Fest LLC';
    acc1.type = 'Technology Partner';
    acc1.Rating = 'Hot';
    acc1.AnnualRevenue = 200000000;
    insert acc1;
}

public static void newContact(){
    List<contact> cont = new List<contact>();
    for (integer i= 1; i<=3; i++) {
        contact cont1 = new Contact();
        cont1.LastName = 'Event Planner' + i;
        cont1.phone = '+123456789';
        cont1.account.Id = '0018d00000LAnKxAAL';
        cont1.LeadSource = 'Web';
        cont.add(cont1);
    }
    insert cont;
    
    System.debug(cont);
}
   
}
