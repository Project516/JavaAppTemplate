// SPDX-FileCopyrightText: 2026 project516 <project516@project516.dev>
//
// SPDX-License-Identifier: MIT

package dev.project516.JavaAppTemplate;

import static org.junit.Assert.*;

import org.junit.Test;

public class MainTest {
    @Test
    public void testGreetsUser() {
        Main classUnderTest = new Main();
        assertNotNull("Should greet the user", classUnderTest.greetUser());
    }
}
