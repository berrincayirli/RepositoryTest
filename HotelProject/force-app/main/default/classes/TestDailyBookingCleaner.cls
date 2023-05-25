@isTest
public class TestDailyBookingCleaner {

    @istest
    public static void Tester() {
        Hotel_Manager__c hm  = new  Hotel_Manager__c();
        hm.Name = 'HotelMan';
        hm.Email__c = 'HotelMan1@gmail.com';
        hm.Phone__c = '34567898765';
        insert hm;

        Booking__c booking = new Booking__c();
        booking.Hotel_Manager__c = hm.Id;
        booking.name__c = 'Booking13';
        booking.Check_in_Date_Time__c = Date.newInstance(2021, 10, 27);
        booking.Check_out_Date_Time__c = Date.newInstance(2021, 11, 27);
        booking.Status__c = 'Completed';
        booking.Max_Rooms__c = 5;
        insert booking;

        Booking__c booking1 = new Booking__c();
        booking1.Hotel_Manager__c = hm.Id;
        booking1.name__c = 'Booking14';
        booking1.Check_in_Date_Time__c = Date.newInstance(2021, 9, 27);
        booking1.Check_out_Date_Time__c = Date.newInstance(2021, 10, 27);
        booking1.Status__c = 'Completed';
        booking1.Max_Rooms__c = 3;
        insert booking1;

        Test.startTest();
        DailyBookingCleaner obj = new DailyBookingCleaner();
        obj.execute(null);
        Test.stopTest();

        Integer bookingCount = [Select Count() FROM Booking__c];
        system.assertEquals(0, bookingCount);
    }
}