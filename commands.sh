#!/bin/bash

while true; do
    echo ""
    echo "===== AVR Blinky CI/CD Menu ====="
    echo "1) Configure (cmake -B build)"
    echo "2) Build (cmake --build build)"
    echo "3) Flash (cmake --build build --target flash)"
    echo "4) Clean (rm -fr build)"
    echo "5) Exit"
    echo "================================="
    echo -n "Select command (1-5): "
    
    read choice
    
    case $choice in
        1)
            echo "Running: Configure..."
            docker run --rm -v $(pwd):/work -w /work avr-blinky-cicd cmake -B build
            ;;
        2)
            echo "Running: Build..."
            docker run --rm -v $(pwd):/work -w /work avr-blinky-cicd cmake --build build
            ;;
        3)
            echo "Running: Flash..."
            docker run --rm -v $(pwd):/work -w /work --device /dev/ttyACM0:/dev/ttyACM0 avr-blinky-cicd cmake --build build --target flash
            ;;
        4)
            echo "Running: Clean..."
            docker run --rm -v $(pwd):/work -w /work avr-blinky-cicd bash -c "rm -fr build"
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select 1-5."
            ;;
    esac
done
