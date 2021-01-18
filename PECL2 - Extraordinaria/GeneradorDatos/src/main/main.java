package main;

import java.io.IOException;

public class main {

    public static void main(String[] args) throws IOException {

        Generador grupos = new Generador(1);
        Generador conciertos = new Generador(2);
        Generador entradas = new Generador(3);
        Generador musicos = new Generador(4);
        Generador discos = new Generador(5);
        Generador canciones = new Generador(6);
        Generador tabla = new Generador(7);
        
        grupos.start();
        conciertos.start();
        entradas.start();
        musicos.start();
        discos.start();
        canciones.start();
        tabla.start();

    }

}
