package com.example;

public class App {
    public static void main(String[] args) {
        // If you pass an argument, it’ll greet you by name.
        String name = (args.length > 0) ? args[0] : "World";
        System.out.println("Hello, " + name + "!");
    }
}