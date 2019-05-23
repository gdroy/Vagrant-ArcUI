Vagrant - ArcUI
===============

A simple Vagrant file for creating a lightweight ArcUI for testing job submission for vo.scotgrid.ac.uk.


Requirements
============

An appropriate Grid certificate split into userkey.pem and usercert.pem by using the commands below:
``` 
 openssl pkcs12 -clcerts -nokeys -out usercert.pem -in certificate.p12
 openssl pkcs12 -nocerts -out userkey.pem -in certificate.p12
```

and ensure the permissions are correct on the certificat and key:
```
chmod 400 userkey.pem
chmod 644 usercert.pem
```

Usage
=====

Create your virtual machine:
```
 vagrant up
```
Log into your virtual machine:
```
 vagrant ssh
```
Ensure the environment know where you key and certificate are located:
``` 
 export X509_USER_CERT=/vagrant/usercert.pem
 export X509_USER_KEY=/vagrant/userkey.pem
```
Change into the testing directory:
```
 cd /vagrant/TestSubmission
```
Create a proxy:
```
arcproxy -S vo.scotgrid.ac.uk -N
```

Submit the test job to the ArcCE of your choice:
```
 arcsub -c <arcce> submit.rsl
```
Check status and see the output of StdOut and StdErr:
```
 arcstat -a
 arccat -a
```
Retrive the Job SandBox when finished:
```
 arcget -D /home/vagrant/ -a
```
