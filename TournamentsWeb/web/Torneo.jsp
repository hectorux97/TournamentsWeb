<%-- 
    Document   : Torneo
    Created on : 11-may-2019, 11:23:06
    Author     : hector
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="beans.*"%>
<%@page import="DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (request.getParameter("idTorneo") == null) {%>
<jsp:forward page="/index.jsp"/>    
<%} else {
    int id = Integer.parseInt(request.getParameter("idTorneo"));
    TorneoDAO tdao = new TorneoDAO();
    Torneo torneo = tdao.GetTorneo(id);
    PartidoDAO pdao= new PartidoDAO();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Torneo</title>       
        <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet/css">
        
        <link href="css/torneoBrackets.css"  rel="stylesheet" type="text/css">
        
        <%@include file="/includes/headerLinks.html" %>
    </head>
    <body>
        <header>
            <%@include file="/includes/header.jsp" %>   
        </header>
      
        <% String nick="";
            String ses="";
            if(request.getSession(false)!=null){
                if(session.getAttribute("user")!=null){
                ses="Y";
                Usuario user=(Usuario)session.getAttribute("user");
                nick= user.getNick(torneo.getJuegoName());
                
                 %>
                
               <% session.setMaxInactiveInterval(600);
            }}%>
        <div id="Info" style="display:none;"><%=ses%></div>
        <div id="Nick" style="display:none;"><%=nick%></div>
        <div id="idT" style="display:none;"><%=id%></div>
        <div id="alertas"></div>
        <main>
            <div class="row w-100 ml-0">
                <div class=" separador backgroundImage menubar">
                    <h1 class="separadorletras">#<%=torneo.getNombre()%></h1>
                    <h5 class="separadorletras"> Panel del torneo </h5>
                </div>
            </div>
           
            <!-- Aqui comienda el acordeon -->
            <div class="container col-md-12">
                <div class="row">
                    <div class="col-md-9">
                          <center>
                        <ul class="nav nav-tabs m-auto" id="myTab" role="tablist">
                            <li class="w-25"></li>
                            <li class="nav-item infotorneo">
                                <a class="nav-item active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><center>Info</center></a>
                            </li>
                            <li class="nav-item infotorneo">
                                <a class="center-block" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"><center>Bracket</center></a>
                            </li>
                            <li class="nav-item infotorneo">
                                <a class="" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false"><center>Equipos</center></a>
                            </li>
                            <li class="nav-item infotorneo">
                                <a class="" id="contact-tab" data-toggle="tab" href="#reglas" role="tab" aria-controls="contact" aria-selected="false"><center>Reglas</center></a>
                            </li>
                           
                        </ul>
                               </center>
                        <div class="tab-content " id="myTabContent">
                            <div class="tab-pane fade show active ml-5" id="home" role="tabpanel" aria-labelledby="home-tab"><br><br><br>
                                <div id="fechainicio"><i class="far fa-clock fa-2x" id="reloj"></i>Comienza <%=torneo.getFechaInicio()%></div><br>
                                <div id="juegotorneo">
                                    <b>Juego:</b><span id="juegousado"><%=torneo.getJuegoName()%></span><br>
                                    <b> Modo:</b><span id="modo1">1 vs 1 BO1</span><br>
                                    <b>Premios:</b><span id="premio1"><%=torneo.getPremio()%></span>
                                </div><br><br>
                            </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"><br><br><br>
                            <section id="bracket" class="overflow-auto">
                                <div class="container">
                                    <div class="split">                                         
                                        <% if(torneo.getEstado()!=0){
                                            ArrayList<UsuarioForTorneo> participantes= tdao.GetParticipantes(id);%>                                            
                                            
                                            <%  //Double val=torneo.getMaximoJugadores()/2f;
                                                int numRondas= Math.floorDiv( torneo.getMaximoJugadores(), 2);
                                                for(int i=0;i<numRondas;i++){
                                                %>
                                                <div class="round">
                                                <div class="round-details">Ronda <%=i+1%><br/></div>
                                                    <div >
                                                <%  //int index=0;
                                                    ArrayList<UsuarioForTorneo> pas =GetParticipantesOnRound(participantes,i);
                                                    if(pas!=null){
                                                    int size=pas.size();
                                                    for(int e=0;e<Math.pow(2, numRondas-i);e+=2){
                                                        Partido p= new Partido();
                                                        int u1=-1;
                                                        int u2=-1;
                                                        if(size > (e)){
                                                             u1=pas.get(e).getUser().getId();
                                                        }
                                                        if( size > (e+1)){
                                                            u2=pas.get(e+1).getUser().getId();
                                                        }
                                                        p= pdao.GetPartido(u1,u2);%>
                                                    <ul class="matchup m-auto inclinado w-75 p-0" style="margin-bottom:2px;">
                                                        <li class="team team-top <%= (p.getPuntosUsuario1()>p.getPuntosUsuario2())?"winner":""%> m-1" style="display: block"><%=p.getUsuario1().getAlias()%> <span class="score"><%=p.getPuntosUsuario1() %></span></li>
                                                        <hr style="height:1px;margin:0 10%;width: 80%;background-color: #a8c916;">
                                                        <li class="team team-bottom <%= (p.getPuntosUsuario1()<p.getPuntosUsuario2())?"winner":""%> m-1" style="display: block"><%=p.getUsuario2().getAlias()%><span class="score"><%=p.getPuntosUsuario2() %></span></li>
                                                    </ul>
                                                    <div style="height:10px"></div>
                                                <%}%>
                                                 
                                            <%} else{
                                                for(int e=0;e<Math.pow(2, numRondas-i);e+=2){
                                                       %>
                                                    <ul class="matchup m-auto inclinado w-75 p-0" style="margin-bottom:2px;">
                                                        <li class="team team-top m-1" style="display: block">- <span class="score"></span></li>
                                                        <hr style="height:1px;margin:0 10%;width: 80%;background-color: #a8c916;">
                                                        <li class="team team-bottom m-1" style="display: block">-<span class="score"></span></li>
                                                    </ul>
                                                    <div style="height:10px"></div>
                                                <%}%>
                                                </div>
                                                 </div>
                                            <%}}%>  
                                            <%}%> 
                                    </div>
                                </div>
                            </section>
                        </div>
                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab"><br><br><br>

                                    <ul>
                                        <% ArrayList<UsuarioForTorneo> participantes = tdao.GetParticipantes(id);
                                        for (UsuarioForTorneo participante : participantes) {%>
                                        <li><img class="imagenavatar" src="<%=participante.getUser().getImageURL()%>"><br>
                                            <span class="m-auto" id="nombreusuario"><%=participante.getUser().getAlias()%></span></li> 
                                            <%}%>
                                    </ul>
                                    <br><br>
                                </div>
                                <div class="tab-pane fade" id="reglas" role="tabpanel" aria-labelledby="contact-tab"><br><br><br>
                                    <h3><%=torneo.getReglas()%> </h3><br><br>
                                </div>
                        </div>
                        </div>
                        <!-- Aqui Finaliza el acordeon -->
                        <%if (torneo.getEstado() == 0) {
                                boolean can = true;

                                if (request.getSession(false) != null) {
                                    if (session.getAttribute("user") != null) {
                                        Usuario user = (Usuario) session.getAttribute("user");
                                        can = !tdao.CheckParticipante(torneo.getId(), user);
                                    }
                            }
                            if (can) {%>
                        <div class="col-md-3 mt-2">
                            <div class="card">
                                <div class="card-header">
                                    Requisitos
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">Requisitos del torneo</h5>
                                    <p class="card-text">- Añadir cuenta del juego del torneo en tu perfil</p>
                                    <input type="button" class="btn btn-danger" value="Inscribirse" onclick="CheckValidation();"/>
                                </div>
                            </div>
                        </div>
                        <!--<div class="container" style="height:350px;"> </div>-->
                        <%} else {%>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    Requisitos
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">Requisitos del torneo</h5>
                                    <p class="card-text">- Añadir cuenta del juego del torneo en tu perfil</p>
                                    <input type="button" class="btn btn-danger" value="Salir del Torneo" onclick="Borrar();"/>
                                </div>
                            </div>
                        </div>
                    <%}}%>
            </main>
                    <script>
                        
                        var alertas= document.getElementById("alertas");                        
                        var session= document.getElementById("Info").innerHTML;
                        var nick= document.getElementById("Nick").innerHTML;
                        var idTorneo=document.getElementById("idT").innerHTML;
                        var CheckValidation= function(){
                            if(session==""){
                                alertas.innerHTML="<div class='alert alert-danger alert-dismissible fade show w-100 text-center front' role='alert' style='position:fixed;' id='errorLogin'>Debes estar <strong>Logeado</strong> para inscribirte<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";                                
                                return;
                            }
                            if(nick==""){
                                alertas.innerHTML="<div class='alert alert-warning alert-dismissible fade show w-100 text-center front' role='alert' style='position:fixed;' id='errorNick'>Debes tener un <strong>Nick</strong> para inscribirte<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";                                
                                return;
                            }
                            window.location.replace("/Controlador/Inscripcion?id="+idTorneo);
                        };
                        var Borrar= function(){
                            window.location.replace("/Controlador/BorrarParticipante?id="+idTorneo);
                        }
                    </script>
<%@include file="/includes/footer.html" %>
</body>
</html>
<%}%>
<%! ArrayList<UsuarioForTorneo> GetParticipantesOnRound(ArrayList<UsuarioForTorneo> part,int ronda){
                                                ArrayList<UsuarioForTorneo> participes= new ArrayList<UsuarioForTorneo>();
                                                
                                                for(UsuarioForTorneo p:part){
                                                    if(p.getRonda()>= ronda){
                                                        participes.add(p);
                                                    }
                                                }
                                                if(participes.isEmpty() ){
                                                    return null;
                                                }
                                                return participes;
                                            }%>