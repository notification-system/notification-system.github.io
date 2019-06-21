---
title: Usage
---

# Usage
---

## **Usage**

The first page of the system is Login Page:

![Login](/assets/images/login.png "Login"){: .img-responsive}

Every user should be registered before using the system. In this page we have two buttons Login or Register Now. If user hasn't been registered yet, he/she should press Register Now button. Then the user will be redirected to the following page:

![Register](/assets/images/register.png "Register"){: .img-responsive}

#### **1.1 Profile Management**

All users have profiles and they can delete their data from the system. For that user should press the avatar on top the right corner and go to the profile:

![Profile](/assets/images/profile.png "Profile"){: .img-responsive}

#### **1.2 Input Systems**

Input Systems are the logical group of several user tools(SMS, Email, Pusher). By creating Input System user can map several tools to that input System. Logical groups can be defined as an example:

* Suppose you have a company A which uses Pusher and Email services of NoSy. Then your Input System will be e.g company_A and all your configurations regarding to this company will go under this input system
* If you have several companies then you create several input Systems and map them to respective email, sms or push notifications.
* You can create, manage or delete Input Systems by pressing the respective button on the left of the screen

![Input System](/assets/images/inputsystem.png "Input System"){: .img-responsive}

As you can see we have two forms here The first form is fetching all input systems and you can change them if you need. The second form(on the right) is designed for creating input system. As you can see, to create an input system you just need a name. After successfully creating of input system, the next step is the creation of email template. To accomplish that we need to go to respective menu on the left and press Email.

![Template](/assets/images/template.png "Template"){: .img-responsive}

In the first form you can delete or update your template. On the right form you can create your template. For this you need to map it to some input system. Keep in mind that you cannot create an email template without creating an input system. Therefore, all email templates are mapped to input system. By finding your input system in the first row you can proceed with creation. Second row asks you about the name for template, this is a mandatory field and cannot be left empty. Then Provider, as we mentioned before NoSy supports sending messages from 3 systems: gmail, yandex and default. If you choose gmail you have to provide your gmail account on the next step if you select gmail but provide something different the default settings will be used. The same happens with yandex provider, if you want to send email from the system you have to provide yandex email address otherwise the system will pick the Default. Then we have to provide Subject which is also mandatory field. In Email To section you can provide as many addresses as you want splitting them by comma. For example: xxx@xxx.com, yyy@yyy.com and so on. Email Cc is not mandatory but if you want to provide it you will have the same pattern as in Email To. And finally Nosy supports:

Dynamic variables: you can define the text dynamically while sending or you can have static text. For example: The following is an example of static text:

`Hi, My Name is AAA`

This will be saved and when you next call this template to send it. The email you will gate:

`Hi, My Name is AAA.`

But you can also define dynamic text for that NoSy uses placeholders. The example of such text is following

`Hi, My Name is #{name}#`

Here #{name}# is a dynamic variable and should be provided when the user actually wants to send an email. Bear in mind, that if you create a dynamic variable but do not provide it when sending the message, you will receive an error. You can also provide all the text while sending; for that you can create one dynamic variable:

`#{text}#`

Mentioned above is a valid Email Text, it means you will provide text when you will be sending an email. In one text you can use several environment variables. NoSy can send html emails too. So if you provide in text the field html message it will be sent as an html email. The last part in our menu is Manual Send Email. Here you can test your template by actually sending it. To send it you have to provide Input System and Email Template name as well as login details of your email if you didn't pick Default Provider. Nosy doesn't log any username and password; for this reason every time you send an email you have to provide them. And final note: if you have dynamic variables you have to specify the name and the value of these variables.

#### **1.3 E-mail Groups**

The back end supports creating e-mail groups instead of inputting the e-mail addresses one by one. The end points are described in the Swagger documentation. There are two end points for creating a group, one where you input Base64-encoded data of the addresses, and one which takes a list of actual e-mail addresses as argument. For updating the addresses you can either use the PUT-call end point to replace the addresses, or the PATCH-call to add new ones.
