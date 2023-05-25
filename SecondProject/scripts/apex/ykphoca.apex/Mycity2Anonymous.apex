MyCity2 c1 = new MyCity2();
c1.cityInformation();

date BrtDay = date.newInstance(1984, 08, 17);
System.debug('My Birthday date: ' + BrtDay);
Integer year = BrtDay.year();
Integer month = BrtDay.month();
Integer day = BrtDay.day();
Integer dogumgunum = day + month + year;
System.debug( dogumgunum + ' = ' +  day + ' + ' + month + ' + ' + year );

MyCity2 c2 = new MyCity2();

date marieC = date.newInstance(1867, 11, 7);
System.debug(' Marie Curie/nin dugum tarighi :' + marieC);
date bugun = date.today();
Integer gunfarki = marieC.daysBetween(bugun);
System.debug('Marie Curienin dogumundan bugune '+ gunfarki +' gun geçmisitr.');
Integer ayfarki = marieC.monthsBetween(bugun);
System.debug(' Marie Curienin dogumundan bugune '+ ayfarki +' ay geçmisitr.');
Integer yilfarki = bugun.year() - marieC.year();
System.debug('Marie Curienin dogumundan bugune '+ yilfarki + ' yıl  geçmisitr.');
Boolean artikyil = Date.isLeapYear(marieC.year());
System.debug('Marie Curie nin dogum yılı artıkyıl mı-->  ' + artikyil);
