#!/bin/bash

# Read each line from stdin
while IFS= read -r line; do
    # Process each line
    echo "jenkins-plugin-cli --plugins $line"
done