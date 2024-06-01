package org.example.laboratorio6.servlets;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.laboratorio6.beans.Pelicula;
import org.example.laboratorio6.daos.PeliculaDaos;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DetallesServlet", value = "/DetallesServlet")
public class DetallesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        PeliculaDaos peliculaDaos = new PeliculaDaos();
        ArrayList<Pelicula> listaPeliculas= peliculaDaos.listarPeliculas();
        request.setAttribute("lista",listaPeliculas);
        RequestDispatcher view = request.getRequestDispatcher("lista_peliculas/listaActores.jsp");
        view.forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");
        PeliculaDaos peliculaDaos = new PeliculaDaos();
        switch(action){
            case "s":
                String textBuscar = request.getParameter("textoBuscar");
                ArrayList<Pelicula> lista = peliculaDaos.buscarPorTitulo(textBuscar);

                request.setAttribute("lista",lista);
                request.setAttribute("busqueda",textBuscar);
                request.getRequestDispatcher("lista_peliculas/listaPeliculas.jsp").forward(request,response);
        }
    }

}
