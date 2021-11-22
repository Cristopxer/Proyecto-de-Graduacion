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
        System.out.println(Arrays.toString(months));
        String[] detections = chart.getMonthlyDetection().split(",");
        System.out.println(Arrays.toString(detections));
        String[] dataChart = "0,0,0,0,0,0,0,0,0,0,0,0".split(",");
        Integer count = 0;
        for (String dx : months) {
            dataChart[Integer.parseInt(dx) - 1] = detections[count];
            count = count + 1;
        }
        String data = dataChart.toString();
        System.out.println(Arrays.toString(dataChart));
//        DetectionDAO d = new DetectionDAO();
//        ArrayList<Detection> dd = d.Detection();
//        ChartDAO chart = new ChartDAO();
//        Chart ct = chart.Chart();
//        String[] c = ct.getYear().split(",");
//        for (String year : c) {
//            System.out.println(year);
//            for (Detection ddd : dd) {
////                System.out.println(ddd.getDate().split("-")[0]);
//                if (ddd.getDate().split("-")[0].equals(year.replace("'", ""))) {
//                    System.out.println(ddd.getImgPath());
//                }
//            }
//        }

    }
}
