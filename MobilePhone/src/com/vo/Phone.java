package com.vo;

public class Phone {
    private int id;
    private String name;
    private double price;
    private String datetime;
    private String detailed;
    private int stock;
    private int state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getDetailed() {
        return detailed;
    }

    public void setDetailed(String detailed) {
        this.detailed = detailed;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Phone(int id, String name, double price, String datetime, String detailed, int stock, int state) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.datetime = datetime;
        this.detailed = detailed;
        this.stock = stock;
        this.state = state;
    }

    public Phone(String name, double price, String datetime, String detailed, int stock, int state) {
        this.name = name;
        this.price = price;
        this.datetime = datetime;
        this.detailed = detailed;
        this.stock = stock;
        this.state = state;
    }

    public Phone() {}

    @Override
    public String toString() {
        return "Phone{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", datetime='" + datetime + '\'' +
                ", detailed='" + detailed + '\'' +
                ", state=" + state +
                '}';
    }

}
