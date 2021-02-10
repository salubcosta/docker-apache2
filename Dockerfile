FROM ubuntu

MAINTAINER Salumão Barbosa da Costa <salubcosta@gmail.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 && apt-get install -y apache2-utils && apt-get clean && echo "ServerName localhost" >> /etc/apache2/apache2.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_LOCK_DIR /var/log/apache2

EXPOSE 80

ENTRYPOINT ["apache2ctl"]
CMD ["-DFOREGROUND"]
