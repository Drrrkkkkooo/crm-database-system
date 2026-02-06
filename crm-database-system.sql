DROP DATABASE IF EXISTS edvana; 
CREATE DATABASE Edvana; 

USE Edvana; 

CREATE TABLE Clients(
	ClientID INT PRIMARY KEY, 
    ClientName VARCHAR(255) NOT NULL, 
    ClientCountry VARCHAR(60) NOT NULL, 
    ClientAddress VARCHAR(255) NOT NULL
); 

CREATE TABLE Contacts(
	ContactID INT PRIMARY KEY, 
    ClientID INT NOT NULL,
	Name VARCHAR(255) NOT NULL, 
    Phone VARCHAR(20) NULL, 
    Email VARCHAR(255) NOT NULL,
    
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

CREATE TABLE Employees(
	EmployeeID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL, 
    Role VARCHAR(255) NOT NULL
);

CREATE TABLE Opportunities(
	OpportunityID INT PRIMARY KEY, 
    ClientID INT NOT NULL, 
    OpportunityName VARCHAR(255),
    DateCreated DATE NOT NULL,
    EstimatedRevenue VARCHAR(255) NOT NULL,
    
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

CREATE TABLE Notes(
	NoteID INT PRIMARY KEY,
	NoteTitle VARCHAR(255) NOT NULL, 
    OpportunityID INT NOT NULL,
	Content TEXT NULL, 
    DateCreated DATE NOT NULL, 
    EmployeeID INT NOT NULL,
    
    FOREIGN KEY (OpportunityID) REFERENCES Opportunities(OpportunityID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Steps(
	StepID INT PRIMARY KEY, 
    OpportunityID INT NOT NULL, 
    Name VARCHAR(255) NOT NULL, 
    Description TEXT NULL,
    EmployeeAssigned INT NOT NULL,
    AssignedDate DATE NULL, 
    CompletedOn DATE NULL,
    
    FOREIGN KEY (OpportunityID) REFERENCES Opportunities(OpportunityID),
    FOREIGN KEY (EmployeeAssigned) REFERENCES Employees(EmployeeID)
);

INSERT INTO Clients (ClientID, ClientName, ClientCountry, ClientAddress) VALUES
(1, 'Walgreens', 'United States', '200 Wilmot Road Deerfield'); 

INSERT INTO Opportunities (OpportunityID, ClientID, OpportunityName, DateCreated, EstimatedRevenue) VALUES
(1, 1, 'Appointment Tracking App for Walgreens', '22-10-19', '5 million');

INSERT INTO Employees (EmployeeID, Name, Role) VALUES
(1, 'Si Wang-mu', 'Manager'), 
(2, 'Annabeth Chase', 'Sales Representative'), 
(3, 'David Martinez', 'Sales Representative'), 
(4, 'Duncan Idaho', 'Sales Representative'); 

INSERT INTO Contacts (ContactID, ClientID, Name, Phone, Email) VALUES
(1, 1, 'Jessica Whitwell', '(111) 222-3333', 'jessica@walgreens.com'), 
(2, 1, 'Amity Blight', '(222) 333-4444', 'amity@walgreens.com'); 

INSERT INTO Notes (NoteID, NoteTitle, Content, DateCreated, EmployeeID, OpportunityID) VALUES
(1, 
'Working Notes: Walgreens', 
'Walgreens needs new software to help customers sign up for and manage appointments
 at their pharmacy. I spoke to Mrs. Blight last week to confirm the project was viable. Our margins for the
 cost estimation are good and we’ve created the statement of work. We need to get the statement reviewed by 
 management before sending it over to the client.', 
 '22-10-19',
 '2', 
 '1'); 
 
 INSERT INTO Steps (StepID, OpportunityID, Name, Description, EmployeeAssigned, AssignedDate, CompletedOn) VALUES
 (1, 1, 'Step 1 - Confirm Opportunity', 'Follow up with the client to confirm the opportunity', 2, '22-10-19', '22-10-21'), 
 (2, 1, 'Step 2 - Create Cost Estimation', 'Estimate the cost of completing the project and identify profit margins', 2, '22-10-21', '22-10-23'), 
 (3, 1, 'Step 3 - Create Statement of Work', 'Create Statement fo Work that outlines everything that will need to go into the project', 3, '22-10-23', '22-10-24'), 
 (4, 1, 'Step 4 - Review Statement of Work', 'Review statement of work with management', 2, '22-10-24', NULL),
 (5, 1, 'Step 5 - Get Signatures', 'Get sign off from client', 1, NULL, NULL); 
 
 /* Uses 10's system. 1st opportunity will occupy 1-9, 2nd will occupy ID's 10-19, etc. */ 
 
SELECT * FROM Steps;
