DummyDataCreation.acclist(5);

list<account> lst = [select id, name from account limit 5];
DummyDataCreation.ContList(lst,3);

list<contact> lst1 = [select id, AccountId, lastName from contact];
DummyDataCreation.caselist(lst1); 