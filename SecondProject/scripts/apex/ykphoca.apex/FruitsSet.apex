//A)
Set<String> fruits = new Set<String>{'Pear','Apple', 'Banana', 'Cherry','Mulberry'};
for(String item: fruits){
system.debug(item);

}
// B)
system.debug('the size of set :' + fruits.size());
//C)
system.debug(fruits.add('Apricot'));
//D)
Boolean result1 = fruits.contains('Apricot');
System.debug('Is Apricot in the set? :' + result1);
//E)
system.debug('Is the set empty? : ' + fruits.isEmpty());






