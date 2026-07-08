# MFA  Brute Force Helper

## Overview

MFA  Brute Force Helper is a Bash script designed to automate the testing of numeric MFA (Multi-Factor Authentication) codes in authorized security testing environments.

The script sends HTTP POST requests using `curl` and tests all possible 4-digit MFA codes from:

```
0000
```

to:

```
9999
```

The script keeps the required authentication cookies and analyzes the server response to detect when a valid MFA code is found.

---

## Features

* Tests all 10,000 possible MFA combinations.
* Automatically keeps the 4-digit format (`0000` - `9999`).
* Uses `curl` to send HTTP POST requests.
* Supports authenticated sessions using cookies.
* Stops automatically when a possible valid code is detected.
* Saves the successful server response for further analysis.

---

## Requirements

Before running the script, make sure you have:

* Linux or macOS
* Bash shell
* curl installed

Check curl installation:

```bash
curl --version
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/USERNAME/mfa-code-bruteforce-helper.git
```

Enter the project directory:

```bash
cd mfa-code-bruteforce-helper
```

Make the script executable:

```bash
chmod +x brute_mfa.sh
```

---

## Configuration

Before running the script, edit the following variables inside `brute_mfa.sh`:

```bash
URL="https://target-website.com/login2"

SESSION="your-session-cookie"

VERIFY="your-verification-cookie"
```

Replace them with the values from your authorized testing environment.

---

## Usage

Run the script:

```bash
./brute_mfa.sh
```

The script will automatically test:

```
0000
0001
0002
...
9998
9999
```

Example output:

```
[*] Testing MFA code: 0000
[*] Testing MFA code: 0001
[*] Testing MFA code: 0002
...
[+] Possible valid MFA code found: 3847
```

The response returned by the server will be saved in:

```
success_response.html
```

---

## Important Note

This tool is intended only for authorized security testing.

Allowed usage examples:

* Security training laboratories.
* CTF challenges.
* Applications you own.
* Systems where you have explicit permission to test.

Do not use this script against systems without authorization.

---



MIT License
