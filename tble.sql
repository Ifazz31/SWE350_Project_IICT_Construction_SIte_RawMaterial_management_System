CREATE TABLE tbl_user(
    ex_id int NOT NULL Auto Increment,
	ex_name varchar(20),
    ex_contactNO int,
	ex_email varchar(50),
	ex_password varchar(250)
	role_id int,
	
	status varchar(30),
    
    PRIMARY KEY(ex_id),
	foreign key (role_id) references roles(role_id),
	unique(ex_email)
    );
insert into tbl_user(name,contactNo,email,password,status,role) values('Admin','123456778','admin@gmail.com','admin','true','admin');

CREATE TABLE items (id varchar(20) PRIMARY KEY,item_name VARCHAR(100) NOT NULL,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

CREATE TABLE requisitions (id varchar(20) PRIMARY KEY,creator_id INT NOT NULL , item_id varchar(20) NOT NULL,quantity INT,purpose VARCHAR(255) NOT NULL,project_name VARCHAR(100) NOT NULL,location VARCHAR(100) NOT NULL,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,FOREIGN KEY (item_id) REFERENCES items(id) , FOREIGN KEY (creator_id) REFERENCES tbl_user(ex_id));

CREATE TABLE tender (id varchar(20) PRIMARY KEY, requisition_id varchar(20) NOT NULL, creator_id INT NOT NULL, deadline date NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, FOREIGN KEY (requisition_id) REFERENCES requisitions(id), FOREIGN KEY (creator_id) REFERENCES tbl_user(ex_id));
