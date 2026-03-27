// SPDX-FileCopyrightText: 2026 project516 <project516@project516.dev>
//
// SPDX-License-Identifier: MIT

package dev.project516.JavaAppTemplate;

import static org.junit.Assert.*;

import org.junit.Test;

public class GreetTest {
    @Test
    public void testGreetsUser() {
        Greet classUnderTest = new Greet();
        assertNotNull("Should greet the user", classUnderTest.greetUser());
    }
}
