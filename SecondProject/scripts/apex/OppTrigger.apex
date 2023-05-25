list<Opportunity> oppList = new list<Opportunity>();
Opportunity opp = new Opportunity();
opp.name = 'Ahmet';
opp.closeDate = date.newInstance(2022, 10, 25);
opp.amount = 150000;
opp.stageName ='Close Won';
opplist.add(opp);
Opportunity opp1 = new Opportunity();
opp1.name = 'Mehmet';
opp1.closeDate = date.newInstance(2022, 12, 30);
opp1.amount = 250000;
opp1.stageName ='Close Lost';
opplist.add(opp1);
insert oppList;












