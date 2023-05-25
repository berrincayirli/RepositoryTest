public class Ogrenci11 {

    public static Integer ogrenciSayisi = 0;
    //public Integer oSayisi = 0;

    public string firstName;
    public string lastName;
    private string schoolName = 'Dream School';
    public string className;
    public string language;
    public Boolean art;
    public Boolean sport;
    public integer ingGrade;
    public integer mathGrade;
    public Integer fenGrade;

    public Ogrenci11(){
        ogrenciSayisi++;
        //oSayisi++;
        System.debug('yeni bir kayit yapıldi. ogrenci sayiniz  :' + ogrenciSayisi);
        //System.debug('static olmayan ogrenci sayiniz  :' + oSayisi);
    }
        public ogrenci11(string fName, string lName, integer ingNot){
        //this() parametresiz constructoru calistirir..
        this();
        this.firstName = fName;
        this.lastName = lName;
        this.ingGrade = ingNot;
    }
}
