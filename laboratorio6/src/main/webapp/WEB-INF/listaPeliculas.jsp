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
        <title>JSP Page</title>
    </head>
    <body>
        <div class='container'>
            <h1 class='mb-3'>Lista de trabajos en hr</h1>
            <div class='container'>
                <h1 class='mb-3'>Lista de trabajos en hr</h1>
                <table>
                    <tr>
                        <th>Id</th>
                        <th>Titulo</th>
                        <th>Director</th>
                        <th>Year Publicacion</th>
                        <th>Rating</th>
                        <th>BoxOffice</th>
                        <th>NombreGenero</th>
                        <th>IDGenero</th>
                    </tr>
                    <% for (Pelicula pelicula : listaPeliculas) { %>
                    <tr>
                        <td><%=pelicula.getIdPelicula()%></td>
                        <td><%=pelicula.getTitulo()%></td>
                        <td><%=pelicula.getDirector()%></td>
                        <td><%=pelicula.getYearPublicacion()%></td>
                        <td><%=pelicula.getRating()%></td>
                        <td><%=pelicula.getBoxOffice()%></td>
                        <td><%=pelicula.getIdGenero()%></td>
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

