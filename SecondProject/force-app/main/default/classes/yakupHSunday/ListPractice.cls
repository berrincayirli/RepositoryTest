public  class ListPractice {
    public static void pozNegNum(List<Decimal> a) {


        List<Decimal> pztf = new List<Decimal>();
        List<Decimal> ngtf = new List<Decimal>();

        for(Decimal item : a){

            if(item < 0){
                ngtf.add(item);
            }else{
                pztf.add(item);
            }
        }
        System.debug('the pozitif numbers are: ' + pztf);
        System.debug('the negative numbers are: ' + ngtf);
        
    }
}
