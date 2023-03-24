/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Modelo.Club;
import Modelo.Socio;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class ValidarRegistroSocio {

    private Club club;
    Socio socio = new Socio();

    public ValidarRegistroSocio(Club club) {
        this.club = club;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }

    public boolean registrarSocio(String nombre, String cedula, String fondosDisponibles, String tipoSuscripcion) {
        boolean estado = false;
        socio = club.buscarSocioId(cedula);

        if (nombre.equals("") || nombre.equals(false)) {
            JOptionPane.showMessageDialog(null, "El campo nombre no puede estar vacio");
            return estado;
        }
        if (cedula.equals("") || cedula.equals(false)) {
            JOptionPane.showMessageDialog(null, "El campo cédula no puede estar vacio");
            return estado;
        }
        if (fondosDisponibles.equals("") || fondosDisponibles.equals(false)) {
            JOptionPane.showMessageDialog(null, "El campo fondos no puede estar vacio");
            return estado;
        }

        try {
            Double.parseDouble(fondosDisponibles);

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "El valor debe ser un dato numérico");

        }

        //A continuación llamamos el método registrarSocio de la clase Club
        try {

            estado = club.registrarSocio(nombre, cedula, fondosDisponibles, tipoSuscripcion);
            return estado;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "OCURRIO UN ERROR INESPERADO");
            return estado;
        }

    }

    /**
     * Método para actualizar el monto del socio
     */
    public void actualizarMonto() {
        String cedula;
        double monto;
        cedula = JOptionPane.showInputDialog("Ingrese la cédula del socio correspondiente");
        monto = Double.parseDouble(JOptionPane.showInputDialog("Ingrese el monto"));

        if (cedula.equals("") || cedula.equals(false)) {
            JOptionPane.showMessageDialog(null, "El campo cédula no puede estar vacio");
            return;
        }

        if (Double.parseDouble(cedula) < 0) {
            JOptionPane.showMessageDialog(null, "El campo cédula no puede ser un número negativo");
            return;
        }
        if (monto < 0) {
            JOptionPane.showMessageDialog(null, "El campo monto no puede ser un número negativo");
            return;
        }
        consultarSocio(cedula);

        if(club.actualizarMonto(cedula, monto)){
           JOptionPane.showMessageDialog(null, "Monto actualizado correctamente"); 
        }
        

    }

    public Socio consultarSocio(String cedula) {

        if (cedula.equals("") || cedula.equals(false)) {
            JOptionPane.showMessageDialog(null, "El campo cédula no puede estar vacio");
            return null;
        }
        if (club.buscarSocioId(cedula) == null) {
            JOptionPane.showMessageDialog(null, "No existe un socio con ese número de cédula");
            return null;
        } else {
            socio = club.buscarSocioId(cedula);
            return socio;
        }

    }

}
