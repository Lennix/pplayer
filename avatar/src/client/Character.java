/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package client;

/**
 *
 * @author pascal
 */
public class Character {
    public Coordinates coordinates;
    public Attributes attributes;
    public Skills skills;
    public Skin skin;
    
    public Character(Coordinates pCoordinates,Attributes pAttributes,Skills pSkills,Skin pSkin)
    {
        coordinates = pCoordinates;
        attributes = pAttributes;
        skills = pSkills;
        skin = pSkin;
    }
}
