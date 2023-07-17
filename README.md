# loan-management-system

**Description**
The loan management database being developed aims to streamline the process of tracking loans, providing efficient data management and storage capabilities for  lenders. By centralizing loan information, the database will enable quick access to customer data, facilitating timely decision-making and effective customer service. Additionally, it will ensure the preservation of all financial statements related to loans, allowing lenders to easily retrieve and analyze past records. With this comprehensive database, loan management will become more organized and secure.

**Entities**
1.	Loan application
2.	Credit report
3.	Customer details
4.	Account details
5.	Loan details
6.	EMI details
7.	Payment information
8.	Loan history
9.	Lender details

**ER diagram**
![Screenshot 2023-07-17 at 8 22 49 AM](https://github.com/Tilak559/loan-management-system/assets/38768214/b5a33bf5-b381-40df-8589-1bdd3ac654a1)


**ER diagram into relational database schema**

Customer_details

Customer_id – int
Customer_name – varchar (20)
Customer_address – varchar (20)
Customer_phone_no – numeric (10)
App_id – int

Loan_details

Loan_id – int
App_id – int
Disbursal_date – date
Occupation – varchar (20)
Salaried – numeric (10,2)
Processing_fee – int
Loan_Detail_status – varchar (10)
Disbursal_year – int

Loan_application

App_id – int
Applied_loan_amount – numeric (10,2)
Approved_loan_amount – numeric (10,2)
App_status – varchar (10)
Applied_date – date
Applied_year – int
Employer_name - varchar (50)
SSN – int
Customer_id - int

Lender_details

Lender_id – int
Lender_name – varchar (10)
Loan_type – varchar (10)
Loan_id - int


Credit_report

SSN – int
Credit_score – int
Customer_id – int
Employer_name – varchar (20)

Account_details       

Account_number – numeric (20)
Bank_name – varchar (20)
Routing_no – numeric (10)
Customer_id – int

Loan_history

No_of_loans – int
Is_active – varchar (10)
Outstanding_amount – numeric (10,2)
Default – char
App_id – int

Emi_details

Emi_amount – numeric (10,2)
Principal_amount – numeric (10,2)
Interest – int
Emi_cycle – int
Tenure – int
N_emis_paid – int
N_emis_pending – int
Outsatnidng_amount – numeric (10,2)
Loan_id – int
Payment_id – int
Lender_id – int

Payment_info

Payment_id – int
Payment_date – date
Payment_amount – numeric (10,2)
Payment_type – varchar (10)
Loan_id – int

**Functional Dependency**

customer_id -> (customer_name, customer_address, customer_phone_no, app_id)
loan_id -> (app_id, disbursal_date, occupation, salaried, processing_fee, loan_details_status, disbursal_year)
app_id -> applied_loan_amount, approved_amount, app_status, applied_date, applied_year, employer_name, ssn, customer_id)
lender_id -> (lender_name, loan_type, loan_id)
ssn -> (credit_score, customer_id, employer_name)
account_no -> (bank_name, routing_no, customer_id)
payment_id -> (payment_date, payment_amount, payment_type, loan_id)

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
    
