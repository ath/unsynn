# Test Results Generator

## Overview

This script runs the Rust test suite for the unsynn project and saves the output to a `test_results.txt` file in the project root directory.

## Requirements

- Rust and Cargo must be installed and available in the PATH
- Internet access for fetching dependencies (the script will abort if dependencies cannot be fetched)

## Usage

```bash
./generate_test_results.sh
```

## Output

The script will:

1. Check if Cargo is available in the PATH
2. Try to fetch dependencies to detect any firewall issues
3. Run the test suite and save the output to `test_results.txt`
4. Display status messages about the process

If there are any issues fetching dependencies or running the tests, appropriate error messages will be displayed.

## Notes

- The script will abort if dependencies cannot be fetched, which may indicate firewall issues
- Even if some tests fail, the output will still be saved to `test_results.txt`