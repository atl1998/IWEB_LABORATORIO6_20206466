package org.example.laboratorio6.servlets;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.laboratorio6.beans.Actor;
import org.example.laboratorio6.daos.PeliculaDaos;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ActorServlet", value = "/ActorServlet")
public class ActorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String id =request.getParameter("id");

        PeliculaDaos peliculaDaos = new PeliculaDaos();
        ArrayList<Actor> listaActor= peliculaDaos.listarActores(Integer.parseInt(id));

        request.setAttribute("actor",listaActor);
        RequestDispatcher view = request.getRequestDispatcher("lista_peliculas/listaActores.jsp");
        view.forward(request,response);


    }


}