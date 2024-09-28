#!/usr/bin/env bash

get_latest_spring_boot_version() {
  curl "https://repo1.maven.org/maven2/org/springframework/boot/spring-boot-parent/maven-metadata.xml" 2>/dev/null |
    sed -nE 's/.*<latest>(.*)<\/latest>.*/\1/p'
}

read -r -p "Project name: " project_name
gradle_version="GV"
lombok_version="LV"
spring_boot_version=$(get_latest_spring_boot_version)

source_path=$(dirname "$0")
mkdir -p "${project_name}"
cp -r "${source_path}/source/"* "${project_name}"
