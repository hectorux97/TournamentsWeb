<%-- 
    Document   : inicionoticias
    Created on : Apr 27, 2019, 12:04:31 PM
    Author     : JF
--%>
<%@page import="beans.Noticia, java.util.*, DAO.NoticiasDAO, beans.GlobalInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       8">
        <title>Noticias</title>
         <%@include file="/includes/headerLinks.html" %>
         <link rel="stylesheet" type="text/css" href="css/notprin.css">
         <style>
             div.row {
                 width: 100%;
                 margin: 0px;
                 padding: 0px;
             }
         </style>
    </head>
    <body>
        <header>
            <%@include file="/includes/header.jsp" %>
        </header>
        <!-- Page Content -->
        <div class="row">
            <div class="container-fluid separador backgroundImage menubar">
                <h1 class="separadorletras"> #B Noticias </h1>
                <h5 class="separadorletras"> ¡Reviews, novedades y mucho más!  </h5>
            </div>
        </div>
        <div class="container">

            <!-- Jumbotron Header --- Saco la Noticia destacada -->

            <%  NoticiasDAO notiDAO = new NoticiasDAO();
                ArrayList noticias;
                //int idNot = Integer.parseInt(request.getParameter("idNoticia"));
                noticias = notiDAO.getNoticiaInicial();
            for (int i = 0; i < 1; i++) {
            Noticia n = (Noticia) noticias.get(i);%>
            <% int id = n.getIdNot(); %>
            <% String titulo = n.getTitular();%>
            <% String res = n.getResumen();%>
            <% String texto = n.getNoticiaTexto();%>
            <% String img = n.getImgNoticia();%>               
            <% Date date = n.getFechaNoticia();%>
            <% String tipo = n.getTipoNoticia();%>


            <a href="/Controlador/PaginaNoticias?no=mostrar&idNoticia=<%=id%>&tipoNoticia=<%=tipo%>">
                <header class="jumbotron my-4" style="background-image:url(img/<%=img%>)">
                    <h1 class="display-3"><%=titulo%></h1>
                    <p class="lead"><%=res%></p>


                </header>
            </a>
            <%}%>
            <!-- Page Features -->


            <div class="card-group">
                <div class="col-lg-4 col-md-6 mb-4">
                    <a href="/Controlador/PaginaNoticias?no=tipo&tipoNoticia=esports">    
                        <div class="card h-100">
                            <img class="card-img-top" src="img/ESports_files/22364914234_2dcc351e62_n.jpg" alt="">
                            <div class="card-body">
                                <h2 class="card-title"> #B ESports</h2>
                                <p class="card-text">No te pierdas las  últimas novedades de tus gamers favoritos</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <a href="/Controlador/PaginaNoticias?no=tipo&tipoNoticia=novedades"> 
                        <div class="card h-100">
                            <img class="card-img-top" src="img/anno_1800.jpg" alt="">
                            <div class="card-body">
                                <h2 class="card-title">#B Novedades</h2>
                                <p class="card-text">Ofertas, lanzamientos y todo lo que necesitas para estar al dia en el mundo gaming! </p>
                            </div> 
                        </div>
                    </a>   
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <a href="/Controlador/PaginaNoticias?no=tipo&tipoNoticia=review">
                        <div class="card h-100" href="#">
                            <img class="card-img-top" src="img/reviewlogo.png" alt="">
                            <div class="card-body">
                                <h2 class="card-title">#B Review</h2>
                                <p class="card-text">Aquí encontrarás las mejores reviews de la comunidad!</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">

                <!-- Blog Entries Column -->
                <div class="col-md-12">

                    <h1 class="my-4">Últimas Noticias</h1>

                    <!-- Blog Post -->
                    
                        <% for (int i = 1; i < 5; i++) {
                        Noticia n = (Noticia) noticias.get(i);%>
                        <% int id = n.getIdNot(); %>
                        <% String titulo = n.getTitular();%>
                        <% String res = n.getResumen();%>
                        <% String texto = n.getNoticiaTexto();%>
                        <% String img = n.getImgNoticia();%>
                        <% String autorNombre = n.getAutor().getAlias();%>
                        <% int idAutor = n.getAutor().getId();%>
                        <% Date date = n.getFechaNoticia();%>
                        <% String tipo = n.getTipoNoticia();%> 
                    <div class="card mb-4">
                        <img class="card-img-top" src="img/<%=img%>" alt="Card image cap">
                        <div class="card-body">
                            <h2 class="card-title"><%=titulo%></h2>
                            <p class="card-text"><%=res%></p>
                            <a href="/Controlador/PaginaNoticias?no=mostrar&idNoticia=<%=id%>&tipoNoticia=<%=tipo%>" class="btn btn-primary">Read More &rarr;</a>
                        </div>
                        <div class="card-footer text-muted">
                            Publicado el <%=date%> por
                            <a href="/Controlador/PaginaNoticias?no=autor&autor=<%=idAutor%>"><%=autorNombre%></a>
                        </div>
                    </div>
                    <%}%>
                
                <!-- /.row -->
            </div> 
           </div>
        </div>
        <!-- /.container -->
        <%@include file="/includes/footer.html" %>
    </body>
</html>
