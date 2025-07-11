#!/bin/bash

# This script generates charts from all .mmd files in the current directory

# Check if mermaid-cli is installed
if ! command -v mmdc &> /dev/null
then
    echo "Mermaid CLI (mmdc) could not be found. Please install it first."
    exit 1
fi

# Create an output directory if it doesn't exist
mkdir -p output

# Generate charts for all .mmd files
for file in *.mmd; do
    if [ -f "$file" ]; then
        output_file="output/${file%.mmd}.png"
        echo "Generating chart for $file -> $output_file"
        mmdc -i "$file" -o "$output_file"
    fi
done

echo "All charts have been generated in the 'output' directory."
