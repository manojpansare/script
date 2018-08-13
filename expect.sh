#!/bin/bash
query_file="/backup/query.txt"
>$query_file
for i in 192.168.1.1{6..9}
do
	for table in RBT_SUBSCRIBER_HISTORY RBT_SUBSCRIBER_INFO
	do
    	(  /usr/bin/expect <<EOD
 	set timeout -1
 	spawn ssh test@$i "zgrep '$table' /backup/LOG_BACKUP/2018/`date -d "yesterday" +"%b"`/`date -d "yesterday" +"%d"`/th/transactionHandler*"
 	expect "*password:"
 	send -- "xxxxxxxxxx\n"
 	expect "$"
EOD
    	) | egrep "update|insert" >> $query_file
 	done
done
sed -i 's/^.*update/update/g' $query_file
sed -i 's/^.*insert/insert ignore/g' $query_file
/mysql/mysql/bin/mysql -uroot -p'xxxxxxxxxxx' test -fe "source $query_file;"
