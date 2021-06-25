/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shikshasetu.helper;

import java.util.Random;

/**
 *
 * @author SantDeveloper
 */
public class CreateRandomNumber {
    private static int random;
    
    public static int createRandomNumber()
    {
        Random Rd= new Random();
        random=Rd.nextInt(1000000);
        return random;
    }
    
    
}
