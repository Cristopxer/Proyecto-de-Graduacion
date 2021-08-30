/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conn;
import Interface.Log;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Topher
 */
public class LoginDAO implements Log {

    Conn cn = new Conn();
    Connection con;
    PreparedStatement st;
    ResultSet rs;

    @Override
    public User login(String user, String pass) {
        User u = new User(user, pass);
        String sql = "SELECT u.ID_USER, r.NAME FROM USER as u "
                + "INNER JOIN ROLE as r ON u.ID_ROLE=r.ID WHERE u.STATUS=1 AND "
                + "u.USER='" + u.getUserName() + "' AND u.PASSWORD='" + u.getPassword() + "'";
        try {
            con = cn.getConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                u.setRoleName(rs.getString("ID_USER"));
                u.setStatus("1");
                u.setRoleName(rs.getString("NAME"));
            }

        } catch (Exception e) {
            System.err.println("Error executing LoginDAO");
        }
        return u;
    }

}
