/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import DAO.GlobalInfoDAO;
import beans.Juego;

/**
 *
 * @author hector
 */
public class Test {
    
    public static void main(String[] args){
        
        
        Juego j= new Juego("LeagueOfLegends");
        GlobalInfoDAO g= new GlobalInfoDAO();        
        g.GuardarNuevoJuego("LeagueOfLegends");
        
        
    }
    
    
}