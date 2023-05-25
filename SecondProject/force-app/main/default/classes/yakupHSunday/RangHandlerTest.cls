@isTest
public  class RangHandlerTest {
    @istest
    public static void rankPrizeTest() {
        string prize1 = RankHandler.rankPrize(1);
        System.assertEquals('Gold', prize1);

        string prize2 = RankHandler.rankPrize(2);
        System.assertEquals('Silver', prize2);

        string prize3 = RankHandler.rankPrize(3);
        System.assertEquals('Bronze', prize3);

        string prize4 = RankHandler.rankPrize(10);
        System.assertEquals('Top 10', prize4);

        string prize11 = RankHandler.rankPrize(11);
        System.assertEquals('Participation certificate', prize11);
        
    }
    @isTest
    private static void rankPrizeSwitch() {
        System.assertEquals('Gold', RankHandler.rankPrizeSwitch(1));
        System.assertEquals('Silver', RankHandler.rankPrizeSwitch(2));
        System.assertEquals('Bronze', RankHandler.rankPrizeSwitch(3));
        System.assertEquals('Top 10', RankHandler.rankPrizeSwitch(8));
        System.assertEquals('thank you for participating', RankHandler.rankPrizeSwitch(11));
    }
}
