<%-- 
    Document   : AdminMisNoticias
    Created on : May 14, 2019, 1:03:38 PM
    Author     : JF
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.NoticiasDAO"%>
<%@page import="beans.Usuario"%>
<%@page import="beans.Noticia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if(request.getSession(false)==null && session.getAttribute("user")==null){%>
     <jsp:forward page="/Login.jsp"/>
<%}else{%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestión Noticias</title>
        <%@include file="/includes/headerLinks.html" %>
    </head>
    
    <body>
        <header>
            <%@include file="/includes/header.jsp" %>
            <%@include file="/includes/headerPerfil.jsp" %>
        </header>
        
        <%
            if(request.getSession(false)!=null && session.getAttribute("user")!=null){
                Usuario user= (Usuario)session.getAttribute("user");
                NoticiasDAO nDAO= new NoticiasDAO();
                ArrayList<Noticia> noticias= nDAO.getTodasNoticiasAutor(user.getId());
                session.setMaxInactiveInterval(1200);
        %>
        
        <main role="main" class="col-md-9  ml-sm-auto col-lg-10 p-0 behind" >
  <!--Cabecera-->
       
<!--Perfil-->
<div>  
    <div class="left form mx-md-2 my-3 pl-2 rounded">
    <div class="d-flex flex-wrap flex-md-nowrap pt-3 pb-2 mb-3 border-bottom ml-md-2 mr-md-2">
      <div class="inclinado ">
        <a class="nav-link" href="AdminNoticias.jsp">Nueva Noticia</a>
      </div>
      <div class="inclinado ">
        <a class="nav-link" href="AdminMisNoticias.jsp">Mis Noticias</a>
      </div>
    </div>
         <%if (noticias != null && !noticias.isEmpty()) {%>
    <table id="table" class="table w-75 border-bottom">
      <thead class="thead-dark">
      <tr class="">
        <th scope="col">Titulo</th>
        <th scope="col">Tipo</th>
        <th scope="col">Fecha </th>
        <th scope="col">Borrado </th>
        <th scope="col">Destacar </th>
        <th scope="col">Modificar</th>
      </tr>
    </thead>
    <tbody>
            <%for (int i = 0; i < noticias.size(); i++) {
                Noticia n = noticias.get(i);
            %>
                <tr>
                    <td><%=n.getTitular()%></td>
                    <td><%=n.getTipoNoticia() %></td>
                    <td><%=n.getFechaNoticia()%></td>
                    <td><a href="/Controlador/PaginaNoticias?no=borrar&idNoticia=<%=n.getIdNot()%>">Borrar</a></td>
                    <td><a href="/Controlador/PaginaNoticias?no=destacar&idNoticia=<%=n.getIdNot()%>">Destacar</a></td>
                    <td><a href="/Controlador/PaginaNoticias?no=recuperarnoticia&idNoticia=<%=n.getIdNot()%>">Modificar</a></td>
                </tr>
            <%}%>
    </tbody>
    </table>

   
    </div>
</div>
    <%}%>
</main>
      <%}%>  
    <%@include file="/includes/footer.html" %>
    </body>
</html>
<%}%>