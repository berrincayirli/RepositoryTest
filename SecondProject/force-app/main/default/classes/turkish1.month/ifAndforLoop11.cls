public class ifAndforLoop11 {
    // a ve b iki sayı karsılastırmalarını yapalım:
    public  static void ifnumbers(Integer a, Integer b) {
        if (a>b) 
        system.debug(a + 'sayisi ' + b + 'sayisindan buyuktur.');
        else if (b>a)
        system.debug(b + 'sayisi ' + a + 'sayisindan buyuktur.');
        else 
        system.debug(a + 'sayisi ' + b + 'sayisina esittir.');
    }

    /* 2. Ekmek, simit ve kek siparişlerinden birini istediğiniz adet ile beraber alan 2 parametreli bir metot yazın. size toplam ödeyeceğiniz miktarı mesajla beraber yazsın. 
    Metot: ifBread
    Ekmek : 1$ 
    Simit : 2$
    Kek : 3$ */

    public static void ifBread(string order, Integer piece){
        Integer Amount = 0;
        if (order == 'ekmek') {
            Amount = piece*1;
        }else if (order == 'Simit') {
            Amount = piece*2;
        }else if (order == 'Kek') {
            Amount = piece*3;
        }else {
            System.debug('Undifined order..');
        }

        if (Amount != 0 ) {
            System.debug(piece + 'tane ' + order + ' aldiniz , odeceginiz miktar =  ' + Amount);
        }
    }


    public static void ifBread2(string order, Integer piece){
        Integer hesap = 0;
     switch on order {
        when  'ekmek'{
            hesap = piece*1;
        }
        when  'kek'{
            hesap = piece*3;
        }
        when  'simit'{
            hesap = piece*2;
        }   
        when else {
        System.debug('Gecersiz siparis!');
            
        }
     }
     if (hesap != 0) {
        System.debug(piece + 'tane ' + order + ' aldiniz , odeceginiz miktar =  ' + hesap);
        
     }

    } 
    //3. Parametre olarak integer 'n' sayısını alan, 1'den n'e kadar olan sayıların toplamını return eden metot yazin.
    
        
    public  static Integer forLoopSumNumbers(Integer n){

        Integer sum = 0;
        if (n>0) {
            sum = 0;
       
        for (Integer i = 1 ; i <= n ; i++) {
            //sum = sum + 1
            sum += i;
            System.debug('i =  ' + i);
            System.debug(sum);
        }
        }else {
            System.debug('sayiniz 0 veya 0 dan kucuk..');
        }

        return sum;
    }
    // son soruyu while ile yapalım:

    public static Integer whileSumNumbers(Integer n){
        Integer sum = 0;
        Integer i =1;
        while (i <= n) {
        sum += i;
        System.debug('sum = ' + sum);
        i++ ;
        System.debug('i = ' + i);
        }
        System.debug('return toplamı :' + sum);
        return sum;
    }


}   