List<String> listCity = new List<String>{'Madrid', 'Amsterdam' , 'İstanbul', 'New York', 'Paris', 'Toronto' };
System.debug('The list size : ' + listCity.size());
System.debug('the first item : ' + listCity.get(0));
System.debug('the last item : ' + listCity.get(5));
Boolean result1 = listCity.contains('İstanbul');
System.debug('is istanbul contain the list: '+ result1);
Boolean result2 = listCity.contains('Roma');
System.debug('is Roma contain the list: '+ result2);


for(string eachItem : listCity){
    System.debug(eachItem + ' City');
}

Set<String> setCity = new Set<String>();
system.debug('The set is : ' + setCity.addAll(listCity));
setCity.remove('Paris');
setCity.add('İstanbul');
setCity.add('Madrid');
system.debug('the new set is: '+ setCity  + ' The new size is :' + setCity.size());
setCity.clear();
system.debug('is the set is empty : ' +setCity.isEmpty());


