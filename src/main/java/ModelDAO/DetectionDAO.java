/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conn;
import Interface.Detect;
import Model.Detection;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Topher
 */
public class DetectionDAO implements Detect {
    Conn cn = new Conn();
    Connection con;
    PreparedStatement st;
    ResultSet rs;

    @Override
    public ArrayList<Detection> Detection() {
        ArrayList<Detection> list = new ArrayList<Detection>();
        String sql = "CALL SP_DISPLAY_DETECTIONS()";
        try {
            con = cn.getConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Detection d = new Detection();
                d.setDate(rs.getString("CREATED_AT"));
                d.setStore(rs.getString("STORE_NAME"));
                d.setCamera(rs.getString("CAMERA_NUMBER"));
                d.setImgPath(rs.getString("IMG_PATH"));
                list.add(d);
            }
        } catch (Exception e) {
            System.err.println("Error executing DetectionDAO" + e.getMessage());
        }
        return list;
    }
    
}
