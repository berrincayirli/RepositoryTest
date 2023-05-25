
String message1 = ListPractice1.addPlanet('Saturn',20, 4);
System.debug(message1);
// System.debug('Birinci :'+ ListPractice1.planetList);

String message2 = ListPractice1.addPlanet('', 2, 2);
System.debug(message2);
// System.debug('İkinci :'+ListPractice1.planetList);

String message3 = ListPractice1.addPlanet('Venüs',11, 8);
System.debug(message3);

System.debug('Üç :'+ ListPractice1.planetList);

for (Planets item : ListPractice1.planetList) {
    
    System.debug(item);
}

for (Integer i = 0; i < ListPractice1.planetList.size(); i++) {
    System.debug((i+1)+'.Planet :'+ ListPractice1.planetList[i]);
}
















