<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.laboratorio6.beans.Pelicula" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Pelicula> listaPeliculas = (ArrayList<Pelicula>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
              rel="stylesheet" crossorigin="anonymous">
        <title>Peliculas</title>
        <style>
            table {
                border-collapse: collapse;
                width: auto; /* Ajustar automáticamente al contenido */
                font-size: 12px; /* Tamaño de fuente más pequeño */
            }
            th, td {
                padding: 2px; /* Reducir padding para minimizar el espacio */
                margin: 0; /* Eliminar margen */
                text-align: left;
                white-space: nowrap; /* Evitar que el texto se envuelva */
            }
        </style>
    </head>
    <body>
        <div class='container'>
            <h1 class='mb-3'>Lista de películas</h1>
                <form method="post" action="<%=request.getContextPath()%>/PeliculaServlet?action=s" class="row">

                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="floatingInput"
                               placeholder="Buscar por Nombre" name="textoBuscar" value="<%= request.getAttribute("busqueda") != null ? request.getAttribute("busqueda") : "" %>">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit">Buscar</button>
                        </div>
                    </div>

                </form>
                <table class="table table-bordered border-primary">

                    <% for (Pelicula pelicula : listaPeliculas) { %>
                    <tr>
                        <td>idPelicula</td>
                        <td><%=pelicula.getIdPelicula()%></td>
                    </tr>
                    <tr>
                        <td>Director</td>
                        <td><%=pelicula.getDirector()%></td>
                    </tr>
                    <tr>
                        <td>Ano Publicacion</td>
                        <td><%=pelicula.getYearPublicacion()%></td>
                    </tr>
                    <tr>
                        <td>Rating</td>
                        <td><%=pelicula.getRating()%></td>
                    </tr>
                    <tr>
                        <td>BoxOffice</td>
                        <td><%=pelicula.getBoxOffice()%></td>
                    </tr>
                    <tr>
                        <td>Genero</td>
                        <td><%=pelicula.getNombreGenero()%></td>
                    </tr>
                    <tr>
                        <td>Genero</td>
                        <td><%=pelicula.getNombreGenero()%></td>
                    </tr>
                    <%  }  %>
                </table>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                    crossorigin="anonymous"></script>
    </body>
</html>
