plugins {
    java
    id("io.freefair.lombok") version "${lombok_version}"
    id("org.springframework.boot") version "${spring_boot_version}"
}

apply(plugin = "io.spring.dependency-management")

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter")
    testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<Test> {
    useJUnitPlatform()
}
