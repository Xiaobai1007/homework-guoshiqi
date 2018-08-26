package com.dao;

public class RandomNumber {
    public static String randomNum (){
        String num = "";
        for (int i = 0; i < 5; i++) {
            num += (int)(Math.random() * 10);
        }
        return num;
    }
}
