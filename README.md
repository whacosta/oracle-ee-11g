# Oracle Database EE 11gR2

## Introduction

> Dockerfile usando imagen sath89/oracle-ee-11g con SSH y X11 para uso de interfaz grafica 

## Code Samples

> No olvidar modificar las credenciales de los usuarios root y oracle 
>>  RUN echo 'root:root' | chpasswd

>>  RUN echo 'oracle:oracle' | chpasswd

>  Para Instalar SSH.
>>RUN yum -y install openssh-server

> Para Instalar Install X11
>>RUN yum install -y xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps

>Se recomienda usar MobaXterm o Xming para poder hacer uso de la interfaz grafica de aplicaciones como dbca, ubicada en la ORACLE_HOME
 >> ORACLE_HOME=/u01/app/oracle/product/11.2.0/EE


## Installation

> Para Instalar
>> docker build -t  [anyname] .

>Para correr:
>>docker run -d -p 8080:8080 -p 1521:1521 -P [anyname]