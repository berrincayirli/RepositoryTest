public class ParametreliMetotlar11 {
    //Bu metot parametre olarak string bir deger alsin. Bu stringin karakter sayisini return etsin.
    public integer uzunluk(string text){
        integer uzn = text.length();
        return uzn;
    }

    //Bu metot parametre olarak integer bir deger alsin. Bu integer degerin kac rakamdan olustugunu return etsin.
    public integer rakamSayisi(integer sayi){
          string strSy = String.valueOf(sayi);
          //return strSy.length();
          integer rkmSys = strSy.length();
          return rkmSys;
    }

    // 2 integer sayinin toplamini return etsin.
    public integer sum(integer a, integer b){
        return a + b;
    }

    // 2 integer sayinin farkini return etsin.
    public integer cikarma(integer c, integer d){
        return c - d;
    }

    // kitap, fiyati, adet seklinde 3 parametreli metot yazin. Bu metot bize bu kitap ile ilgili odenecek miktari system debug ile yazdirin. ..... kitabindan .... adet aldiniz. odemeniz gereken miktar = ...
    public void kitapOdemesi(string kitapAdi, integer adet, decimal fiyat){
        Decimal toplamFiyat = adet*fiyat;
        System.debug(kitapAdi + ' kitabindan ' + adet + ' adet aldiniz. Odemeniz gereken miktar = ' + toplamFiyat);
    }

}