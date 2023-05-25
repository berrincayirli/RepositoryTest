list<Decimal> liste= new list<Decimal>{11,20.5,35.7,15,67.8,100};
decimal sonuc= OpparationHelper1.SumofList(liste);
system.debug(liste+ ' toplami= '+ sonuc);
list<Decimal> liste1= new list<Decimal>();
decimal sonuc1= OpparationHelper1.sumOfList(liste1);
system.debug(liste1+ ' toplami= '+ sonuc1);

decimal avg= OpparationHelper1.AverageList(liste);
system.debug('avg= '+ avg);


decimal high = OpparationHelper1.Highest(liste);
System.debug('the highest item is: ' + high);


decimal lowst = OpparationHelper1.Lowest(liste);
System.debug('the Lowest item is: ' + lowst);