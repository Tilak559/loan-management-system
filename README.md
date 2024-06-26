# loan management system

**Description**
The loan management database being developed aims to streamline the process of tracking loans, providing efficient data management and storage capabilities for  lenders. By centralizing loan information, the database will enable quick access to customer data, facilitating timely decision-making and effective customer service. Additionally, it will ensure the preservation of all financial statements related to loans, allowing lenders to easily retrieve and analyze past records. With this comprehensive database, loan management will become more organized and secure.


**ER diagram**
![Screenshot 2023-07-17 at 8 22 49 AM](https://github.com/Tilak559/loan-management-system/assets/38768214/b5a33bf5-b381-40df-8589-1bdd3ac654a1)


**Normalization**

1NF

![1nf](https://github.com/Tilak559/loan-management-system/assets/38768214/699ad79f-3dd3-4266-a41a-ad75ecb218ad)

![1 1nf](https://github.com/Tilak559/loan-management-system/assets/38768214/7c8ad68b-a5b2-475d-8e3c-7c33506edb05)



**Why Docker for MySQL?**

1.	Easy setup and portability: Docker allow you to encapsulate the MySQL database and its dependencies into a container, which provides a lightweight, isolated, and portable environment. With Docker, you can easily set up and distribute a consistent MySQL environment across different machines or environments.
2.	Reproducibility: Docker enables you to define the configuration and dependencies of the MySQL database using a Docker file or a Docker Compose file. This allows you to version control and share the configuration, ensuring that the same database environment can be replicated across different environments, such as development, staging, and production.
3.	Isolation and resource management: Docker containers provide process-level isolation, meaning that the MySQL database and its dependencies run in their own isolated environment without interfering with the host system or other containers. Additionally, Docker allows you to allocate specific CPU, memory, and disk resources to the MySQL container, ensuring efficient resource management.
4.	Scalability and flexibility: Docker make it easy to scale the MySQL database horizontally by spinning up multiple containers running the same database image. This allows you to distribute the database load across multiple instances and handle increased traffic or data demands. Docker also integrates well with orchestration tools like Kubernetes, allowing for further scalability and management capabilities.


Steps:

1. Visit the Docker Hub website and browse the available MySQL images, select the desired version.

https://hub.docker.com/_/mysql

2. Create a Dockerfile with the necessary information, including the filename of the SQL file to be executed (query.sql)

```
FROM mysql:8.0.33
ENV MYSQL_ROOT_PASSWORD=my-secret-pw
COPY ./query.sql /docker-entrypoint-initdb.d/
```

3. To build an image
```
docker build -t mysql .
```
4. Run the Docker image, and if you want it to run in the background, use the "-d" flag
```
docker run -d mysql
```

5. Check whether the container is running or not
```
docker container ps
```

6. Access container using docker (-it interactive mode)
```
docker exec -it container_id /bin/bash
```

7. Log in to the MySQL container using the password specified in the Dockerfile.
```
mysql -ppassword
```

8. To push docker image to hub
```
docker login
docker images
docker tag mysql:latest tilak5904/mysql
docker push tilak5904/mysql
```
    
