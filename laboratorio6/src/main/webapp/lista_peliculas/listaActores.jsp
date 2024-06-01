<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.laboratorio6.beans.Pelicula" %>
<%@ page import="org.example.laboratorio6.beans.Actor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Actor> listaActores = (ArrayList<Actor>) request.getAttribute("actor");
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
            <h1 class='mb-3'><%=listaActores.get(0).getTitulo()%></h1>

            <table class="table table-bordered border-primary">
                <tr>
                    <th>IdActor</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Ano Nacimiento</th>
                    <th>Ganador Premio Oscar</th>

                </tr>
                <% for (Actor actor : listaActores) { %>
                <tr>
                    <td><%=actor.getIdActor()%></td>
                    <td><%=actor.getNombre()%></td>
                    <td><%=actor.getApellido()%></td>
                    <td><%=actor.getYearNacimiento()%></td>
                    <td><%=actor.getPremioOscar()%></td>
                </tr>
                <%  }  %>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
    </body>
</html>
