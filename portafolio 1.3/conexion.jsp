<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Prueba de Conexión</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/reset.css">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/styles.css">
</head>
<body class="bg-dark text-light d-flex flex-column min-vh-100">
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
    <div class="container">
      <a class="navbar-brand fw-semibold" href="<%=ctx%>/index.jsp">Mi Portafolio</a>
    </div>
  </nav>

  <main class="container py-5 mt-5">
    <h2>Prueba de conexión a MySQL</h2>
    <div class="mt-3 p-3 bg-dark rounded">
      <%
        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/portafolio?serverTimezone=UTC",
            "root", ""
          );
          out.print("<div class='alert alert-success'>✅ Conexión exitosa a la base de datos</div>");
          conn.close();
        } catch (Exception e) {
          out.print("<div class='alert alert-danger'>❌ Error en la conexión: " + e.getMessage() + "</div>");
        }
      %>
    </div>
    <a href="<%=ctx%>/index.jsp" class="btn btn-outline-light mt-3">Volver al inicio</a>
  </main>

  <footer class="bg-dark text-light text-center py-3 mt-auto">
    <p class="mb-0">&copy; 2025 Seba</p>
  </footer>
</body>
</html>
