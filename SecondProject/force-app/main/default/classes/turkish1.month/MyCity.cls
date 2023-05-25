
public  class MyCity {
    public void cityInformation(){
       
        string cumhuriyetinilani = '29/10/1923';
        System.debug('Turkiye Cumhuriyetinin kuruluş tarihi: ' + Cumhuriyetinilani);

        time gundogumu = time.newInstance(7, 33, 0, 0);
        System.debug('Ispartada gundugumu: ' + gundogumu );
        
        date gunonce = date.newInstance(2019, 11, 18);
        System.debug(' Bugunden 36 ay önceki tarih: ' + gunonce);
        
    }

    public void stringMethod(){
// Ödev a)
        String cumle1 = 'I am a Salesforce Developer';
        string letter = 'force';
        Boolean kontrol1 = cumle1.contains('force');
        System.debug('contains metodu ; "I am a Salesforce Developer" cümlesi içinde ' + letter + '  kelimesi ' + kontrol1);
//  Ödev b)
        System.debug(cumle1 + 'cümlesi  ' + cumle1.length()+ '   karakter içerir.');

//  Ödev c)
    String cumle2 = cumle1.toUpperCase();
    System.debug(cumle2 + ' ' + cumle1+ 'in toUpperCase() metodu ile düzenlenmiş halidir.');
    
    }

    public void dateMethod(){
        date bugun = date.today();
        System.debug(bugun);
        Datetime zaman = Datetime.now();
        System.debug(zaman);
        Datetime sonra = zaman.addHours(50);
        System.debug(sonra);
    }
}