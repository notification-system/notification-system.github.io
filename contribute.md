---
title: Contribute
---

# Contribute

---

The nosy devlopment team welcomes contributions of all kinds and sizes. This includes everything from from simple bug reports to large features.

We currently have a separate kanban board with prioritized features, if you want to help please contact us using slack on nosyworkspace.slack.com or on github.

## How to setup your deployment environment using docker

The bellow instructions will show you how to setup nosy localy using docker.

### **NOTE I'm counting on that you have docker running on your host**

You can ether pull down our pre built containers that you can find on dockerhub or building the containers your self.

### Create docker infrastrucutre

The same commands should work on mac or windows with the difference on how you get your ip address.

#### Create a docker network unless you have done this already following other nosy documentation

```docker network create -d bridge nosy-net```

Check the docker base ip of your docker server.
I have only saved the important output in these commands, you will see much more.

```bash
ip addr

3: docker0:
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0

```

## nosy-admin

Clone the [nosy-admin repo][nosy-admin]

```docker build -t nosyadmin:latest .```

### Create a env.list file see example bellow

For explination of the file see [nosy configuration][nosy-config]

```bash
NOSY_ADMIN_EMAIL_TOPIC=nosy-admin
KAFKA_BROKER_URL=192.168.0.1:9092
NOSY_FROM_ADDRESS=myprivateemail@gmail.com
DATASOURCE_URL=jdbc:postgresql://192.168.0.1:5432/nosydb
DATASOURCE_USERNAME=nosyuser
DATASOURCE_PASSWORD=SuperSecretPGpwd
KEYCLOAK_ADMIN_USER=nosy-admin-user
KEYCLOAK_ADMIN_PASSWORD=SecretKeycloakPassword
KEYCLOAK_CLIENT=nosy-client
KEYCLOAK_AUTH_URL=http://192.168.0.1:8080/auth
KEYCLOAK_REALM=nosy-realm
KEYCLOAK_CLIENT_SECRET=1234goso-520f-58d9-b143-something000
NOSY_CLIENT_ROLE=nosy-role
```

### Start nosy-admin localy

```docker run -it --rm --env-file env.list -p 8081:8081 --name nosy-admin --network=nosy-net nosyadmin:latest```

You will now be able to reach the nosy-admin api on [http://localhost:8081][localhost]

## nosy-bddtests

Time to run some tests

Clone the [nosy-bddtests repo][nosy-bddtests]

### Build and tag the docker container

```docker build -t nosybdd:latest .```

### Run the docker container using your local bridge bridge ip

Take the docker0 ip address and overwrite the NOSY_ADMIN_URL using environment variable.

#### NOTE: don't forget to add http:// in NOSY_ADMIN_URL, else tests won't work

```docker run -it --rm -e NOSY_ADMIN_URL="http://172.17.0.1:8081" --name nosy-bdd --network=nosy-net nosybdd:latest```

[nosy-config]: https://docs.nosy.tech/configuration
[nosy-admin]: https://github.com/notification-system/nosy-admin
[nosy-bddtests]: https://github.com/notification-system/nosy-bddtests
[localhost]: http://localhost:8081
