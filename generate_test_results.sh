#!/bin/bash

# Generate test results by running cargo test and saving output to test_results.txt
# This script is part of the solution for issue #3

# Check if cargo is available
if ! command -v cargo &> /dev/null; then
    echo "Error: cargo is not available in PATH. Aborting."
    exit 1
fi

# Try to fetch dependencies to see if there are any firewall issues
echo "Checking if dependencies can be fetched..."
if ! cargo fetch &> /dev/null; then
    echo "Error: Unable to fetch dependencies. This might be due to firewall issues. Aborting."
    exit 1
fi

# Run cargo test and save output to test_results.txt
echo "Running cargo test and generating test_results.txt..."
cargo test > test_results.txt 2>&1

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Test results generated successfully in test_results.txt"
else
    echo "Warning: Tests ran but there might be some failing tests. Results saved to test_results.txt"
fi

echo "Done."