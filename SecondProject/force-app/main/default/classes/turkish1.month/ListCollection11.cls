public class ListCollection11 {
    // parametre olarak string bir liste alan bir metot yazin. Bu metot listenin her bir elemanini tek tek yazdirsin.
    public static void printListEachItem(List<String> adList) {
        // for ile yapabilirim..
        integer counter = 1;
        for (string eachItem : adList) {
            System.debug('for ' + counter + ' defa dondu');
            System.debug(eachItem);
            counter++;
        }
    }
    //decimal bir listeyi parametre olarak alan ve bu listenin elemanlarinin toplamini donduren(return eden) bir metot yazin.
    public static decimal listEachItemSum(list<decimal> decList) {
        decimal toplam;
        // gelen liste dolu mu bos mu kontrolu yapilir dolu ise islem yapilir bossa islem yapilmaz.
        //size()
        if (decList.size()>0) {
            toplam = 0;
            for (decimal item : decList) {
                //toplam = toplam + item;
                toplam += item;
            }
        }
        //isEmpty()
        /*if (!decList.isEmpty()) {
            toplam = 0;
            for (decimal item : decList) {
                //toplam = toplam + item;
                toplam += item;
            }
        }*/

        return toplam;
    }

    //decimal bir listenin elemanlarinin aritmetik ortalamasini donduren(return eden)bir metot yazin?
    public static decimal listItemsAverage(List<decimal> avList) {
        decimal average;
        if (!avList.isEmpty()) {
            decimal toplam = listEachItemSum(avList);
            integer elemanSayisi = avList.size();
            average = toplam/elemanSayisi;
        }

        return average;
    }
}