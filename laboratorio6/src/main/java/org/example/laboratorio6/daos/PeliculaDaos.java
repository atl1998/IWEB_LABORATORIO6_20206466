package org.example.laboratorio6.daos;
import org.example.laboratorio6.beans.Pelicula;
import org.example.laboratorio6.beans.Actor;
import java.sql.*;
import java.util.ArrayList;
public class PeliculaDaos {

    public static ArrayList<Pelicula> listarPeliculas() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        ArrayList<Pelicula> listaPeliculas = new ArrayList<>();

        String url = "jdbc:mysql://localhost:3306/mydb";
        String username = "root";
        String password = "root";

        String sql = "SELECT \n" +
                "    p.titulo,\n" +
                "    p.director,\n" +
                "    p.anoPublicacion,\n" +
                "    p.rating,\n" +
                "    p.boxOffice,\n" +
                "    g.nombre AS genero\n" +
                "\n" +
                "FROM \n" +
                "    pelicula p\n" +
                "LEFT JOIN \n" +
                "    genero g ON p.idGenero = g.idGenero;";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Pelicula pelicula = new Pelicula();
                pelicula.setTitulo(rs.getString(1));
                pelicula.setDirector(rs.getString(2));
                pelicula.setYearPublicacion(rs.getInt(3));
                pelicula.setRating(rs.getDouble(4));
                pelicula.setBoxOffice(rs.getDouble(5));
                pelicula.setNombreGenero(rs.getString(6));

                listaPeliculas.add(pelicula);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaPeliculas;
    }
    public ArrayList<Pelicula> buscarPorTitulo(String name){

        ArrayList<Pelicula> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String username = "root";
        String password = "root";


        String sql = "SELECT p.titulo, p.director, p.anopublicacion, p.rating, p.boxOffice, g.nombre " +
                "FROM pelicula p " +
                "JOIN genero g ON p.idGenero = g.idGenero " +
                "WHERE p.titulo LIKE ? " +
                "ORDER BY p.rating DESC;";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            //pstmt.setString(1,name);
            pstmt.setString(1, name + "%");

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    Pelicula pelicula = new Pelicula();
                    pelicula.setTitulo(rs.getString(1));
                    pelicula.setDirector(rs.getString(2));
                    pelicula.setYearPublicacion((rs.getInt(3)));
                    pelicula.setRating(rs.getDouble(4));
                    pelicula.setBoxOffice(rs.getDouble(5));
                    pelicula.setNombreGenero(rs.getString(6));

                    lista.add(pelicula);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
    public static ArrayList<Actor> listarActores(int id) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        ArrayList<Actor> listaActores = new ArrayList<>();

        String url = "jdbc:mysql://localhost:3306/mydb";
        String username = "root";
        String password = "root";

        String sql = "SELECT  pel.idPelicula,pel.titulo,a.idActor,  a.Nombre,a.Apellido,a.anoNacimiento, a.premioOscar FROM actor a JOIN protagonistas p ON a.idActor = p.idActor \n" +
                "JOIN pelicula pel ON p.idPelicula = pel.idPelicula WHERE pel.idPelicula = ?;";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            pstmt.setInt(1,id);
            while (rs.next()) {
                Actor actores = new Actor();
                actores.getIdPelicula(rs.getInt(1));
                actores.getTitulo(rs.getString(2));
                actores.getIdActor(rs.getInt(3));
                actores.getNombre(rs.getString(4));
                actores.getApellido(rs.getString(5));
                actores.getYearNacimiento(rs.getInt(6));
                actores.getPremioOscar(rs.getBoolean(7));
                listaActores.add(actores);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listarActores();
    }
}