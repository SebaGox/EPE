<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Portafolio - Experiencia</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/reset.css">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/styles.css">
</head>
<body>
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
        <li class="nav-item"><a class="nav-link" href="<%=ctx%>/pages/habilidades.jsp">Habilidades</a></li>
        <li class="nav-item"><a class="nav-link active" href="<%=ctx%>/pages/experiencia.jsp">Experiencia</a></li>
        <li class="nav-item"><a class="nav-link" href="<%=ctx%>/contacto.jsp">Contacto</a></li>
      </ul>
    </div>
  </div>
</nav>

  <main class="container mt-5 pt-5">
    <h1 class="text-center mb-4">Mi Experiencia</h1>
    <ul class="list-group">
      <li class="list-group-item bg-dark text-light">2024 — Proyecto personal en HTML, CSS y JS</li>
      <li class="list-group-item bg-dark text-light">2025 — Curso de Desarrollo Web II</li>
    </ul>
  </main>

  <footer class="bg-dark text-light text-center py-3 mt-5">
    <p class="mb-0">&copy; 2025 Seba - Todos los derechos reservados</p>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
