public class PlayingWithDates {
    public void printDateOutput() {
        date today1 = date.today();
        System.debug(today1);
        date invention1 = date.newInstance(2789, 11, 5);
        System.debug(invention1);
        date invention2 = date.newInstance(1459, 3, 4);
        System.debug(invention2);


        Integer dayInt = 25;
        Integer monthInt = 12;
        Integer yearInt = 1900;
        date invention3 = date.newInstance(yearInt, monthInt, dayInt);
         System.debug(invention3);
    }
}
