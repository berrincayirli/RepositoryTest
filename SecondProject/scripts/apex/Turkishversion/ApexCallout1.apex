List<Account> accList = new List<Account>();

Account acc1 = new Account();
acc1.Name = 'Integration Test 1';
acc1.AnnualRevenue = 100000;
accList.add(acc1);

Account acc2 = new Account();
acc2.Name = 'Integration Test 2';
acc2.AnnualRevenue = 200000;
accList.add(acc2);

System.debug(accList);

string accListJson = JSON.serialize(accList);

System.debug('Listenin Json Formati : ' + accListJson);

List<Account> accListNew = (List<Account>)JSON.deserialize(accListJson, List<Account>.class);

System.debug('New List ' + accListNew);

//Amountu 10000 den buyuk bir tane Opportunity recordun bilgisini alip JSON formata cevirip debug konsolda yazdiralim..

Opportunity opp = [Select id, name, Amount, stageName from Opportunity where Amount>10000 limit 1];
string oppJson = JSON.serialize(opp);
system.debug(oppJson);

//Case objesinden Contactlara bagli olan 2 tane case recordu getirelim. CaseNumber, Subject, Description, Contact.FirstName, Contact.LastName, Account.Name bilgileri ile beraber gelsin ve bu record bilgilerini JSON formata cevirelim..

List<Case> caseList = [Select id, CaseNumber, Subject, Description, Contact.firstName, Contact.LastName, Account.Name from Case limit 2];

string caseListJson = JSON.serialize(caseList);
System.debug(caseListJson);

string jsonAcc = '{"Name":"JSONToApex","Type":"Prospect","AnnualRevenue":500}';
Account acc3 = (account)JSON.deserialize(jsonAcc, Account.class);
insert acc3;
System.debug(acc3);