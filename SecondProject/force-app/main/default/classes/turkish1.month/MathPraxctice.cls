public class MathPraxctice {
    public integer PracticeFive(Integer a, integer b) {
      
        integer toplam = 0;
        for (integer i = a ; i<= b; i++ ) {
            toplam += i;
        } 
        System.debug('4 ile 9 arasindaki sayilarin toplami: '+ toplam);
        return toplam;
    }   
}
