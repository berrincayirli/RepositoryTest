public  class MyCity2 {
    public void cityInformation(){
       
        string cumhuriyetinilani = '29/10/1923';
        System.debug('Turkiye Cumhuriyetinin kuruluş tarihi: ' + Cumhuriyetinilani);

        time gundogumu = time.newInstance(7, 33, 0, 0);
        System.debug('Ispartada gundugumu: ' + gundogumu );
        
        date gunonce = date.newInstance(2019, 11, 18);
        System.debug(' Bugunden 36 ay önceki tarih: ' + gunonce);
    }

    
}    
