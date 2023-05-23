/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ticket_reservation.controllers;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import ticket_reservation.models.user;
import ticket_reservation.views.screen.login_screen;
import ticket_reservation.views.screen.dashboard_screen;
import ticket_reservation.views.screen.ticket_screen;

/**
 *
 * @author Lenovo
 */
public class login_controller {
    
    private login_screen view;
    user model = new user();
    PreparedStatement pst;
    public login_controller (user model, login_screen view){
        this.model = model;
        this.view = view;
    }

    public void login(String text, String text1) {
        
         String user = text;
         String pass = text1;
            
            try{
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiket_reservation", "root", "");
         String sql = "SELECT * FROM `user` WHERE `username` = '" + user + "'" + " AND `password` = '" + pass + "'";
            pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
 
            if(rs.next()){
            int id = rs.getInt("id");
            String username = rs.getString("username");
            String  password = rs.getString("password");
            String nama = rs.getString("nama");
            int no_hp = Integer.parseInt(rs.getString("no_hp"));
            model.setId(id);
            model.setUsername(username);
            model.setPassword(password);
            model.setNama(nama);
            model.setnoHp(no_hp);
            dashboard_screen dashboard = new dashboard_screen(model.GetId());
            dashboard.setVisible(true);
            view.dispose();
            connection.close();
            }
             else{
                    JOptionPane.showMessageDialog(null, "Incorrect Username Or Password", "Login Failed", 2);
                }
           
        } catch (SQLException ex) {
            Logger.getLogger(sign_up_controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    
}
