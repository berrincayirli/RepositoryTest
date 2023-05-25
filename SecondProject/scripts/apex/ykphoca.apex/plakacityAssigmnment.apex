Map<Integer, String> plakaCity = new Map<Integer, String>();

//1)
plakaCity.put(34,'Istanbul');
plakaCity.put(16, 'Bursa');
plakaCity.put(35, 'izmir');
plakaCity.put(42, 'Konya');
plakaCity.put(27, 'Antep');
//2)
set<Integer> plaka = plakaCity.keySet();
System.debug('Map te 34 var mi? : ' + plaka.contains(34));
System.debug('Map te 61 var mi? : ' + plaka.contains(61));

//3)
System.debug(plakaCity.size());

//4)
plakaCity.remove(16);
System.debug(plakaCity);

//5)
System.debug(plaka);
List<String> city = plakaCity.values();
System.debug(city);
//6)
for (integer eachplaka : plaka){
    System.debug(eachplaka + ' plakalı sehrimiz  ' + plakaCity.get(eachplaka));
}