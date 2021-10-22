/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conn;
import Model.Chart;
import Model.Detection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author Topher
 */
public class test {

    public static void main(String[] args) {
        ChartDAO ch = new ChartDAO();
        Chart c = ch.Chart();
//        System.out.println(c.getYearDetection());
//        for (String num : c.getMonthlyDetection().split(",")){
//            System.out.println(num);
//        }
        Chart chart = c;
        String[] months = chart.getMonthDetection().split(",");
        String[] detections = chart.getMonthlyDetection().split(",");
        String[] dataChart = "0,0,0,0,0,0,0,0,0,0,0,0".split(",");
        for (String dx : months) {
            Integer count = 0;
            dataChart[Integer.parseInt(dx)] = detections[count];
            count++;
        }
        String data = dataChart.toString();
        System.out.println(Arrays.toString(dataChart));
    }

}
