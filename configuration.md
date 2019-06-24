---
title: Configuration
---

# Configuration
---
title: Configuration
---

# Configuration
---

## **Clone**

Clone repository from <a href="https://github.com/oktayalizada/nosy" target="_blank">repository</a> The code consists of 3 repositories nosy-admin, nosy-gui and nosy-email.

<br />

## **Configuration**

### **Step One**

We start configuring nosy-admin. Configuration is pretty straightforward, if you recall Architecture page Nosy admin is protected by Keycloak and using Postgres database for persisting data. Besides that we use Kafka Topics to communicate between components. So all configurations are related to those features will be configured via environment variables.

<br />

#### **Nosy Admin Configuration**

```
NOSY_FROM_ADDRESS=xxx@xxx.com
DATASOURCE_URL=jdbc:postgresql://xxxxx:5432/nosydb
DATASOURCE_USERNAME=xxxxx
DATASOURCE_PASSWORD=xxxxx
KAFKA_BROKER_URL=xxxxxx:xxxxx
```

Let's investigate each of these fields in detail

`NOSY_FROM_ADDRESS=xxx@xxx.com`

Above mentioned environment variable specifies what will be the default mail sender address. Keep in mind that in Nosy you can also configure default mail server address which can be linked to a private mail server. In addition you can use two more options: Gmail and Yandex. If you prefer to send emails from your private email address then this field should be initialized to your email server address. For example: test@example.com

`DATASOURCE_URL=jdbc:postgresql://xxxxx:5432/nosydb`

Above mentioned field specifies the address, port and database of postgress server. For example: jdbc:postgresql://127.0.0.1:5432/nosydb

`KAFKA_BROKER_URL=xxxxxx:xxxxx`

Above mentioned field specifies the address and port of Kafka broker for streaming. For example: example.com:9092

```
DATASOURCE_USERNAME=xxxxx
DATASOURCE_PASSWORD=xxxxx
```

Above mentioned environment variables specify the username, password for postgres database. For example: username: nosy, password: nosy

```
KEYCLOAK_ADMIN_USER=xxxxxx
KEYCLOAK_ADMIN_PASSWORD=xxxxx
KEYCLOAK_CLIENT=xxxxx
KEYCLOAK_AUTH_URL=xxxxxxx
KEYCLOAK_REALM=xxxxxxxx
KEYCLOAK_CLIENT_SECRET=xxx-xxx-xxx-xxxxx-xxx
KEYCLOAK_AUTH_URL=http://xxxxxx/xxxx
```

All environment variables mentioned above are related to Keycloak. We will cover configurations of Keycloak in the next section but let's first discuss what each field means in terms of configurations in nosy-admin. The first two fields are the admin user and password for specific client. For example: nosy-client-admin, password: xxxxxx. keycloak.resource is client name of nosy(e.g. nosy-client). keycloak.auth-server-url is the url to keycloak auth(e.g. https://example.com:8080/auth). keycloak.realm is the realm for nosy(e.g nosy-realm) nosy.client.clientSecret is the secret for keycloak.resource(xxxx-xxxxx-xxxx-xxxx). We will talk about it later in keycloak section.



<br/>

### **Step Two**

#### **Keycloak configuration for nosy-admin**

This section will talk about keycloak configurations we need to do in order to make nosy-admin work. Keycloak is open source readhat IAM. You can refer to documentation of Keycloak by going to the following link: Keycloak Docs For api specs please refer to: Keycloak API Spec

Keycloak is open solution tool which plays role of security in nosy system. For more information you can refer to docs, here we will cover configuration for nosy. First of all, we have to create realm which will be used as a security for NoSy. Please bear in mind, this configurations will directly affect configurations of nosy-admin which we did above. To create realm go to Keycloak admin page and on the left corner press add realm. let's call our realm nosy-realm.

![Realm](/assets/images/realm.png "Realm"){: .img-responsive}

After creation of realm you can see on the top left corner which realm you are currently in. Pick nosy-realm and let's move to client creation for this realm. Click clients on the left side and press create on the right side of form. Here you should define Client id which can be nosy-client.

![Client](/assets/images/client.png "Client"){: .img-responsive}

You can leave name, description and login theme empty. You have to change the following fields: Enabled: On Client protocol: openid-connect Access Type: confidential Standard Flow Enabled: On Direct Access Grant Enabled: On Others can be off, because of confidential client please add valid redirect url which is basically your nosy-gui host(For localhost it will be http://localhost:4200)

![Client1](/assets/images/client1.png "Client1"){: .img-responsive}

After the creation of client we should create the client role. Press Roles under the nosy-client(Not Roles on the left side of the page, but inside the client there is a tab called roles). Click add role button and name it(For example nosy-role)

![Role](/assets/images/role.png "Role"){: .img-responsive}

Now go to users on the left side and then on the right side of the form click on Add User. Name our user, for example, admin-user and press save button. This will create an admin user for us. Then go to the credentials tab and set the password.

![User](/assets/images/user.png "User"){: .img-responsive}

Then go inside the user we have just created and click role mappings tab. Click on Client roles and add everything under that to this user.

![Role Mappings](/assets/images/role-mappings.png "Role Mappings"){: .img-responsive}

Keycloak Configurations is done. Now, according to our configurations for keycloak, let's set all variables.

```
KEYCLOAK_ADMIN_USER=xxxxxx
KEYCLOAK_ADMIN_PASSWORD=xxxxx
KEYCLOAK_CLIENT=xxxxx
KEYCLOAK_AUTH_URL=xxxxxxx
KEYCLOAK_REALM=xxxxxxxx
KEYCLOAK_CLIENT_SECRET=xxx-xxx-xxx-xxxxx-xxx
KEYCLOAK_AUTH_URL=http://xxxxxx/xxxx
```

<br/>

### **Step Three**

#### **Postgres and Kafka configurations for NoSy**

We will set up plain postgres and kafka if you have some authentication in kafka please add necessary fields in application properties. For kafka please download kafka version and zookeeper and install them. You can follow instructions here: kafka After installation, please verify that kafka is exposing port if you are running remotely. If you are running locally then you can just add kafka host and port to application properties. Otherwise add ip address and port of kafka:

`KAFKA_BROKER_URL=host:port`

The same steps follow for Postgres. Please download postgres and create a user which can be used in our application and then create db named: nosydb(you can create any other database, but make sure you specify in application.properties) You can follow instructions here: postgres After installation please verify that postgres is exposing port if you are running remotely. If you are running locally then you can just add postgres host and port to application properties. Otherwise add ip address and port of postgres:

```
DATASOURCE_URL=jdbc:postgresql://host:5432/nosydb
DATASOURCE_USERNAME="username you created without quotes"
DATASOURCE_PASSWORD="password without quotes"
```

<br/>

### **Step Four**

#### **NoSy Email Configuration**

Here we will configure only two things. Firstly, it is the kafka host port which will be the same as the one previously mentioned in nosy-admin. Please refer to step 3

`KAFKA_BROKER_URL=host:port`

The second thing is username and password for default email you mentioned in nosy-admin. Please refer to Step 1. This is done because we don't want to transmit your private email password through the network

```
NOSY_FROM_ADDRESS="default email without quotes"
NOSY_FROM_ADDRESS_PASSWORD="default email password without quotes"
```

The configuration part is finished. Thank you!
