@istest
public class operationsHelperTest {
    @istest
    public static void largestOutOfTwoNumbersTest() {
        System.assertEquals(2, OperationsHelper.largestOutOfTwoNumbers(2, 1));
        System.assertEquals(2, OperationsHelper.largestOutOfTwoNumbers(2, 2));
        System.assertEquals(3, OperationsHelper.largestOutOfTwoNumbers(2, 3));


    }
    @isTest
     public static void smallestOutOfThreeNumbersTest(){
     System.assertEquals(0, OperationsHelper.smallestOutOfThreeNumbers(2,1,0));
     System.assertEquals(0, OperationsHelper.smallestOutOfThreeNumbers(2,0,2));
     System.assertEquals(0, OperationsHelper.smallestOutOfThreeNumbers(0,1,2));
     System.assertEquals(0, OperationsHelper.smallestOutOfThreeNumbers(8,0,0));
     System.assertEquals(1, OperationsHelper.smallestOutOfThreeNumbers(1,1,1));
    }
    @isTest
    public static void sumOfPositiveIntegerTest(){
     System.assertEquals(3, OperationsHelper.sumOfPositiveInteger(2));
     System.assertEquals(0, OperationsHelper.sumOfPositiveInteger(0));
     System.assertEquals(null, OperationsHelper.sumOfPositiveInteger(-1));
    }
}
  
