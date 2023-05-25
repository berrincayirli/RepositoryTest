public class OperationsHelper {
    public decimal largestOutOfTwoNumbers(Decimal a, Decimal b) {
        if (a>b) {
            return a;
        }
        else {
            return b;
        }

    }
    public decimal largestOutOfTwoNumbers1(Decimal a, Decimal b) {
       return Math.max(a, b);
    }
    public Decimal smallestOutOfThreeNumbers(Decimal a, decimal b, Decimal c){
        if (a<b && a<c) {
            return a;
        }
        else if (b<a && b<c) {
            return b;
        }
        else {
            return c;
        }
            
        
    }
    public Decimal smallestOutOfThreeNumbers2(Decimal a, decimal b, Decimal c){
       return math.min(Math.min(a, b), c);
            
        
    }

    public Integer sumofPositiveIntegers(Integer n){
       if (n <= 0) {
        System.debug('We are not calculating the sum for negative numbers');
        return null;
       }
       Integer sum = 0;
       for (Integer i= 0; i <= n; i++) {
        sum += i;
       }  
    
       return sum;
    
    }
}
