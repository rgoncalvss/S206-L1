package booker;

import com.intuit.karate.junit5.Karate;

class bookerRunner {
    
    @Karate.Test
    Karate testeBooker() {
        return Karate.run("booker").relativeTo(getClass());
    }    

}
