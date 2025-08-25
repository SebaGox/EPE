<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String ctx = request.getContextPath(); %>
<%@ page import="java.sql.*" %>
<%
    String mensajeSalida = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        request.setCharacterEncoding("UTF-8");
        String nombre  = request.getParameter("nombre");
        String email   = request.getParameter("email");
        String mensaje = request.getParameter("mensaje");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/portafolio?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
                "root", ""
            );
            PreparedStatement ps = conn.prepareStatement(
              "INSERT INTO mensajes (nombre, email, mensaje) VALUES (?, ?, ?)"
            );
            ps.setString(1, nombre);
            ps.setString(2, email);
            ps.setString(3, mensaje);
            ps.executeUpdate();
            ps.close();
            conn.close();
            mensajeSalida = "<div class='alert alert-success mt-3 mb-0'>✅ Mensaje enviado correctamente</div>";
        } catch (Exception e) {
            mensajeSalida = "<div class='alert alert-danger mt-3 mb-0'>❌ Error: " + e.getMessage() + "</div>";
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contacto - Portafolio</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/reset.css">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/styles.css">
</head>
<body class="bg-dark text-light d-flex flex-column min-vh-100">
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
          <li class="nav-item"><a class="nav-link" href="<%=ctx%>/pages/experiencia.jsp">Experiencia</a></li>
          <li class="nav-item"><a class="nav-link active" href="<%=ctx%>/contacto.jsp">Contacto</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <main class="container py-5 mt-5" id="contacto">
    <h2 class="mb-4">Contáctame</h2>
    <%= mensajeSalida %>
    <form method="post" action="<%=ctx%>/contacto.jsp" class="needs-validation mt-3" novalidate>
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Tu nombre" required>
        <div class="invalid-feedback">Por favor, ingresa tu nombre.</div>
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Correo</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="ejemplo@mail.com" required>
        <div class="invalid-feedback">Por favor, ingresa un correo válido.</div>
      </div>
      <div class="mb-3">
        <label for="mensaje" class="form-label">Mensaje</label>
        <textarea id="mensaje" name="mensaje" class="form-control" rows="5" placeholder="Escribe tu mensaje..." required></textarea>
        <div class="invalid-feedback">Por favor, escribe tu mensaje.</div>
      </div>
      <button type="submit" class="btn btn-warning w-100">Enviar</button>
    </form>
  </main>

  <footer class="bg-dark text-light text-center py-3 mt-auto">
    <p class="mb-0">&copy; 2025 Seba - Todos los derechos reservados</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    (function () {
      'use strict';
      const forms = document.querySelectorAll('.needs-validation');
      Array.from(forms).forEach((form) => {
        form.addEventListener('submit', (event) => {
          if (!form.checkValidity()) { event.preventDefault(); event.stopPropagation(); }
          form.classList.add('was-validated');
        }, false);
      });
    })();
  </script>
</body>
</html>
