public class ValidateAddress {
    public void ValidateHomeAddress() {
        string houseName = 'Calender';
        String streetName = 'Oak';
        String cityName = 'TexasCity';
        String stateName = 'Texas';
        String stateISO = 'TX';
        String countryName = 'America';
        String countryISO = 'usa';
        // İ)Number of Cahrt.:
        Integer SNleng =streetName.length();
        System.debug('The lenght of the street name is :' + SNleng);
        Boolean checkHouseName = streetName.contains(houseName);
        System.debug('checkHouseName :' + checkHouseName);
        
        Boolean checkStateISO = streetName.contains(stateISO);
        if (checkStateISO) {
            System.debug('the streetname contains the state iso code');
        }
        
        String upperstateISO = stateISO.toUpperCase();
        System.debug(UpperstateISO);
        String uppercountryISO = countryISO.toUpperCase();
        System.debug(uppercountryISO);
        String uppercountryName = countryName.toUpperCase();
        System.debug(uppercountryName);
        String lowercityName = cityName.toLowerCase();
        System.debug(lowercityName);
        String lowerstateName = stateName.toLowerCase();
        System.debug(lowerstateName);


        String Address = houseName + ' ' + streetName + ' ' + cityName + ' ' + stateName +  ' ' + stateISO + ' ' + countryName + ' ' + countryISO;
        System.debug(Address);

    }
        



}
