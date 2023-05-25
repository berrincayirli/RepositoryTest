
public class ListPractice1 {
     
    public static List<Planets> planetList = new List<Planets>();

    public static String addPlanet(String planetName, Integer planetNumber, Integer numberOfMoons){
        
        String message='';

        if(planetName == null || planetName == ''){
           message = 'Planet without name can not be added to the list';
        }else{
            Planets p = new Planets();
            p.planetName = planetName;
            p.planetNum = planetNumber;
            p.moonNum = numberOfMoons;

            planetList.add(p);

            message = 'Planet added successfully';
        }

        return message;
      
    }

}

// list => [{"planetName":"Saturn", "positionNumber":35, "numOfMoons":1}, {"planetName":"Dünya", "positionNumber":20, "numOfMoons":2}]
// list => ["elma", "Armut"]
// list => [23,65,78]


