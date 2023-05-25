/*In a new anonymous apex file, create a Map named as StudentRank, Key as Student name and Value as Rank.
1. Decide the data type for key and value.
2. Store 4 students' names and their ranks.
3. Print all the students' names one by one.
4. Print all the student names and rank one by one in the below format.
*/

map<string, Integer> StudentRank = new map<string, Integer>();
StudentRank.put('Berrin', 90);
StudentRank.put('Nilgün', 80);
StudentRank.put('Melike', 95);
StudentRank.put('Muhammed', 60);
StudentRank.put('Ahmet', 100);

for(String item : StudentRank.keySet()){
    System.debug(item);
    System.debug('Student Name ' + item + '  and Rank ' + StudentRank.get(item));
}

// Question 5: – Set and Set Class Methods
// 1. In an anonymous apex file, Create a set of strings named as uniqueNameSet with “Tom” and “Jerry” as the default values in it.
// 2. Print the size of the above created Set.
// 3. Add new elements in the uniqueNameSet.
// 4. Check if uniqueNameSet contains your name?
// 5. Check if the uniqueNameSet is Empty.
// 6. Clear the set and print it.
// 7. Now check if the set is empty or not.
// 8. Is it possible to get an element from a set with the help of an index? If Yes, then please write the
// code for the same and If No, then why is it not possible
// 9. List down at the differences between set and list.

set<string> uniqueNameSet = new set<string>{'Tom', 'Jerry'};
System.debug('The size of set : ' + uniqueNameSet.size());
uniqueNameSet.add('Bunny');
uniqueNameSet.add('Slvester');
uniqueNameSet.add('Pink Panter');
System.debug('Full set is : ' + uniqueNameSet);
Boolean control = uniqueNameSet.contains('Berrin');
System.debug('if the set contains Berrin? :' + control);
System.debug('is set is empty? : ' + uniqueNameSet.isEmpty());
uniqueNameSet.clear();
System.debug(uniqueNameSet);
System.debug('is set is empty? : ' + uniqueNameSet.isEmpty());

// Question 2: Maps – Iteration
// 1. Store the currency exchange rate values in a Map named ‘currISOCodeAndExchangeRateMap’ for any 5 currency ISO codes. Like below:
// a. AUD => 0.73
// b. CAD => 0.78
// c. EUR => 1.13
// d. NZD => 0.68
// e. INR => 0.013
// 2. Fetch the currency conversion rate for any one currency ISO code and print it.
// 3. Check if the above Map has a conversion rate for SAD ISO code.
// 4. Collect all the currency ISO codes from currISOCodeAndExchangeRateMap for which the
// conversion rate is >= 1 in one variable and other iso codes in other variables.
// Expected Output: EUR – In one variable. AUD, CAD, NZD, and INR – In another variable.

//1) 
Map<String, Decimal> currISOCodeAndExchangeRateMap = new Map<String, Decimal>{'AUD' => 0.73, 'CAD' => 0.78, 'EUR' => 1.13, 'NZD' => 0.68, 'INR' => 0.013};
System.debug(currISOCodeAndExchangeRateMap);
//2)
System.debug((currISOCodeAndExchangeRateMap.get('CAD')));
//3)
Boolean checkSad = currISOCodeAndExchangeRateMap.containsKey('SAD');
System.debug('checkSad ' + checkSad);
//4)
Set<String> greaterOne = new Set<String>();
Set<String> lesthOne = new Set<String>();

Set<String> keySet = currISOCodeAndExchangeRateMap.keySet();

for(string item : keySet){
    decimal Val = currISOCodeAndExchangeRateMap.get(item);
    if(Val>=1){
        greaterOne.add(item);
    }else{
        lesthOne.add(item);
    }
}

System.debug('greaterOne ' + greaterOne);
System.debug('lesthOne ' + lesthOne);







