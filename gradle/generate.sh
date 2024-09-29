#!/usr/bin/env bash

get_latest_gradle_version() {
  curl "https://services.gradle.org/distributions/" 2>/dev/null |
    sed -nE 's/.*gradle-([0-9]+\.[0-9]+(\.[0-9]+)?)-bin.*/\1/p' |
    head -n1
}

get_latest_lombok_version() {
  curl "https://repo1.maven.org/maven2/io/freefair/gradle/lombok-plugin/maven-metadata.xml" 2>/dev/null |
    sed -nE 's/.*<release>(.*)<\/release>.*/\1/p'
}

get_latest_spring_boot_version() {
  curl "https://repo1.maven.org/maven2/org/springframework/boot/spring-boot-parent/maven-metadata.xml" 2>/dev/null |
    sed -nE 's/.*<release>(.*)<\/release>.*/\1/p'
}

read -r -p "Project name: " project_name
gradle_version="$(get_latest_gradle_version)"
lombok_version="$(get_latest_lombok_version)"
spring_boot_version="$(get_latest_spring_boot_version)"

export project_name
export gradle_version
export lombok_version
export spring_boot_version

source_path="$(dirname "$0")/source"
target_path="${PWD}/${project_name}"
(
  cd "${source_path}" || exit
  find . -type f -exec bash "../copy_file.sh" "{}" "${target_path}/{}" \;
)
