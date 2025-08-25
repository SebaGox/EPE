<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String ctx = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Portafolio - Habilidades</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome para íconos -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/reset.css">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/styles.css">
</head>
<body class="d-flex flex-column min-vh-100">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
  <div class="container">
    <a class="navbar-brand fw-semibold" href="<%=ctx%>/index.jsp">Mi Portafolio</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="menu">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="<%=ctx%>/index.jsp">Inicio</a></li>
        <li class="nav-item"><a class="nav-link" href="<%=ctx%>/pages/proyectos.jsp">Proyectos</a></li>
        <li class="nav-item"><a class="nav-link active" href="<%=ctx%>/pages/habilidades.jsp">Habilidades</a></li>
        <li class="nav-item"><a class="nav-link" href="<%=ctx%>/pages/experiencia.jsp">Experiencia</a></li>
        <li class="nav-item"><a class="nav-link" href="<%=ctx%>/contacto.jsp">Contacto</a></li>
      </ul>
    </div>
  </div>
</nav>

<main class="container mt-5 pt-5">
  <h1 class="text-center mb-4">Mis Habilidades</h1>
  <div class="row text-center g-4">
    <div class="col-md-4">
      <div class="p-4 bg-dark text-light rounded shadow">
        <h4 class="mb-2"><i class="fa-brands fa-html5 me-2" style="color:#e34f26;"></i>HTML5</h4>
        <p>Semántica moderna y accesibilidad.</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="p-4 bg-dark text-light rounded shadow">
        <h4 class="mb-2"><i class="fa-brands fa-css3-alt me-2" style="color:#1572B6;"></i>CSS3</h4>
        <p>Responsive y diseño elegante.</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="p-4 bg-dark text-light rounded shadow">
        <h4 class="mb-2"><i class="fa-brands fa-bootstrap me-2" style="color:#7952B3;"></i>Bootstrap</h4>
        <p>Componentes y grid para prototipado rápido.</p>
      </div>
    </div>

    <div class="col-md-6">
      <div class="p-4 bg-dark text-light rounded shadow h-100">
        <h4 class="mb-2"><i class="fa-brands fa-java me-2" style="color:#f89820;"></i>Java</h4>
        <p>JSP/Servlets, JDBC y buenas prácticas de backend.</p>
      </div>
    </div>
    <div class="col-md-6">
      <div class="p-4 bg-dark text-light rounded shadow h-100">
        <h4 class="mb-2"><i class="fa-solid fa-database me-2" style="color:#38bdf8;"></i>MySQL</h4>
        <p>Modelado básico, consultas SQL y conexión desde Java (JDBC).</p>
      </div>
    </div>
  </div>
</main>

<footer class="bg-dark text-light text-center py-3 mt-auto">
  <p class="mb-0">&copy; 2025 Seba - Todos los derechos reservados</p>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
