public class AccConAndOppOperations {
    public static  list<account> allAccount() {
        list<account> Acc = [Select id,name, AnnualRevenue, type,AccountSource FROM Account ];

        return Acc;
    }


    public static List<opportunity> opplist (String LeadSource1, String StageName1){
        List<opportunity> listOpp = [Select id, name, LeadSource, StageName FROM Opportunity where LeadSource =: LeadSource1 or StageName = :StageName1];
        return listOpp;
    }

    public static Void listAcc(){
        List<Account> printAcc =[select id, name, AnnualRevenue, (Select id, name, Amount, StageName From Opportunities Where StageName = 'Closed Won') FROM Account where Type= 'Customer - Direct' ];
        System.debug(printAcc);

        for (account item1 : printAcc) {
            System.debug(item1);
            for (opportunity item2: item1.opportunities){
            System.debug(item2);
            }
        }
    }

    public static decimal OppSum(){

        list<opportunity> listOpp = [Select id, Name, amount,stageName FROM Opportunity Where StageName = 'Closed Won' ];

        decimal sum = 0;
        for(Opportunity item : listOpp){
            sum +=item.amount;
        }
        System.debug(sum);
        return sum;
    }

    public static list<account> ClosedWonAccount(string n){
        list<account> closedWon = [SELECT id, Name FROM Account WHERE id IN (SELECT AccountId FROM opportunity WHERE stageName =: n)];
        return closedWon;
    }

    public static List<Account> cont(){
        list<account> accList = [SELECT id, Name FROM Account WHERE id IN (SELECT AccountId FROM Contact)];
        return accList;
    }

    public static void createContact(String accid) {
        account acc = [select name from account where id =: accid];
        Contact cntNew = new contact();
        cntNew.LastName = acc.name;
        cntNew.AccountId = accid; // = acc.id;
        insert cntNew;
        System.debug(cntNew);
    }

    public static void updateTop10(){

        List<Opportunity> tenOpp = [ select id, name, description FROM Opportunity WHERE Amount >= 0 ORDER BY Amount DESC LIMIT 10];

        for(opportunity varOpp : tenOpp){
            varOpp.description = 'This is one of the top 10 opportunities. Please work on this properly ';
            System.debug(varOpp.Name + 'Has been updated');

        }
        update tenOpp;
    }
    public static void oppCreate(String accId, integer n) {
        account acc = [select id, name, AnnualRevenue FROM account WHERE id =: accId];


        List<opportunity> lstOpp = new List<opportunity>();
          if (n>0 ) {
            for(integer i=1; i<=n; i++){
                opportunity opp = new opportunity();
                opp.Name = acc.Name + i;
                opp.accountid = accId;
                opp.stagename = 'Prospecting';
                opp.closedate = date.today().addYears(3);
                if(acc.AnnualRevenue!= null ){
                    opp.amount = acc.AnnualRevenue/n;  
                }else{
                    opp.amount = 0;
                }
                
                opp.closedate = date.today().addYears(3);

                lstOpp.add(opp);
                
            }
        }else{
            System.debug('Please tell us how many opportunities needs to be created');
        }
        insert lstOpp;
        System.debug('Created opportunity number:' + n);
    }
    public static void addContact(){
        list<account> accList = [SELECT id, Name FROM Account WHERE id NOT IN (SELECT AccountId FROM Contact)];
        list<contact> listCont = new list<contact>();
        for(account item: accList){
            contact cont = new contact();
            cont.lastName = item.Name;
            cont.accountid = item.id;
            listCont.add(cont);

        }
        if(!listCont.isEmpty()){
            insert listCont;
        }
        

    }

    public static void deleteOpp(){

        List<Opportunity> opplist = [select id, name, amount, stageName FROM Opportunity WHERE Amount<20000 AND StageName = 'Closed Lost'];

        System.debug(opplist.size());
        delete opplist;
        System.debug(opplist.size());

    }
   

}
