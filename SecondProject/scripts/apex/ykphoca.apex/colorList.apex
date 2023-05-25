List<String> colorList = new List<String>();
colorList.add('Yellow');
colorList.add('white');
colorList.add('Red');
colorList.add('Black');
colorList.add('Purple');
//a)
System.debug('list size: ' + colorList.size());
//b)
Boolean result1 = colorList.contains('Red');
system.debug('Is there Red ? = ' + result1);
// c) 
System.debug('the last element is : ' + colorList.get(4));
//d)
system.debug('the Uppercase : ' + colorList[4].toUpperCase());
//e)
List<String> colorCodeList = new List<String>();
colorCodeList.add('#F28456');
colorCodeList.add('#D23456');
colorCodeList.add('#H23459');
colorCodeList.add('#L23456');
colorCodeList.add('#B23456');
//f)
Boolean result2 = colorList.equals(colorCodeList);
system.debug('Are these list equal: ' + result2);
// g) 
colorList.addAll(colorCodeList);
System.debug(colorList);






