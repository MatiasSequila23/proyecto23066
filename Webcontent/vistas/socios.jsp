<%@page import="clases.SociosDAO"  %>
<%@page import="clases.Socios"%>
<%@page import="java.util.List"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado de socios</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

  <nav class="navbar navbar-expand navbar-dark bg-dark">
    <div class="container-fluid">
       <a class="navbar-brand text-warning"  href="#">Codo a Codo <i class="fa-brands fa-codepen"></i></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="SociosController?accion=">Listar Socios</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="SociosController?accion=nuevo">Nuevo socio</a>
          </li>
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Buscar</button>
        </form>
      </div>
    </div>
  </nav>
  <br>
  <div class="container mx-auto">
    <div class="row">
    </div>
    <div class="container-xl mx-auto">
      <div class="row row-cards">
        <div class="col-12">
          <form class="card" action="SociosController?accion=insert" method="post">
            <div class="card-body">
              <h3 class="card-title">Nuestros Socios</h3>


              <div class="row row-cards">
                <a class="btn btn-primary col-2 " href="SociosController?accion=nuevo">
                  <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
                    stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                    <path d="M12 5l0 14"></path>
                    <path d="M5 12l14 0"></path>
                  </svg>
                  Agregar Socios</a>
                <table class="table ">
                  <thead class="table-dark">
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>DNI</th>
                    <th>Mail</th>
                    <th class="text-center">Modificar</th>
                    <th class="text-center">Eliminar</th>
                  </thead>

                  <% List<Socios> resultado = null;
                    SociosDAO socio = new SociosDAO();
                    resultado=socio.listarSocios();

                    for(int i=0;i<resultado.size();i++) { String ruta="SociosController?accion=modificar&id="
                      +resultado.get(i).getId_socio(); String rutaE="SociosController?accion=eliminar&id="
                      +resultado.get(i).getId_socio(); %>

                      <tr>
                        <td>
                          <%=resultado.get(i).getId_socio()%>
                        </td>
                        <td>
                          <%=resultado.get(i).getNombre()%>
                        </td>
                        <td>
                          <%=resultado.get(i).getApellido()%>
                        </td>
                        <td>
                          <%=resultado.get(i).getDni()%>
                        </td>
                        <td>
                          <%=resultado.get(i).getMail()%>
                        </td>
                        <td class="text-center"><a href=<%=ruta%>><i class="fa-solid fa-arrow-right-arrow-left"></i></a>
                        </td>
                        <td class="text-center"><a href=<%=rutaE%>><i class="fa-solid fa-arrow-down"></i></a></td>
                      </tr>
                      <% } %>
                </table>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

</body>

</html>