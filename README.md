<!--
SPDX-FileCopyrightText: 2026 project516 <project516@project516.dev>

SPDX-License-Identifier: MIT
-->

# JavaAppTemplate

## Setup

**Requirements**

- **Java JDK**: Java 8 or newer installed and `JAVA_HOME` configured.
  - If your are on a Unix system (MacOS/Linux), [SDKMAN](https://sdkman.io) is a great tool for managing JDKs.
  - Also perfer the latest LTS JDK (currently 25) as it has newer features and fixes.
    - Java 8 support is kept, because it is hard to find a decive without support for it. 

**Quick start — Terminal**

Linux / macOS (bash / zsh):

```bash
# from project root
./gradlew clean build
./gradlew run
```

Windows (PowerShell):

```powershell
# from project root
.\gradlew.bat clean build
.\gradlew.bat run
```

Windows (CMD):

```cmd
cd %~dp0
gradlew.bat clean build
gradlew.bat run
```

Notes:
- `./gradlew run` uses the Gradle `application` plugin (if configured) to run the app.
- To run the produced JAR directly after building:

```bash
# replace with the actual jar name in build/libs
java -jar build/libs/JavaAppTemplate-all.jar
```

**Run tests**

```bash
# run tests
./gradlew test
```

**Run in Visual Studio Code**

1. Open the project folder in VS Code.
2. Install the **Java Extension Pack** (provides Language Support, Debugger, Maven/Gradle support).
3. Use the **Run and Debug** view to create or start a Java launch configuration, or:
	- Open the built-in Terminal (View → Terminal) and run `./gradlew run` (or `gradlew.bat run` on Windows).
	- Use the **Gradle Tasks** view (from the sidebar) to run the `run` or `test` tasks.

**Troubleshooting**

- If Gradle complains about Java version, ensure `JAVA_HOME` points to a supported JDK and that `java -version` shows the same.
  - If you are using SDKMAN run `sdk current java`.
- On Windows, prefer PowerShell or Git Bash for the provided scripts; ensure `gradlew.bat` is executable.
- If you get missing dependency errors, run `./gradlew --refresh-dependencies`.

**Files**

See the main entry point at `src/main/java/dev/project516/JavaAppTemplate/Main.java`.
