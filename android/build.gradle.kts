buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath "com.android.tools.build:gradle:7.4.0"

        // Update to the latest Google Services plugin version
        classpath("com.google.gms:google-services:4.3.15") // Update if needed

        // Update to the latest Kotlin plugin version
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.20") // Replace with the latest version
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = "../build"
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}
