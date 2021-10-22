/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Topher
 */
public class Chart {

    private String monthDetection;
    private String monthlyDetection;
    private String storeName;
    private String storeDetection;
    private String year;
    private String yearDetection;
    private String dayNotDetection;

    public void Chart() {
    }

    public String getMonthDetection() {
        return monthDetection;
    }

    public void setMonthDetection(String monthDetection) {
        this.monthDetection = monthDetection;
    }

    public String getMonthlyDetection() {
        return monthlyDetection;
    }

    public void setMonthlyDetection(String monthlyDetection) {
        this.monthlyDetection = monthlyDetection;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStoreDetection() {
        return storeDetection;
    }

    public void setStoreDetection(String storeDetection) {
        this.storeDetection = storeDetection;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getYearDetection() {
        return yearDetection;
    }

    public void setYearDetection(String yearDetection) {
        this.yearDetection = yearDetection;
    }

    public String getDayNotDetection() {
        return dayNotDetection;
    }

    public void setDayNotDetection(String dayNotDetection) {
        this.dayNotDetection = dayNotDetection;
    }

}
