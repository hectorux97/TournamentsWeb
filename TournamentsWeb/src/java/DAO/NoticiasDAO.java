/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import beans.Noticia;
import java.sql.*;
import java.util.Date;
import java.util.ArrayList;
/**
 *
 * @author JF
 */
public class NoticiasDAO extends DAOExtend{
    
    public NoticiasDAO(){
       super();
    }    
    
    public boolean subirNoticia(Noticia minoticia){
             
        
        try{
           
            Statement st=conexion.createStatement();
            
            String titular = minoticia.getTitular();
            String resumen = minoticia.getResumen();
            String texto = minoticia.getNoticiaTexto();
            String img = minoticia.getImgNoticia();
            String tipo = minoticia.getTipoNoticia();
            String autor = minoticia.getAutor();
            
            
            //He intentado seguir el orden y he aññadido al final fecha y autor 
            st.executeUpdate("INSERT INTO noticias VALUES (NULL,'"+titular+"','"+resumen+"','"+texto+"','"+img+"','"+tipo+"','"+autor+"',1,CURRENT_TIMESTAMP())");
           
            return true;
            
        }catch(SQLException e){}
        
        return false;
    }
    /* ESTO NO SIRVE, Lo dejo por si aca
    public Noticia mostrarNoticia(int idNot){
        
        Noticia minoticia = new Noticia();
        try{
            Statement st=conexion.createStatement();
            ResultSet rs= st.executeQuery("SELECT * FROM noticias WHERE status = '1' AND idNoticias ='"+idNot+"'");
                
                minoticia.setIdNot(idNot);
                minoticia.setTitular(rs.getString("titular"));
                minoticia.setResumen(rs.getString("resumen"));
                minoticia.setNoticiaTexto(rs.getString("textoNoticia"));
                minoticia.setImgNoticia(rs.getString("imagenNoticia"));
                minoticia.setAutor(rs.getString("autor"));
                Date date = new java.util.Date((rs.getTimestamp(9)).getTime());
                minoticia.setFechaNoticia(date);
                minoticia.setStatus(rs.getInt("status"));
            
            return minoticia;
           
        }catch(SQLException e){}
        
        return null;
    }*/
    
    
    //ELIMINAR NOTICIA
    
    public boolean eliminarNoticia(int idNot){
         try{
            Statement st=conexion.createStatement();
            st.executeUpdate("UPDATE noticias SET status = 0 WHERE idNoticias ='"+idNot+"'"); 
            return true;
            
        }catch(SQLException e){}
        
        return false;
    }
    
    //Mostrar Noticias por Tipología
    //Aqui vienen los cambios que podríamos hacer con el formato date
    
    public ArrayList<Noticia> getNotiasTipo(String tipoNoticia){
        
        ArrayList<Noticia> listaTipoNoticias= new ArrayList<>();
        try{
            Statement st=conexion.createStatement();
            ResultSet rs= st.executeQuery("SELECT * FROM noticias WHERE status=1 AND tipoNoticia ='"+tipoNoticia+"'");
            
            while(rs.next()){
                
                Noticia minoticia= new Noticia();
                minoticia.setIdNot(rs.getInt("idNoticias"));
                minoticia.setTitular(rs.getString("titular"));
                minoticia.setResumen(rs.getString("resumen"));
                minoticia.setImgNoticia(rs.getString("imagenNoticia"));
                
                //de esta forma lo tenemos con el dia y las horas y tal en DATE
                //Date date = new java.util.Date((rs.getTimestamp(9)).getTime());
                //minoticia.setFechaNoticia(date);
                
                // con esta lo tenemos en sql.timestamp con todo
                //minoticia.setFechaNoticia(rs.getTimestamp(9));
                
                //y con esta solo el dia mes y año la dejo por ahora
                
                minoticia.setFechaNoticia(rs.getDate(9));
                minoticia.setAutor(rs.getString("autor"));
                listaTipoNoticias.add(minoticia);
            }
            
            return listaTipoNoticias;
           
        }catch(SQLException e){}
        
        return null;
    }
    
    //sería para mostrar unicamente las ultimas noticias al estilo de las que atienden al tipo o al autor
    public ArrayList<Noticia> getNoticiasUltimas(){
        
        ArrayList<Noticia> listaUltimasNoticias= new ArrayList<>();
        try{
            Statement st=conexion.createStatement();
            ResultSet rs= st.executeQuery("SELECT * FROM noticias WHERE status=1 ORDER BY fechaNoticia DESC, idNoticias LIMIT 4");
            while(rs.next()){
                
                Noticia minoticia= new Noticia();
                minoticia.setIdNot(rs.getInt("idNoticias"));
                minoticia.setTitular(rs.getString("titular"));
                minoticia.setResumen(rs.getString("resumen"));
                minoticia.setImgNoticia(rs.getString("imagenNoticia"));
                minoticia.setFechaNoticia(rs.getDate(9));
                minoticia.setAutor(rs.getString("autor"));
                listaUltimasNoticias.add(minoticia);
            
            }
            
            return listaUltimasNoticias;
           
        }catch(SQLException e){}
        
        return null;
    }
    
    
    // Para las noticias de la pagina inicial, aparecerá una por su id y el resto son las ultimas noticias subidas
    public ArrayList<Noticia> getNoticiaInicial(int idNot){
        
        ArrayList<Noticia> listaRecomendadasNoticias= new ArrayList<>();
        try{
            Statement st=conexion.createStatement();
            ResultSet rs= st.executeQuery("SELECT * FROM noticias WHERE status = 1 AND idNoticias ='"+idNot+"' UNION "
                    + "(SELECT * FROM noticias WHERE status = 1 AND idNoticias !='"+idNot+"' ORDER BY idNoticias DESC LIMIT 4)");
            
            while(rs.next()){ 
                Noticia minoticia= new Noticia();
                minoticia.setIdNot(rs.getInt("idNoticias"));
                minoticia.setTitular(rs.getString("titular"));
                minoticia.setResumen(rs.getString("resumen"));
                minoticia.setImgNoticia(rs.getString("imagenNoticia"));
                minoticia.setTipoNoticia(rs.getString("tipoNoticia"));
                minoticia.setAutor(rs.getString("autor"));
                minoticia.setFechaNoticia(rs.getDate("fechaNoticia"));
                listaRecomendadasNoticias.add(minoticia);
            
            }
            
            return listaRecomendadasNoticias;
           
        }catch(SQLException e){}
        
        return null;
    }
    
    //Para cuando pulsamos en un autor que nos salgan sus noticias
    public ArrayList<Noticia> getNoticiasAutor(String autor){
        
        ArrayList<Noticia> listaAutorNoticias= new ArrayList<>();
        try{
            Statement st=conexion.createStatement();
            ResultSet rs= st.executeQuery("SELECT * FROM noticias WHERE status=1 AND autor ='"+autor+"' LIMIT 4");
            while(rs.next()){
                
                Noticia minoticia= new Noticia();
                minoticia.setIdNot(rs.getInt("idNoticias"));
                minoticia.setTitular(rs.getString("titular"));
                minoticia.setResumen(rs.getString("resumen"));
                minoticia.setImgNoticia(rs.getString("imagenNoticia"));
                minoticia.setFechaNoticia(rs.getDate(9));
                minoticia.setAutor(rs.getString("autor"));
                listaAutorNoticias.add(minoticia);
            }
            
            return listaAutorNoticias;
           
        }catch(SQLException e){}
        
        return null;
    }
    
    //Para los post de una noticia con sus noticias recomendadas
    // las noticias recomendadas son 2 y no coinciden con la noticia que se muestra
    // se generan aleatoriamente y tienen el mismo tipo que la noticia original
    public ArrayList<Noticia> getNoticiaYRecomendadas(String tipoNoticia, int idNot ){
        
        ArrayList<Noticia> listaRecomendadasNoticias= new ArrayList<>();
 
        try{
            Statement st=conexion.createStatement();
            ResultSet rs= st.executeQuery("SELECT * FROM noticias WHERE status = 1 AND idNoticias ='"+idNot+"' UNION (SELECT * FROM noticias WHERE status = 1 AND tipoNoticia = '"+tipoNoticia+"' AND idNoticias !='"+idNot+"' ORDER BY RAND() LIMIT 2)");
            while(rs.next()){ 
                Noticia minoticia= new Noticia();
                minoticia.setIdNot(rs.getInt("idNoticias"));
                minoticia.setTitular(rs.getString("titular"));
                minoticia.setResumen(rs.getString("resumen"));
                minoticia.setImgNoticia(rs.getString("imagenNoticia"));
                minoticia.setTipoNoticia(rs.getString("tipoNoticia"));
                minoticia.setAutor(rs.getString("autor"));
                minoticia.setFechaNoticia(rs.getDate("fechaNoticia"));
                
                listaRecomendadasNoticias.add(minoticia);
            }
            return listaRecomendadasNoticias;
           
        }catch(SQLException e){}
        
        return null;
    }
}

