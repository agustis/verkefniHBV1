# SpringBootMVC
Project skeleton for Software Project class in the University of Iceland.

## How do I get this ?
Your IDE ([IntelliJ](https://www.jetbrains.com/idea/), [Eclipse](https://eclipse.org/), [Spring Tool Suit](https://spring.io/tools)) should be able to clone a project from Github.
It should be easy to find information regarding how to do that for your chosen IDE.
It's also possible to download the project as a .zip [here](https://github.com/danielpall/SpringBootMVC/archive/master.zip).

## Before running
Changes need to be made regarding the PATH to directory /target/mediaFiles in the two classes below, to fit your placement of the folder on your system. <br>
src/main/java/project/StaticResourceConfiguration.java <br>
src/main/java/project/controller/UploadController.java

You also need to install [postgreSQL](http://www.postgresql.org/download/) then change the username and passowrd of the application.properties file to fit your system. <br>
src/main/resources/application.properties

You do need to run any SQL since we are using a postgreSQL.

## How do I run this ?
This project is setup using [Maven](https://maven.apache.org/what-is-maven.html) as a dependency manager, so if your IDE does not manage that, or you don't have it installed you can look [here](https://maven.apache.org/install.html) for further information.
When all the dependencies are downloaded, you can run the project by running the ``main()`` method in the class ``Application`` and then enter [localhost:8080](http://localhost:8080) into the address bar of your favorite web browser.

To run the project through IntelliJ go to Run > Edit Configurations... Then in the in the add new configuration you choose Maven.
Give the project a name, find the working directory (.../verkefniHBV1/SpringBootMVC), Command line is "package" and choose to resolve workplace artifacts.
When that is done you can package the project by pressing the Run button 

Next you go into the Terminal and write "cd SpringBootMVC/" > "mvn spring-boot:run"

Finally you open the browser and to see the [project](localhost:8080)
## What is going on ?
Look at the code and find the comments I wrote. I tried explaining what was happening in such a way that it should hopefully be easy to understand.

### What did you use to make this ?
I used IntelliJ Ultimate with Maven to setup this project. Students and Teachers get the Ultimate edition for free, apply [here](https://www.jetbrains.com/student/).

### Nothing is working! What can I do ?
My e-mail is in the course page. Shoot me an e-mail and we'll figure out the problem and solve it.

