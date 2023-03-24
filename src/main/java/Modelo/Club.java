/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Vista.Main;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author ESTUDIANTE
 */
public class Club {

    private ArrayList<Socio> socios;
    private ArrayList<Persona> personas;

    public Club() {
        this.socios = new ArrayList();
        this.personas = new ArrayList();
    }

    public ArrayList<Socio> getSocios() {
        return socios;
    }

    public void setSocios(ArrayList<Socio> socios) {
        this.socios = socios;
    }

    public ArrayList<Persona> getPersonas() {
        return personas;
    }

    public void setPersonas(ArrayList<Persona> personas) {
        this.personas = personas;
    }

    public boolean eliminarSocio(int cedulaCliente) {
        return true;
    }

    public double totalConsumos(int cedulaCliente) {
        return 0;
    }

    public boolean registrarSocio(String nombre, String cedula, String fondosDisponibles, String tipoSuscripcion) {
        Socio socio = buscarSocioId(cedula);
        boolean suscripcion = sociosVIP(tipoSuscripcion);

        if (suscripcion == false) {
            JOptionPane.showMessageDialog(null, "No hay más cupos para socios VIP!!");
            return false;
        }

        boolean respuesta = validarFondo(fondosDisponibles, tipoSuscripcion, suscripcion);
        if (respuesta == true) {
            //En caso de NO existir un socio con esa cédula ya puedo crearlo como nuevo socio
            socio = new Socio(fondosDisponibles, tipoSuscripcion, nombre, cedula);
            socios.add(socio);
            JOptionPane.showMessageDialog(null, socio.getNombre()
                    + " bienvenid@, ya eres miembro del club social");

            return true;
        }
        return false;

    }

    public boolean actualizarMonto(String cedula, double nuevoMonto) {
        double sumMonto;
        
        for(Socio socio: this.socios){
            if(socio.getCedula().equals(cedula)){
                sumMonto = Double.parseDouble(socio.getFondoDisponible()) + nuevoMonto;
                socio.setFondoDisponible(String.valueOf(sumMonto));
                return true;
            }
        }
        return false;
        
    }

    /**
     * Método para listar las personas autorizadas
     */
    public void listarPersonas() {
        String salida = "";
        for (Socio interador : socios) {
            salida += interador.listarPersonas() + '\n';
        }
        JOptionPane.showMessageDialog(null, salida);
    }

    /**
     * Método para validar el fondo de los socios registrados
     * @param fondosDisponibles
     * @param tipoSuscripcion
     * @param suscripcion
     * @return 
     */
    public boolean validarFondo(String fondosDisponibles, String tipoSuscripcion, boolean suscripcion) {
        if (suscripcion == true) {
            if (tipoSuscripcion.equals("VIP") && (Double.parseDouble(fondosDisponibles) < 100000 || Double.parseDouble(fondosDisponibles) > 5000000)) {
                JOptionPane.showMessageDialog(null, "El valor del fondo del afiliado VIP no puede ser menor a 100000 y mayor a 5000000$");
                return false;

            }
        }

        if (tipoSuscripcion.equals("Regular") && (Double.parseDouble(fondosDisponibles) < 50000 || Double.parseDouble(fondosDisponibles) > 1000000)) {
            JOptionPane.showMessageDialog(null, "El valor del fondo del afiliado regular no puede ser menor a 50000 y mayor a 1000000$");
            return false;

        }
        return true;

    }

    /**
     * Método para filtrar los socios por cédula
     * @param cedula
     * @return 
     */
    public Socio buscarSocioId(String cedula) {
        for (Socio socio : this.socios) {
            if (socio.getCedula().equals(cedula)) {
                return socio;
            }
        }
        return null;
    }

    /**
     * Método para validar el número de socios VIP
     */
    private boolean sociosVIP(String tipoSuscripcion) {
        int cont = 1;
        if (tipoSuscripcion.equals("VIP")) {
            for (Socio socio : this.socios) {
                if (socio.getTipoSuscripcion().equals(tipoSuscripcion)) {
                    cont++;
                }
            }
        }
        return cont <= 3;
    }
}
