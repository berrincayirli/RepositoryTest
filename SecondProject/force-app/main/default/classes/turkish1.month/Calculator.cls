public  class Calculator {
    public decimal dynamicCalulationMethod(Decimal a, Decimal b, String c) {
    
    switch on c {
        when 'Addition' {
            return a + b;
            
        }
        when 'Subtraction' {
            return a - b;
           
        }
        when 'Division'{
            return a / b;
            

        }
        when 'Multiplication'{
            return a * b;
            
        }
        when else {
            return null;
        }
        
    }
    }
}
