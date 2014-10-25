FROM ubuntu
RUN apt-get update -y
RUN apt-get install supervisor mysql-client apache2 php5 php-apc imagemagick php5-mysql libapache2-mod-php5 wget -y
COPY apache2.conf /etc/supervisor/conf.d/apache2.conf
RUN wget http://releases.wikimedia.org/mediawiki/1.23/mediawiki-1.23.5.tar.gz
RUN tar xvzf mediawiki-1.23.5.tar.gz
RUN rm /mediawiki-1.23.5.tar.gz
RUN mv mediawiki-1.23.5 /var/www/html/mediawiki
COPY LocalSettings.php /etc/mediawiki
COPY run.sh /run.sh
RUN chmod 755 /run.sh
RUN chmod a+rwx /etc/mediawiki
RUN chmod a+w /var/www/html/mediawiki/images

EXPOSE 80 8080
CMD /run.sh
