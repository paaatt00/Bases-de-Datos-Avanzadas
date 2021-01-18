package main;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Generador extends Thread {

    int id;

    public Generador(int id) {
        this.id = id;
    }

    public void generarGrupos() throws IOException {
        String ficherocsv = "D:\\Datos Musicos\\grupos.csv";
        FileWriter fwfichero = new FileWriter(ficherocsv);
        PrintWriter pw = new PrintWriter(fwfichero);

        String[] generos = {"Clasica", "Blues", "Jazz", "Rock&Roll", "Gospel", "Soul", "Rock", "Metal", "Funk",
            "Disco", "Techno", "Pop", "Reggea", "HipHop", "Salsa"};

        String[] paises = {"España", "Francia", "Alemania", "Portugal", "Italia", "Mozambique", "Grecia", "Mongolia", "China",
            "Japon", "Korea la Buena", "Korea la Mala", "Filipinas", "Sri Lanka", "India", "Pakistan", "Rusia", "Ucrania",
            "Marruecos", "Peru"};

        for (int i = 1; i <= 200001; i++) {
            pw.println(i + ", " + "nombre" + i + ", " + generos[(int) (Math.random() * 14)] + ", " + paises[(int) (Math.random() * 19)] + ", " + "sitio_web" + i);
        }
        fwfichero.close();
    }

    public void generarTabla() throws IOException {
        String ficherocsv = "D:\\Datos Musicos\\grupos_conciertos.csv";
        FileWriter fwfichero = new FileWriter(ficherocsv);
        PrintWriter pw = new PrintWriter(fwfichero);

        for (int i = 1; i <= 100000; i++) {
            pw.println((int) ((Math.random() * 200000) + 1) + ", " + i);
        }
        fwfichero.close();
    }

    public void generarConciertos() throws IOException {
        String ficherocsv = "D:\\Datos Musicos\\conciertos.csv";
        FileWriter fwfichero = new FileWriter(ficherocsv);
        PrintWriter pw = new PrintWriter(fwfichero);

        String[] paises = {"España", "Francia", "Alemania", "Portugal", "Italia", "Mozambique", "Grecia", "Mongolia", "China",
            "Japon", "Korea la Buena", "Korea la Mala", "Filipinas", "Sri Lanka", "India", "Pakistan", "Rusia", "Ucrania",
            "Marruecos", "Peru"};

        String[] ciudades = {"Madrid", "Barcelona", "Santiago de Compostela", "Sevilla", "Merida", "Santander", "Huesca", "Pamplona", "Santa Cruz de Tenerife",
            "Cordoba", "Avila", "Vigo", "Mahon", "Zaragoza", "A Coruña", "Teruel", "Palma de Mallorca", "Malaga", "Tarragona", "Cadiz", "Badajoz",
            "Valencia", "Almeria", "Girona", "Bilbao", "Toledo", "Segovia", "Zamora", "Oviedo", "Soria", "Pontevedra", "Logroño", "Las Palmas de Gran Canaria",
            "Ciutadella", "Alcalá de Henares", "Ourense", "Palencia", "Lugo", "Donostia", "Granada", "Jaen", "Cuenca", "Castellon de la Plana", "Ciudad Real",
            "Burgos", "Caceres", "Alicante", "Murcia", "Albacete", "Vitoria", "Viella", "Huelva", "Salamanca", "Valladolid", "Besalu"};

        Integer dia, mes;
        Integer anno = 2019;

        for (int i = 1; i <= 100001; i++) {

            mes = (int) (Math.random() * 12) + 1;
            if (mes == 2) { //Si es febrero
                dia = (int) (Math.random() * 28) + 1;
            } else {
                dia = (int) (Math.random() * 29) + 1;
            }
            pw.println(i + ", " + dia + "/" + mes + "/" + anno + ", " + paises[(int) (Math.random() * 19)] + ", " + ciudades[(int) (Math.random() * 54)] + "," + "recinto" + i);
        }
        fwfichero.close();
    }

    public void generarEntradas() throws IOException {
        String ficherocsv = "D:\\Datos Musicos\\entradas.csv";
        FileWriter fwfichero = new FileWriter(ficherocsv);
        PrintWriter pw = new PrintWriter(fwfichero);

        String[] ciudades = {"Madrid", "Barcelona", "Santiago de Compostela", "Sevilla", "Merida", "Santander", "Huesca", "Pamplona", "Santa Cruz de Tenerife",
            "Cordoba", "Avila", "Vigo", "Mahon", "Zaragoza", "A Coruña", "Teruel", "Palma de Mallorca", "Malaga", "Tarragona", "Cadiz", "Badajoz",
            "Valencia", "Almeria", "Girona", "Bilbao", "Toledo", "Segovia", "Zamora", "Oviedo", "Soria", "Pontevedra", "Logroño", "Las Palmas de Gran Canaria",
            "Ciutadella", "Alcalá de Henares", "Ourense", "Palencia", "Lugo", "Donostia", "Granada", "Jaen", "Cuenca", "Castellon de la Plana", "Ciudad Real",
            "Burgos", "Caceres", "Alicante", "Murcia", "Albacete", "Vitoria", "Viella", "Huelva", "Salamanca", "Valladolid", "Besalu"};
        int cod_con = 1;

        for (int i = 1; i <= 23000001; i++) {
            if (cod_con != 100001) {
                pw.println(i + ", " + ciudades[(int) (Math.random() * 54)] + ", " + (int) (Math.random() * 80) + 20 + ", " + "usuario" + i + ", " + cod_con);
                cod_con++;
            } else {
                cod_con = 1;
                pw.println(i + ", " + ciudades[(int) (Math.random() * 54)] + ", " + (int) (Math.random() * 80) + 20 + ", " + "usuario" + i + ", " + cod_con);
                cod_con++;
            }
        }
        fwfichero.close();
    }

    public void generarMusicos() throws IOException {
        String ficherocsv = "D:\\Datos Musicos\\tabla musicos.csv";
        FileWriter fwfichero = new FileWriter(ficherocsv);
        PrintWriter pw = new PrintWriter(fwfichero);
        int cod_grupo = 1;

        String[] ciudades = {"Madrid", "Barcelona", "Santiago de Compostela", "Sevilla", "Merida", "Santander", "Huesca", "Pamplona", "Santa Cruz de Tenerife",
            "Cordoba", "Avila", "Vigo", "Mahon", "Zaragoza", "A Coruña", "Teruel", "Palma de Mallorca", "Malaga", "Tarragona", "Cadiz", "Badajoz",
            "Valencia", "Almeria", "Girona", "Bilbao", "Toledo", "Segovia", "Zamora", "Oviedo", "Soria", "Pontevedra", "Logroño", "Las Palmas de Gran Canaria",
            "Ciutadella", "Alcalá de Henares", "Ourense", "Palencia", "Lugo", "Donostia", "Granada", "Jaen", "Cuenca", "Castellon de la Plana", "Ciudad Real",
            "Burgos", "Caceres", "Alicante", "Murcia", "Albacete", "Vitoria", "Viella", "Huelva", "Salamanca", "Valladolid", "Besalu"};

        String[] nombres = {"Alejandro", "Daniel", "David", "Pablo", "Adrian", "Javier", "Alvaro", "Sergio", "Carlos", "Ian", "Jorge", "Raul", "Diego", "Manuel", "Mario", "Maria",
            "Lucia", "Paula", "Laura", "Andrea", "Marta", "Alba", "Sara", "Nerea", "Claudia", "Patricia", "Marina", "Elena", "Carla"};

        String[] instrumentos = {"trompeta", "guitarra", "pandereta", "bajo", "triangulo", "bandurria", "bateria", "saxofon", "palmas", "flauta", "piano", "la nariz",};

        for (int i = 1; i < 1000001; i++) {

            if (cod_grupo != 200001) {
                pw.println(i + ", " + i + ", " + nombres[(int) (Math.random() * 28)] + ", " + "direccion" + i + ", " + i + ", "
                        + ciudades[(int) (Math.random() * 54)] + ", " + "provincia" + i + ", " + i + ", "
                        + instrumentos[(int) (Math.random() * 11)] + ", " + cod_grupo);
                cod_grupo++;
            } else {
                cod_grupo = 1;
                pw.println(i + ", " + i + ", " + nombres[(int) (Math.random() * 28)] + ", " + "direccion" + i + ", " + i + ", "
                        + ciudades[(int) (Math.random() * 54)] + ", " + "provincia" + i + ", " + i + ", "
                        + instrumentos[(int) (Math.random() * 11)] + ", " + cod_grupo);
                cod_grupo++;
            }
        }
        fwfichero.close();
    }

    public void generarDiscos() throws IOException {
        String ficherocsv = "D:\\Datos Musicos\\discos.csv";
        FileWriter fwfichero = new FileWriter(ficherocsv);
        PrintWriter pw = new PrintWriter(fwfichero);
        int cod_grupo = 1;
        Integer dia, mes, anno;

        String[] generos = {"Clasica", "Blues", "Jazz", "Rock&Roll", "Gospel", "Soul", "Rock", "Metal", "Funk",
            "Disco", "Techno", "Pop", "Reggea", "HipHop", "Salsa"};

        String[] formatos = {"digital", "fisico", "lp", "pirata"};

        for (int i = 1; i <= 1000001; i++) {
            mes = (int) (Math.random() * 12) + 1;
            anno = (int) (Math.random() * 20) + 2000;
            if (mes == 2) { //Si es febrero
                dia = (int) (Math.random() * 28) + 1;
            } else {
                dia = (int) (Math.random() * 29) + 1;
            }
            if (cod_grupo != 200001) {
                pw.println(i + ", " + "titulo" + i + ", " + dia + "/" + mes + "/" + anno + ", " + generos[(int) (Math.random() * 14)]
                        + ", " + formatos[(int) (Math.random() * 4)] + ", " + cod_grupo);
                cod_grupo++;
            } else {
                cod_grupo = 1;
                pw.println(i + ", " + "titulo" + i + ", " + dia + "/" + mes + "/" + anno + ", " + generos[(int) (Math.random() * 14)]
                        + ", " + formatos[(int) (Math.random() * 4)] + ", " + cod_grupo);
                cod_grupo++;
            }
        }
        fwfichero.close();
    }

    public void generarCanciones() throws IOException {
        String ficherocsv = "D:\\Datos Musicos\\canciones.csv";
        FileWriter fwfichero = new FileWriter(ficherocsv);
        PrintWriter pw = new PrintWriter(fwfichero);
        int cod_disco = 1;
        Integer dia, mes, anno;

        for (int i = 1; i <= 12000001; i++) {
            mes = (int) (Math.random() * 12) + 1;
            anno = (int) (Math.random() * 20) + 2000;
            if (mes == 2) { //Si es febrero
                dia = (int) (Math.random() * 28) + 1;
            } else {
                dia = (int) (Math.random() * 29) + 1;
            }
            if (cod_disco != 1000001) {
                pw.println(i + ", " + "nombre" + i + ", " + "compositor" + i + ", " + dia + "/" + mes + "/" + anno + ", " + (int) ((Math.random() * 5) + 2)
                        + ", " + cod_disco);
                cod_disco++;
            } else {
                cod_disco = 1;
                pw.println(i + ", " + "nombre" + i + ", " + "compositor" + i + ", " + dia + "/" + mes + "/" + anno + ", " + (int) ((Math.random() * 5) + 2)
                        + ", " + cod_disco);
                cod_disco++;
            }
        }

        fwfichero.close();
    }

    @Override
    public void run() {
        try {
            switch (id) {
                case 1:
                    generarGrupos();
                    break;
                case 2:
                    generarConciertos();
                    break;
                case 3:
                    generarEntradas();
                    break;
                case 4:
                    generarMusicos();
                    break;
                case 5:
                    generarDiscos();
                    break;
                case 6:
                    generarCanciones();
                    break;
                case 7:
                    generarTabla();
                    break;
            }
        } catch (IOException ex) {
            Logger.getLogger(Generador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
