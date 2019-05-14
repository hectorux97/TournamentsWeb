<%-- 
    Document   : posts
    Created on : Apr 26, 2019, 5:25:05 PM
    Author     : JF
--%>

<%@page import="beans.Noticia, java.util.*, DAO.NoticiasDAO, beans.GlobalInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/includes/headerLinks.html" %>

    </head>


    <body>
        
        <header>
            <%@include file="/includes/header.jsp" %>
        </header>
        <%String tit = request.getParameter("tipoNoticia");%>

        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <!-- Blog Entries Column -->
                <div class="col-md-12"> 
                    <h1 class="my-4"><%=tit%></h1>

                    <!-- Blog Post -->
                    <% ArrayList noticias = (ArrayList) request.getAttribute("noticias");
            for (int i = 0; i < noticias.size(); i++) {
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
                    <a href=""></a>
                    <div class="card mb-4">
                        <img class="card-img-top m-1" src="img/<%=img%>" alt="Card image cap">
                        <div class="card-body m-2">
                            <h2 class="card-title"><%=titulo%></h2>
                            <p class="card-text"><%=res%></p>
                            <a href="/Controlador/PaginaNoticias?no=mostrar&idNoticia=<%=id%>&tipoNoticia=<%=tipo%>" class="btn btn-primary">Read More &rarr;</a>
                        </div>
                        <div class="card-footer text-muted">
                            Publicado el: <%=date%> por
                            <a href="/Controlador/PaginaNoticias?no=autor&autor=<%=idAutor%>"><%=autorNombre%></a>
                        </div>
                    </div>
                    <%}%>
                </div> 
            </div>
        </div>




        <%@include file="/includes/footer.html" %>
    </body> 
</html>


