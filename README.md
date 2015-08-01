mysql-ssl
=========

This is a data-only container that generates a cert from the embedded CA.

Setup
-----
You should rebuild the ca.key and ca.crt if you want to use this:

```
$ openssl genrsa -aes256 -out ca.key 4096
$ openssl req -new -x509 -nodes -days 365000 -key ca.key -out ca.crt -subj "/CN=the.narro.ws mysql"
```

Usage
-----
First, start a copy of this container:
```
$ docker run -d -e CN=galera-1 --name galera-1-ssl -e CAPASS=password mysql-ssl
```

Then start a copy of a container that runs mysql and expects configs in `/etc/mysql/ssl.d`:
```
docker run -d --name galera-1 -e ROOTPASS=password --volumes-from galera-1-ssl brimstone/galera
```
