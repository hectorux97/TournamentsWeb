<%-- 
    Document   : competiciones
    Created on : 09-may-2019, 19:55:00
    Author     : angel
--%>
<%@page import="beans.Partido"%>
<%@page import="DAO.PartidoDAO"%>
<%@page import="beans.Torneo"%>
<%@page import="DAO.TorneoDAO"%>
<%@page import="beans.GlobalInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.GlobalInfoDAO"%>
<%@page import="beans.Juego"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
       
        <title>TounamentsWeb</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="icon" type="image/png" href="img/IconoWeb.png">
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<link type="text/javascript" href="competiciones.js">
	 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        <%@include file="/includes/headerLinks.html" %>
    </head>
    <body>
        <header>           
            
            <%@include file="/includes/header.jsp" %>   
        </header>
        <div class="w-100">
		<div class="container-fluid separador backgroundImage menubar">
			<h1 class="separadorletras"> Nuestras Competiciones</h1>
			<h5 class="separadorletras"> Torneos diarios en cada uno de los juegos </h5>
		</div>
	</div>
	<div class="w-100" id="accordion">
        
	<ul class="w-100" style="margin-top:15px;">
	<li class="juegos panel "   id="juego1" data-toggle="collapse" href="#ClashRoyal" role="button" aria-expanded="false" aria-controls="ClashRoyal" ></li>
	<li class="juegos panel" id="juego2" data-toggle="collapse" href="#CSGO" role="button" aria-expanded="false" aria-controls="CSGO" ></li>
	<li class="juegos panel"   id="juego3" data-toggle="collapse" href="#LeagueOfLegends" role="button" aria-expanded="false" aria-controls="LeagueOfLegends" ></li>
	<li class="juegos panel"  id="juego4" data-toggle="collapse" href="#Fifa" role="button" aria-expanded="false" aria-controls="Fifa" ></li>
	<li class="juegos panel"  id="juego5" data-toggle="collapse" href="#RainbowSix" role="button" aria-expanded="true" aria-controls="RainbowSix"></li>
	</ul>
	
       
        <% GlobalInfoDAO info2 = new GlobalInfoDAO();
                                    ArrayList<Juego> listaJuegos = info2.GetJuegos();
                                     %>
                                      
                    <% 
                    for (Juego j : listaJuegos) {
                        %>                    
                    <div class="collapse" data-parent="#accordion" <%="id='" + j.getNombre() + "'"%> >
                        <div class="card card-body" <%="data-parent='#" + j.getNombre() + "'"%>>
                            <table id="ultimostorneos">
                                <% TorneoDAO torneo = new TorneoDAO();
                                    ArrayList<Torneo> listaTorneos = torneo.GetTorneos(j.getNombre());
                                    for (Torneo t : listaTorneos) {%>
                                <tr>
                                    <td><i class="fa fa-instagram"></i></td>
                                    <td><%=  t.getFechaInicio()%></td>
                                    <td><img class="icono" src="img/lolico.png"></img></td>
                                    <td><a href="torneo1.html"><%=  t.getNombre()%></a></td>
                                    <td><span> 9 equipos </span></td>
                                </tr>
                                <%}%>
                            </table>
                        </div>
                    </div>
               

                    <%}%>
                     </div>  
                
                
	<div class="container" style="height:100px;">
	</div>
	<div class="container" style="height:100px;">
	</div>
	<div class="container" style="height:100px;">
	</div>
	<div class="container" style="height:100px;">
	</div>
	
	<!-- FOOTER -->
  <footer class="footer backgroundImage bg-dark footer2 center-block">
    <br>
    <p class="separadorletras">&copy; 2019 Bambing Gaming, Inc. &middot; Todos los derechos reservados</p>
  </footer>

</body>

</html>
