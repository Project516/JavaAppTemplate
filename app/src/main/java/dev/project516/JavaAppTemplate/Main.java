// SPDX-FileCopyrightText: 2026 project516 <project516@project516.dev>
//
// SPDX-License-Identifier: MIT

package dev.project516.JavaAppTemplate;

public class Main {

    public String greetUser() {
        return "Hello!";
    }

    public static void main(String[] args) {

        System.out.println(new Main().greetUser());
    }
}
