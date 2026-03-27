// SPDX-FileCopyrightText: 2026 project516 <project516@project516.dev>
//
// SPDX-License-Identifier: MIT

package dev.project516.JavaAppTemplate;

import java.util.ArrayList;
import java.util.Random;

public class Greet {

    ArrayList<String> greetingList = new ArrayList<String>();

    Random rand = new Random();

    public Greet() {
        greetingList.add("Hi");
        greetingList.add("Hello");
    }

    public String greetUser() {
        return greetingList.get(rand.nextInt(2));
    }
}
