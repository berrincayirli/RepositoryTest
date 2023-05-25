system.debug(AccConAndOppOperations.allAccount());

List<Account> newAcc = AccConAndOppOperations.allAccount();
for(account item : newAcc ){
    System.debug(item);
}

system.debug(AccConAndOppOperations.opplist('web','Close Lost'));

AccConAndOppOperations.listAcc();

AccConAndOppOperations.OppSum();
system.debug(AccConAndOppOperations.ClosedWonAccount('Closed Won'));
System.debug(AccConAndOppOperations.cont());
AccConAndOppOperations.createContact('0018d00000LAnKpAAL');
AccConAndOppOperations.updateTop10();
AccConAndOppOperations.oppCreate('0018d00000LAnKxAAL', 3);
AccConAndOppOperations.addContact();
AccConAndOppOperations.deleteOpp();