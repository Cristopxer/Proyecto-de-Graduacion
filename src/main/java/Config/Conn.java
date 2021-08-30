/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Topher
 */
public class Conn {

    Connection con;

    public Conn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PG", "PG", "4BbbPAFA.");
        } catch (Exception e) {
            System.err.println("Error Connecting to Database: " + e.getMessage());
        }
    }

    public Connection getConnection() {
        return con;
    }

}
