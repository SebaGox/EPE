<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String ctx = request.getContextPath(); %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Portafolio - Proyectos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/reset.css">
  <link rel="stylesheet" href="<%=ctx%>/assets/css/styles.css">
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
    <div class="container">
      <a class="navbar-brand fw-semibold" href="<%=ctx%>/index.jsp">Mi Portafolio</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="menu">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="<%=ctx%>/index.jsp">Inicio</a></li>
          <li class="nav-item"><a class="nav-link active" href="<%=ctx%>/pages/proyectos.jsp">Proyectos</a></li>
          <li class="nav-item"><a class="nav-link" href="<%=ctx%>/pages/habilidades.jsp">Habilidades</a></li>
          <li class="nav-item"><a class="nav-link" href="<%=ctx%>/pages/experiencia.jsp">Experiencia</a></li>
          <li class="nav-item"><a class="nav-link" href="<%=ctx%>/contacto.jsp">Contacto</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <main class="container mt-5 pt-5">
    <h1 class="text-center mb-4">Mis Proyectos</h1>

    <div class="row g-4">
      <%
        // Config BD
        String url = "jdbc:mysql://localhost:3306/portafolio?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        String user = "root";
        String pass = "";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // Fallbacks por nombre (si la BD no trae imagen_url)
        String fondoDefault = ctx + "/assets/fondo.jpg";

        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          conn = DriverManager.getConnection(url, user, pass);

          String sql = "SELECT id, titulo, descripcion, imagen_url, demo_url, repo_url FROM proyectos ORDER BY id DESC";
          ps = conn.prepareStatement(sql);
          rs = ps.executeQuery();

          boolean hayResultados = false;

          while (rs.next()) {
            hayResultados = true;
            String titulo = rs.getString("titulo");
            String descripcion = rs.getString("descripcion");
            String imagen = rs.getString("imagen_url");
            String demo = rs.getString("demo_url");
            String repo = rs.getString("repo_url");

            // Si no hay imagen definida en BD, elegimos una acorde al nombre
            if (imagen == null || imagen.trim().isEmpty()) {
              String tl = titulo == null ? "" : titulo.toLowerCase();

              if (tl.contains("portafolio")) {
                imagen = "https://img.freepik.com/premium-photo/top-view-photographer-leather-dark-desk-with-creative-supplies-copy-space_67155-825.jpg?semt=ais_hybrid&w=740&q=80";
              } else if (tl.contains("landing")) {
                imagen = "https://source.unsplash.com/800x450/?landing,website,ui,web";
              } else if (tl.contains("todo") || tl.contains("tareas")) {
                imagen = "https://source.unsplash.com/800x450/?todo,checklist,productivity";
              } else if (tl.contains("bootstrap")) {
                imagen = "https://source.unsplash.com/800x450/?bootstrap,frontend,web";
              } else if (tl.contains("java") || tl.contains("jsp")) {
                imagen = "https://source.unsplash.com/800x450/?java,code,programming";
              } else {
                // Fallback final: un seed por título (varía según nombre) o tu fondo.
                try {
                  String seed = URLEncoder.encode(titulo == null ? "project" : titulo, "UTF-8");
                  imagen = "https://picsum.photos/seed/" + seed + "/800/450";
                } catch (Exception se) {
                  imagen = fondoDefault;
                }
              }
            }
      %>

      <div class="col-md-4">
        <div class="card text-light h-100">
          <img src="<%= imagen %>" class="card-img-top" alt="Imagen de <%= (titulo==null?"Proyecto":titulo) %>">
          <div class="card-body d-flex flex-column">
            <h5 class="card-title"><%= titulo %></h5>
            <p class="card-text flex-grow-1"><%= descripcion %></p>

            <div class="d-flex gap-2 mt-2">
              <% if (demo != null && !demo.trim().isEmpty()) { %>
                <a href="<%= demo %>" target="_blank" class="btn btn-warning btn-sm">Demo</a>
              <% } %>
              <% if (repo != null && !repo.trim().isEmpty()) { %>
                <a href="<%= repo %>" target="_blank" class="btn btn-outline-light btn-sm">Código</a>
              <% } %>
            </div>
          </div>
        </div>
      </div>

      <%
          } // while

          if (!hayResultados) {
      %>
        <div class="col-12">
          <div class="alert alert-info">Aún no hay proyectos cargados. Agrega algunos en la tabla <code>proyectos</code>.</div>
        </div>
      <%
          }
        } catch (Exception e) {
      %>
        <div class="col-12">
          <div class="alert alert-danger">❌ Error cargando proyectos: <%= e.getMessage() %></div>
        </div>
      <%
        } finally {
          try { if (rs != null) rs.close(); } catch (Exception ig) {}
          try { if (ps != null) ps.close(); } catch (Exception ig) {}
          try { if (conn != null) conn.close(); } catch (Exception ig) {}
        }
      %>
    </div>
  </main>

  <footer class="bg-dark text-light text-center py-3 mt-5">
    <p class="mb-0">&copy; 2025 Seba - Todos los derechos reservados</p>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
