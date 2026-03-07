package com.example;

public class App {
    public static void main(String[] args) {
        System.out.println("Hello DevOps CI/CD Pipeline");
        while(true){
            try {
                Thread.sleep(5000);
                System.out.println("Application Running...");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
