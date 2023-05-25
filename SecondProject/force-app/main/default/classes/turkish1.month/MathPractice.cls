public class MathPractice {
    public decimal practiceOne() {
        Decimal a = 12.58;
        Decimal b = 15.28;
        Decimal dikdortgenC = 2*a +  2*b;
        System.debug('Diktortgenin cevresi : ' + dikdortgenC);
        return dikdortgenC;

    }
    public Decimal practiceTwo(){
     Decimal boy = 1.69;
     Decimal kilo = 59;
     Decimal vki = kilo.divide(boy, 3);
     Decimal vki1 = vki.divide(boy, 3);
     System.debug('Vucut kitle indeksim : ' + vki1);
     
     return vki1;
    }
}
