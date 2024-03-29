/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;
import java.sql.Date;
import java.util.Calendar;
/**
 *
 * @author hector
 */
public class Partido {
    
    private int id;
    private Torneo torneo;
    private int idTorneo;
    private Usuario usuario1;
    private int idUsuario1;
    private Usuario usuario2;
    private int idUsuario2;
    private int puntosUsuario1;
    private int puntosUsuario2;
    private int ronda;
    private Date fechaInicio;
    private String imgUrl;
    
    private int estado;
    
    public Partido() {
        usuario1= new Usuario();
        usuario2= new Usuario();
    }

    public Partido(int id,Torneo torneo, int idTorneo, Usuario usuario1, int idUsuario1, Usuario usuario2, int idUsuario2, int puntosUsuario1, int puntosUsuario2, int ronda, Date fechaInicio, String imgUrl, int estado) {
        this.id=id;
        this.torneo = torneo;
        this.idTorneo = idTorneo;
        this.usuario1 = usuario1;
        this.idUsuario1 = idUsuario1;
        this.usuario2 = usuario2;
        this.idUsuario2 = idUsuario2;
        this.puntosUsuario1 = puntosUsuario1;
        this.puntosUsuario2 = puntosUsuario2;
        this.ronda = ronda;
        this.fechaInicio= fechaInicio;
        this.imgUrl= imgUrl;
        this.estado=estado;
    }
     public Partido(int idTorneo,int idUsuario1, int idUsuario2,int ronda) {
       
        this.idTorneo = idTorneo;        
        this.idUsuario1 = idUsuario1;
        this.idUsuario2 = idUsuario2;
        this.ronda = ronda;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Torneo getTorneo() {
        return torneo;
    }

    public void setTorneo(Torneo torneo) {
        this.torneo = torneo;
    }

    public int getIdTorneo() {
        return idTorneo;
    }

    public void setIdTorneo(int idTorneo) {
        this.idTorneo = idTorneo;
    }

    public Usuario getUsuario1() {
        return usuario1;
    }

    public void setUsuario1(Usuario usuario1) {
        this.usuario1 = usuario1;
    }

    public int getIdUsuario1() {
        return idUsuario1;
    }

    public void setIdUsuario1(int idUsuario1) {
        this.idUsuario1 = idUsuario1;
    }

    public Usuario getUsuario2() {
        return usuario2;
    }

    public void setUsuario2(Usuario usuario2) {
        this.usuario2 = usuario2;
    }

    public int getIdUsuario2() {
        return idUsuario2;
    }

    public void setIdUsuario2(int idUsuario2) {
        this.idUsuario2 = idUsuario2;
    }

    public int getPuntosUsuario1() {
        return puntosUsuario1;
    }

    public void setPuntosUsuario1(int puntosUsuario1) {
        this.puntosUsuario1 = puntosUsuario1;
    }

    public int getPuntosUsuario2() {
        return puntosUsuario2;
    }

    public void setPuntosUsuario2(int puntosUsuario2) {
        this.puntosUsuario2 = puntosUsuario2;
    }

    public int getRonda() {
        return ronda;
    }

    public void setRonda(int ronda) {
        this.ronda = ronda;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }   

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }   

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    public String getEstadoConversion(){
        switch(estado){
            case 0:              
                java.util.Date currentDate= Calendar.getInstance().getTime();
                Date today= new Date(currentDate.getTime());
                if(!today.before(getFechaInicio())){
                    estado=1;
                    return "En partida";
                }
                return "No comenzado";
            case 1:
                return "En partida";
             case 2:
                return "Pendiente de Validar";
             case 3:
                 return "Finalizado";
        }
        return "Error";
    }
    
}
