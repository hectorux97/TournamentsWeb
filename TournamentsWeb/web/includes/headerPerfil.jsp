
<%@page import="beans.Usuario"%>
<% //Usuario user = (Usuario) session.getAttribute("user");
   // if (user.getPrivilegios() == 0) {
if(true){%>
<div class=" navbar-item collapse-sm show front col-md-2 p-0" id="leftMenu" style="position:fixed;">
    <ul class="nav flex-column text-center sidebar-sticky" style="background-color: #2d3238;width:100%;">
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="../Profile.jsp">
                Mi Perfil <span class="sr-only"></span>
            </a>
        </li>
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="Mis Torneos.html">
                Mis Torenos <span class="sr-only"></span>
            </a>
        </li>
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="Mis Partidos.html">
                Mis Partidos <span class="sr-only"></span>
            </a>
        </li>
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="Soporte.html">
                Soporte <span class="sr-only"></span>
            </a>
        </li>
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="#">
                Log Out <span class="sr-only"></span>
            </a>
        </li>
    </ul>
</div>
<%} else {%>

<div class=" navbar-item collapse-sm show front col-md-2 p-0" id="leftMenu" style="position:fixed;">
    <ul class="nav flex-column text-center sidebar-sticky" style="background-color: #2d3238;width:100%;">
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="../Profile.jsp">
                Mi Perfil <span class="sr-only">(current)</span>
            </a>
        </li>
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="#">
                Noticias <span class="sr-only">(current)</span>
            </a>
        </li>
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="#">
                Torneos <span class="sr-only">(current)</span>
            </a>
        </li>
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="#">
                Partidos Activos <span class="sr-only">(current)</span>
            </a>
        </li>
        <li class="nav-item menuAdmin  shadow-sm ">
            <a class="nav-link active" href="#">
                Log Out <span class="sr-only">(current)</span>
            </a>
        </li>
    </ul>
</div>
  
  <%}%>