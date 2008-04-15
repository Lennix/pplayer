/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package client;

/**
 *
 * @author pascal
 */
public class Client {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Client client = new Client();
    }
    
    
    public Client()
    {
        Profession water = new Profession();
        Coordinates startCoordinates = new Coordinates(0,0);
        Attributes attributes = new Attributes(1,0,water,100,100,1,1,1.0);
        Skills skills = attributes.profession.skills;
        Character character = new Character(startCoordinates,attributes,skills,new Skin());
        
        debug("Coords: " + character.coordinates.toString());
    }
    
    /**
     * @param text This is the text to output
     */
    public void debug(String text)
    {
        System.out.println(text);
    }

}
