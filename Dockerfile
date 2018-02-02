#APACHE2
FROM httpd

#Add openxpki to apt:
RUN echo "deb http://packages.openxpki.org/debian/ jessie release" > /etc/apt/sources.list.d/openxpki.list

#add key:
RUN wget https://packages.openxpki.org/debian/Release.key -O - | apt-key add -

#Update apt:
RUN apt-get update -y

#install cgi modules and mysql:
RUN apt-get install -y --no-install-recommends \
                    mysql-server \
                    libdbd-mysql-perl \
                    libapache2-mod-fcgid \
                    libcgi-perl \
                    libmodule-load-perl

#Enable fcgid
RUN a2enmod fcgid

#install openxpki
RUN apt-get install -y --no-install-recommands \
                    libopenxpki-perl \
                    openxpki-i18n

#install sql scripts:
WORKDIR /root/
COPY openxpki-db-user.sql
COPY openxpki-db-
