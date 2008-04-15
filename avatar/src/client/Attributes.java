/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package client;

/**
 *
 * @author pascal
 */
public class Attributes {

    public int level,experience,hitpoints,energypoints,attack,defense;
    double speed;
    Profession profession;
    public Attributes(int pLevel,int pExperience,Profession pProfession,int pHitpoints,int pEnergypoints,int pAttack,int pDefense,double pSpeed)
    {
        level = pLevel;
        experience = pExperience;
        profession = pProfession;
        hitpoints = pHitpoints;
        energypoints = pEnergypoints;
        attack = pAttack;
        defense = pDefense;
    }
}
