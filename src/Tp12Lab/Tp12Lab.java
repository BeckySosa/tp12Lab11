/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Tp12Lab;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Estudiante
 */
public class Tp12Lab {

    public static void main(String[] args) {
        try {
            Class.forName("org.mariadb.jdbc.Driver");//
            String bD="jdbc:mysql://localhost:3306/obrador";
            String usuario="root";
            String password="";
            Connection con=  DriverManager.getConnection(bD,usuario,password);
            
//            String sql="INSERT INTO "
//                    + "empleado(dni, apellido, nombre, acceso, estado) "
//                    + "VALUES (34578932,'Eliseo','Avaca',3,true),"
//                    +"(23456456,'Nando','Aguero',2,true),"
//                    +"(12356986,'Gerardo','Moya',1,true)";
//    PreparedStatement ps=con.prepareStatement(sql);
 //     int filas=ps.executeUpdate();
//            String sql1="INSERT INTO "
//                    +"herramienta(nombre,descripcion,stock,estado) "
//                    + "VALUES('Amoladora','Black Decker',10,true),"
//                    +"('Pala','Ancha',10,true)";

//              PreparedStatement ps1=con.prepareStatement(sql1);
//             int filas=ps.executeUpdate();

//     int filas=ps1.executeUpdate();

       /* String sql2="SELECT *  FROM herramienta where stock > ? ";
        PreparedStatement ps2=con.prepareStatement(sql2);
        int estadoConsulta=10;
      
        ps2.setInt(1,estadoConsulta);///el indice
     
        ResultSet dato=ps2.executeQuery();
        while(dato.next()){
            System.out.println("id "+ dato.getInt("idHerramienta"));
            System.out.println("nombre "+ dato.getString("nombre"));
            System.out.println("descripcion "+ dato.getString("descripcion"));
            System.out.println("stock "+ dato.getInt("stock"));
            System.out.println("estado "+ dato.getBoolean("estado"));
        }
*/
      
      String sql3= "UPDATE empleado SET estado = ? WHERE idEmpleado = 1 ";
      PreparedStatement ps3=con.prepareStatement(sql3);
      boolean baja=false;
      ps3.setBoolean(1,baja);
      int filas=ps3.executeUpdate();
      
      

             if(filas >0){
             
                 JOptionPane.showMessageDialog(null, "Agregado ala base de dato");
                 
             }
             
        
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null, "Error al cargard driver");
        } catch (SQLException ex) {
            int codigoE=ex.getErrorCode();
            if(codigoE==1062){
                  JOptionPane.showMessageDialog(null, "Entrada Duplicada");
            } else if(codigoE==1049){
            JOptionPane.showMessageDialog(null, "BD Desconocida");
            }else{
                  JOptionPane.showMessageDialog(null, "Error ");
            }
            
            ex.printStackTrace();
            System.out.println("codigo de error "+ex.getErrorCode());
        }
        
        
    }
    }
    

