/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package client;

/**
 *
 * @author pascal
 */
public class Coordinates {
    
    public double x,y;
    
    
    public Coordinates(double pX,double pY)
    {
        x = pX;
        y = pY;
    }
    
    public String toString()
    {
        return x + "," + y;
    }
    /*
    public void setX(double pX) 
    {
        x = pX;
    }
    
    public void setY(double pY) 
    {
        y = pY;
    }
    
    public double getX()
    {
        return x;
    }
     * */
}