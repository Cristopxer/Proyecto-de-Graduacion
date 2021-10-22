/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conn;
import Interface.Char;
import Model.Chart;
import Model.Detection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Topher
 */
public class ChartDAO implements Char {

    Conn cn = new Conn();
    Connection con;
    PreparedStatement st;
    ResultSet rs;

    @Override
    public Chart Chart() {
        Chart ch = new Chart();
        String sql = "CALL SP_GET_DETECTION_MONTHLY()";
        try {
            con = cn.getConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                ch.setMonthDetection(ch.getMonthDetection() == null ? rs.getString("MONTH") : ch.getMonthDetection() + "," + rs.getString("MONTH"));
                ch.setMonthlyDetection(ch.getMonthlyDetection() == null ? rs.getString("COUNT(*)") : ch.getMonthlyDetection() + "," + rs.getString("COUNT(*)"));
            }
            sql = "CALL SP_GET_DETECTION_STORE()";
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                ch.setStoreName(ch.getStoreName() == null ? "'" + rs.getString("STORE_NAME") + "'" : ch.getStoreName() + ",'" + rs.getString("STORE_NAME") + "'");
                ch.setStoreDetection(ch.getStoreDetection() == null ? rs.getString("COUNT(*)") : ch.getStoreDetection() + "," + rs.getString("COUNT(*)"));
            }
            sql = "CALL SP_GET_DETECTION_YEARLY()";
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                ch.setYear(ch.getYear() == null ? "'" + rs.getString("YEAR") + "'" : ch.getYear() + ",'" + rs.getString("YEAR") + "'");
                ch.setYearDetection(ch.getYearDetection() == null ? rs.getString("COUNT(*)") : ch.getYearDetection() + "," + rs.getString("COUNT(*)"));
            }
            sql = "CALL SP_GET_DAY_NOT_DETECTIONS()";
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                ch.setDayNotDetection(rs.getString("ZERO_DAY"));
            }
            con.close();
        } catch (Exception e) {
            System.err.println("Error executing DetectionDAO" + e.getMessage());
        }
        return ch;
    }
}
