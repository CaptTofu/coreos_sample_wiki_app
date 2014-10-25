/usr/sbin/mysqld &
sleep 10
# this is temporary.
mysqladmin create mediawiki
mysql mediawiki < /tmp/mediawiki.sql
mysql -e "GRANT ALL ON *.* TO root@'172.17.%.%' IDENTIFIED BY 'changeme' WITH GRANT OPTION; FLUSH PRIVILEGES;" mysql 
mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON mediawiki.* TO 'mediawiki'@'172.17.%.%' identified by 'medi@wiki';" mysql
