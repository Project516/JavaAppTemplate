package dev.project516.JavaAppTemplate;

import java.util.ArrayList;

public class Greet{

    ArrayList<String> greetingList = new ArrayList<String>();
    
    public Greet() {
        greetingList.add("Hi");
        greetingList.add("Hello");
    }

    public String greetUser() {
        return greetingList.get(0);
    }
}