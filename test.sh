#!/bin/sh

# SPDX-FileCopyrightText: 2026 project516 <project516@project516.dev>
#
# SPDX-License-Identifier: MIT

./gradlew build || exit 1

java -jar app/build/libs/app-all.jar
