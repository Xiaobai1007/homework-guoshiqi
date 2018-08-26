package com.dao;

public class main {
    public static void main(String[] args) {
        String num = "";
        for (int i = 0; i < 5; i++) {
            num += (int)(Math.random() * 10);
        }
        System.out.println(num);
    }
}
