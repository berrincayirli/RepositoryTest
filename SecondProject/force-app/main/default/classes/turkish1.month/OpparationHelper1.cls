public class OpparationHelper1 {
    public static decimal SumofList(list<decimal> a) {
        Decimal sum = 0;
        if (a.isEmpty()) {
            System.debug('Please provide values to do the operation');
            return null;
        }else {
        
        for (decimal item : a) {
            sum += item;
        }
            return sum;
        }
        
    }
    public static decimal AverageList( list<decimal> a){
        decimal sum= SumofList(a);
        decimal size= a.size();

        return sum/size;
    }

    public static decimal Highest(list<Decimal> a) {
        decimal hi=0;
        for (decimal item : a) {
            if (item > hi) {
                hi = item;
            }
        }
        return hi;
    }


    public static Decimal Lowest(list<Decimal> a){
        decimal low = 0;
        for (decimal item : a) {
            if (item < low) {
                low = item;
            }
        }
        return low;
    }
}
