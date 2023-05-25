@istest
public class IfAndforLoopTest {
    // Bir değeri return etmeyen veya bişey üretmeyen  metotlarda test sadece o metodu istenen parametrelerle cagırarak yapılır.
    @istest
    private static void IfNumbersTest() {
        ifAndforLoop11.ifnumbers(9, 7);
        ifAndforLoop11.ifnumbers(9, 11);
        ifAndforLoop11.ifnumbers(9, 9);
    }
    @istest
    private static void ifBreadTest(){
        ifAndforLoop11.ifBread('simit', 3);
        ifAndforLoop11.ifBread('kek', 2);
        ifAndforLoop11.ifBread('ekmek', 1);
        ifAndforLoop11.ifBread('adana', 1);
    }
    @istest
    public static void forLoopSumNumbersTest(){
        Integer tplm = ifAndforLoop11.forLoopSumNumbers(5);
        System.assertEquals(15, tplm);

        Integer tplm2 = ifAndforLoop11.forLoopSumNumbers(-5);
        System.assertEquals(null, tplm2);



    }
}
