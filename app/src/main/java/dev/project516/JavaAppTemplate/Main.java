package dev.project516.JavaAppTemplate;

public class Main {

    public String greetUser() {
        return "Hello!";
    }

    public static void main(String[] args) {

        System.out.println(new Main().greetUser());
    }
}
