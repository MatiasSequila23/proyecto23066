<%@page import="clases.SociosDAO"  %>
<%@page import="clases.Socios"%>
<%@page import="java.util.List"%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar Socio</title>
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
  		<%
		String id=request.getParameter("id");
		int mid;
		mid=Integer.parseInt(id);
		Socios resultado=null;
		SociosDAO socio=new SociosDAO();
		resultado=socio.mostrarSocio(mid);
		%>
    <div class="container-xl mx-auto">
      <div class="row row-cards">
        <div class="col-12">
          <form class="card" action="SociosController?accion=actualizar" method="post">
            <div class="card-body">
              <h3 class="card-title">Modificar Socio</h3>
              <div class="row row-cards">
                <input type="hidden"  class="form-control" id="id" name="id"  value=<%=resultado.getId_socio()%> >
                <div class="col-sm-6 col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre"  value=<%=resultado.getNombre() %> >
                  </div>
                </div>
                <div class="col-sm-6 col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Apellido</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" value=<%=resultado.getApellido() %> >
                  </div>
                </div>
                <div class="col-sm-6 col-md-6">
                  <div class="mb-3">
                    <label class="form-label">DNI</label>
                    <input type="number" class="form-control" id="dni" name="dni" value=<%=resultado.getDni() %> >
                  </div>
                </div>
                <div class="col-sm-6 col-md-6">
                  <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="text" class="form-control" id="mail" name="mail" value=<%=resultado.getMail() %> >
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer text-start">
              <button type="submit" class="btn btn-primary">
               <i class="fa-solid fa-rotate"></i>
                Modificar</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

</body>
</html>