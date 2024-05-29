-- Creation Tables 

---Create Insurance Company table
CREATE TABLE InsuranceCompany (
    InsuranceID INTEGER PRIMARY KEY,
    InsuranceName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100)
);
select * from InsuranceCompany;
-- Create Government table
CREATE TABLE Government (
    GovernmentID INTEGER PRIMARY KEY,
    GovernmentName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100)
);
select * from Government;

-- Create Patient table
CREATE TABLE Patient (
    PatientID INTEGER PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender CHAR(1) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    InsuranceID INTEGER,
    GovernmentID INTEGER,
    FOREIGN KEY (InsuranceID) REFERENCES InsuranceCompany(InsuranceID),
    FOREIGN KEY (GovernmentID) REFERENCES Government(GovernmentID)
);
select * from Patient;


-- Create Practitioner table
CREATE TABLE Practitioner (
    PractitionerID INTEGER PRIMARY KEY,
    PractitionerType VARCHAR(255) NOT NULL,
    PractitionerName VARCHAR(255) NOT NULL
);
select * from Practitioner;
-- Create Administrator table
CREATE TABLE Administrator (
    AdminID INTEGER PRIMARY KEY,
    AdminDetails VARCHAR(255) NOT NULL
);
select * from Administrator;

-- Create Receptionist table
CREATE TABLE Receptionist (
    ReceptionistID INTEGER PRIMARY KEY,
    ReceptionistDetails VARCHAR(255) NOT NULL
);
select * from Receptionist;

-- Create Bookkeeper table
CREATE TABLE Bookkeeper (
    BookkeeperID INTEGER PRIMARY KEY,
    BookkeeperDetails VARCHAR(255) NOT NULL
);
select * from Bookkeeper;

-- Create Medical Technician table
CREATE TABLE MedicalTechnician (
    TechnicianID INTEGER PRIMARY KEY,
    TechnicianDetails VARCHAR(255) NOT NULL
);
select * from MedicalTechnician;


-- Create Pharmacist table
CREATE TABLE Pharmacist (
    PharmacistID INTEGER PRIMARY KEY,
    PharmacistDetails VARCHAR(255) NOT NULL
);
select * from Pharmacist;

-- Create Medical Record table
CREATE TABLE MedicalRecord (
    RecordID INTEGER PRIMARY KEY,
    PatientID INTEGER NOT NULL,
    Details VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
select * from MedicalRecord;


-- Create Appointment table
CREATE TABLE Appointment (
    AppointmentID INTEGER PRIMARY KEY,
    PatientID INTEGER NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIMESTAMP NOT NULL,
    PractitionerID INTEGER,
    Details VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (PractitionerID) REFERENCES Practitioner(PractitionerID)
);
select * from Appointment;
-- Create Visit table
CREATE TABLE Visit (
    VisitID INTEGER PRIMARY KEY,
    PatientID INTEGER NOT NULL,
    VisitDate DATE NOT NULL,
    VisitTime TIMESTAMP NOT NULL,
    PractitionerID INTEGER,
    Details VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (PractitionerID) REFERENCES Practitioner(PractitionerID)
);
select * from Visit;

-- Create Prescription table
CREATE TABLE Prescription (
    PrescriptionID INTEGER PRIMARY KEY,
    VisitID INTEGER NOT NULL,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    Quantity INTEGER NOT NULL,
    Instructions VARCHAR(255),
    FOREIGN KEY (VisitID) REFERENCES Visit(VisitID)
);
select * from Prescription;

-- Create Laboratory Test table
CREATE TABLE LaboratoryTest (
    LabTestID INTEGER PRIMARY KEY,
    VisitID INTEGER NOT NULL,
    TestName VARCHAR(100) NOT NULL,
    Result VARCHAR(255),
    FOREIGN KEY (VisitID) REFERENCES Visit(VisitID)
);
select * from LaboratoryTest;

-- Create Surgery table
CREATE TABLE Surgery (
    SurgeryID INTEGER PRIMARY KEY,
    SurgeryDate DATE NOT NULL,
    PatientID INTEGER NOT NULL,
    PractitionerID INTEGER,
    Details VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (PractitionerID) REFERENCES Practitioner(PractitionerID)
);
select * from Surgery;

-- Create Delivery table
CREATE TABLE Delivery (
    DeliveryID INTEGER PRIMARY KEY,
    DeliveryDate DATE NOT NULL,
    PatientID INTEGER NOT NULL,
    PractitionerID INTEGER,
    Details VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (PractitionerID) REFERENCES Practitioner(PractitionerID)
);
select * from Delivery;

-- Create Recovery Room table
CREATE TABLE RecoveryRoom (
    RoomID INTEGER PRIMARY KEY,
    PatientID INTEGER NOT NULL,
    AdmissionDate DATE NOT NULL,
    DischargeDate DATE,
    PractitionerID INTEGER,
    Details VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (PractitionerID) REFERENCES Practitioner(PractitionerID)
);
select * from RecoveryRoom;
-- Create Billing table
CREATE TABLE Billing (
    BillingID INTEGER PRIMARY KEY,
    VisitID INTEGER NOT NULL,
    PatientID INTEGER NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (VisitID) REFERENCES Visit(VisitID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);
select * from Billing;


---- Insert Values

--------Data Population script

-- Inserting data into the InsuranceCompany table
INSERT INTO InsuranceCompany (InsuranceID, InsuranceName, Address, PhoneNumber, Email)
VALUES(1, 'ABC Insurance', '123 Insurance St', '555-1234', 'info@abcinsurance.com');

INSERT INTO InsuranceCompany (InsuranceID, InsuranceName, Address, PhoneNumber, Email)
VALUES(2, 'XYZ Insurance', '456 Insurance St', '555-5678', 'info@xyzinsurance.com');

INSERT INTO InsuranceCompany (InsuranceID, InsuranceName, Address, PhoneNumber, Email)
VALUES(3, '123 Insurance', '789 Insurance St', '555-9012', 'info@123insurance.com');

INSERT INTO InsuranceCompany (InsuranceID, InsuranceName, Address, PhoneNumber, Email)
VALUES(4, '456 Insurance', '101 Insurance St', '555-3456', 'info@456insurance.com');

INSERT INTO InsuranceCompany (InsuranceID, InsuranceName, Address, PhoneNumber, Email)
VALUES(5, '789 Insurance', '321 Insurance St', '555-7890', 'info@789insurance.com');
commit;

select * from InsuranceCompany;

-- Inserting data into the Government table
INSERT INTO Government (GovernmentID, GovernmentName, Address, PhoneNumber, Email)
VALUES
    (1, 'Federal Health Department', '123 Government Ave', '555-1234', 'info@healthdept.gov');

INSERT INTO Government (GovernmentID, GovernmentName, Address, PhoneNumber, Email)
VALUES
    (2, 'State Health Department', '456 Government Ave', '555-5678', 'info@statehealthdept.gov');

INSERT INTO Government (GovernmentID, GovernmentName, Address, PhoneNumber, Email)
VALUES
    (3, 'Local Health Department', '789 Government Ave', '555-9012', 'info@localhealthdept.gov');

INSERT INTO Government (GovernmentID, GovernmentName, Address, PhoneNumber, Email)
VALUES
    (4, 'National Insurance Agency', '101 Government Ave', '555-3456', 'info@insuranceagency.gov');

INSERT INTO Government (GovernmentID, GovernmentName, Address, PhoneNumber, Email)
VALUES
    (5, 'Healthcare Regulation Commission', '321 Government Ave', '555-7890', 'info@healthcareregulation.gov');
commit;
select * from Government;



-- Inserting data into the Patient table
INSERT INTO Patient (PatientID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber, Email, InsuranceID, GovernmentID)
VALUES
    (1, 'John', 'Doe', 'M', TO_DATE('1980-05-15', 'YYYY-MM-DD'), '123 Main St', '555-1234', 'john.doe@example.com', 1, NULL);

INSERT INTO Patient (PatientID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber, Email, InsuranceID, GovernmentID)
VALUES
    (2, 'Jane', 'Smith', 'F', TO_DATE('1975-09-20', 'YYYY-MM-DD'), '456 Elm St', '555-5678', 'jane.smith@example.com', NULL, 2);

INSERT INTO Patient (PatientID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber, Email, InsuranceID, GovernmentID)
VALUES
    (3, 'Michael', 'Johnson', 'M', TO_DATE('1992-12-10', 'YYYY-MM-DD'), '789 Oak St', '555-9012', 'michael.johnson@example.com', 2, NULL);

INSERT INTO Patient (PatientID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber, Email, InsuranceID, GovernmentID)
VALUES
    (4, 'Emily', 'Williams', 'F', TO_DATE('1988-07-08', 'YYYY-MM-DD'), '101 Pine St', '555-3456', 'emily.williams@example.com', 3, NULL);

INSERT INTO Patient (PatientID, FirstName, LastName, Gender, DateOfBirth, Address, PhoneNumber, Email, InsuranceID, GovernmentID)
VALUES
    (5, 'David', 'Brown', 'M', TO_DATE('1970-03-25', 'YYYY-MM-DD'), '321 Cedar St', '555-7890', 'david.brown@example.com', NULL, 1);
commit;
select * from Patient;

-- Inserting data into the Practitioner table
INSERT INTO Practitioner (PractitionerID, PractitionerType, PractitionerName)
VALUES
    (1, 'Physician', 'Dr. Smith');

INSERT INTO Practitioner (PractitionerID, PractitionerType, PractitionerName)
VALUES
    (2, 'Nurse Practitioner', 'Nurse Practitioner Johnson');

INSERT INTO Practitioner (PractitionerID, PractitionerType, PractitionerName)
VALUES
    (3, 'Registered Nurse', 'Nurse Davis');

INSERT INTO Practitioner (PractitionerID, PractitionerType, PractitionerName)
VALUES
    (4, 'Midwife', 'Midwife Roberts');

INSERT INTO Practitioner (PractitionerID, PractitionerType, PractitionerName)
VALUES
    (5, 'Surgeon', 'Dr. Lee');
commit;
select * from Practitioner;

-- Inserting data into the Administrator table
INSERT INTO Administrator (AdminID, AdminDetails)
VALUES
    (1, 'Responsible for managing administrative tasks.');

INSERT INTO Administrator (AdminID, AdminDetails)
VALUES
    (2, 'Oversees clinic operations and staff management.');

INSERT INTO Administrator (AdminID, AdminDetails)
VALUES
    (3, 'Handles scheduling and coordination.');

INSERT INTO Administrator (AdminID, AdminDetails)
VALUES
    (4, 'Manages office supplies and equipment maintenance.');

INSERT INTO Administrator (AdminID, AdminDetails)
VALUES
    (5, 'Coordinates meetings and events.');
commit;
select * from Administrator;


-- Inserting data into the Receptionist table
INSERT INTO Receptionist (ReceptionistID, ReceptionistDetails)
VALUES
    (1, 'Greets patients and manages front desk operations.');

INSERT INTO Receptionist (ReceptionistID, ReceptionistDetails)
VALUES
    (2, 'Schedules appointments and handles patient inquiries.');

INSERT INTO Receptionist (ReceptionistID, ReceptionistDetails)
VALUES
    (3, 'Assists with patient intake and manages phone calls.');

INSERT INTO Receptionist (ReceptionistID, ReceptionistDetails)
VALUES
    (4, 'Manages patient records and updates information.');

INSERT INTO Receptionist (ReceptionistID, ReceptionistDetails)
VALUES
    (5, 'Handles billing inquiries and insurance verification.');
commit;
select * from Receptionist;

-- Inserting data into the Bookkeeper table
INSERT INTO Bookkeeper (BookkeeperID, BookkeeperDetails)
VALUES
    (1, 'Manages billing and financial records.');

INSERT INTO Bookkeeper (BookkeeperID, BookkeeperDetails)
VALUES
    (2, 'Processes payments and maintains financial reports.');

INSERT INTO Bookkeeper (BookkeeperID, BookkeeperDetails)
VALUES
    (3, 'Handles accounts receivable and payable.');

INSERT INTO Bookkeeper (BookkeeperID, BookkeeperDetails)
VALUES
    (4, 'Prepares financial statements and budget reports.');

INSERT INTO Bookkeeper (BookkeeperID, BookkeeperDetails)
VALUES
    (5, 'Coordinates with insurance companies for claims processing.');
commit; 
select * from Bookkeeper;

-- Inserting data into the MedicalTechnician table
INSERT INTO MedicalTechnician (TechnicianID, TechnicianDetails)
VALUES
    (1, 'Performs laboratory tests and manages lab equipment.');

INSERT INTO MedicalTechnician (TechnicianID, TechnicianDetails)
VALUES
    (2, 'Prepares samples for testing and assists with diagnostics.');

INSERT INTO MedicalTechnician (TechnicianID, TechnicianDetails)
VALUES
    (3, 'Ensures proper handling and processing of medical samples.');

INSERT INTO MedicalTechnician (TechnicianID, TechnicianDetails)
VALUES
    (4, 'Performs sterilization of medical instruments and equipment.');

INSERT INTO MedicalTechnician (TechnicianID, TechnicianDetails)
VALUES
    (5, 'Assists with medical procedures and patient care.');
commit;
select * from MedicalTechnician;

-- Inserting data into the Pharmacist table
INSERT INTO Pharmacist (PharmacistID, PharmacistDetails)
VALUES
    (1, 'Dispenses medications and provides pharmaceutical advice.');

INSERT INTO Pharmacist (PharmacistID, PharmacistDetails)
VALUES
    (2, 'Manages pharmacy inventory and ensures proper storage.');

INSERT INTO Pharmacist (PharmacistID, PharmacistDetails)
VALUES
    (3, 'Counsels patients on medication use and side effects.');

INSERT INTO Pharmacist (PharmacistID, PharmacistDetails)
VALUES
    (4, 'Processes prescriptions and verifies insurance coverage.');

INSERT INTO Pharmacist (PharmacistID, PharmacistDetails)
VALUES
    (5, 'Collaborates with healthcare providers on patient care.');
commit;
select * from Pharmacist;

-- nserting data into the MedicalRecord table
INSERT INTO MedicalRecord (RecordID, PatientID, Details)
VALUES(1, 1, 'Patient history and current medications.');

INSERT INTO MedicalRecord (RecordID, PatientID, Details)
VALUES
    (2, 2, 'Allergies and past medical procedures.');

INSERT INTO MedicalRecord (RecordID, PatientID, Details)
VALUES
    (3, 3, 'Recent diagnoses and treatment plans.');

INSERT INTO MedicalRecord (RecordID, PatientID, Details)
VALUES
    (4, 4, 'Family medical history and immunization records.');

INSERT INTO MedicalRecord (RecordID, PatientID, Details)
VALUES
    (5, 5, 'Recent surgeries and follow-up care.');
commit;
select * from MedicalRecord;

-- Inserting data into the Appointment table
INSERT INTO Appointment (AppointmentID, PatientID, AppointmentDate, AppointmentTime, PractitionerID, Details)
VALUES
    (1, 1, TO_DATE('2024-01-20', 'YYYY-MM-DD'), TO_TIMESTAMP('09:00:00', 'HH24:MI:SS'), 1, 'Annual check-up');

INSERT INTO Appointment (AppointmentID, PatientID, AppointmentDate, AppointmentTime, PractitionerID, Details)
VALUES
    (2, 2, TO_DATE('2024-02-21', 'YYYY-MM-DD'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), 2, 'Follow-up appointment');

INSERT INTO Appointment (AppointmentID, PatientID, AppointmentDate, AppointmentTime, PractitionerID, Details)
VALUES
    (3, 3, TO_DATE('2024-02-22', 'YYYY-MM-DD'), TO_TIMESTAMP('11:15:00', 'HH24:MI:SS'), 3, 'Consultation for new symptoms');

INSERT INTO Appointment (AppointmentID, PatientID, AppointmentDate, AppointmentTime, PractitionerID, Details)
VALUES
    (4, 4, TO_DATE('2024-02-23', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), 4, 'Prenatal visit');

INSERT INTO Appointment (AppointmentID, PatientID, AppointmentDate, AppointmentTime, PractitionerID, Details)
VALUES
    (5, 5, TO_DATE('2024-02-24', 'YYYY-MM-DD'), TO_TIMESTAMP('15:45:00', 'HH24:MI:SS'), 5, 'Post-surgery check-up');
commit;
select * from Appointment;

-- Inserting data into the Visit table
INSERT INTO Visit (VisitID, PatientID, VisitDate, VisitTime, PractitionerID, Details)
VALUES
    (1, 1, TO_DATE('2024-02-20', 'YYYY-MM-DD'), TO_TIMESTAMP('09:00:00', 'HH24:MI:SS'), 1, 'Routine check-up');

INSERT INTO Visit (VisitID, PatientID, VisitDate, VisitTime, PractitionerID, Details)
VALUES
    (2, 2, TO_DATE('2024-02-21', 'YYYY-MM-DD'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), 2, 'Blood pressure monitoring');

INSERT INTO Visit (VisitID, PatientID, VisitDate, VisitTime, PractitionerID, Details)
VALUES
    (3, 3, TO_DATE('2024-02-22', 'YYYY-MM-DD'), TO_TIMESTAMP('11:15:00', 'HH24:MI:SS'), 3, 'X-ray examination');

INSERT INTO Visit (VisitID, PatientID, VisitDate, VisitTime, PractitionerID, Details)
VALUES
    (4, 4, TO_DATE('2024-02-23', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), 4, 'Fetal heartbeat monitoring');

INSERT INTO Visit (VisitID, PatientID, VisitDate, VisitTime, PractitionerID, Details)
VALUES
    (5, 5, TO_DATE('2024-02-24', 'YYYY-MM-DD'), TO_TIMESTAMP('15:45:00', 'HH24:MI:SS'), 5, 'Wound inspection');
commit;
select * from Visit;


-- Inserting data into the Prescription table
INSERT INTO Prescription (PrescriptionID, VisitID, MedicationName, Dosage, Quantity, Instructions)
VALUES
    (1, 1, 'Aspirin', '100mg', 30, 'Take one tablet daily with food');

INSERT INTO Prescription (PrescriptionID, VisitID, MedicationName, Dosage, Quantity, Instructions)
VALUES
    (2, 2, 'Lisinopril', '10mg', 60, 'Take one tablet in the morning');

INSERT INTO Prescription (PrescriptionID, VisitID, MedicationName, Dosage, Quantity, Instructions)
VALUES
    (3, 3, 'Amoxicillin', '500mg', 20, 'Take one capsule three times a day');

INSERT INTO Prescription (PrescriptionID, VisitID, MedicationName, Dosage, Quantity, Instructions)
VALUES
    (4, 4, 'Prenatal vitamins', '1 tablet', 90, 'Take one tablet daily');

INSERT INTO Prescription (PrescriptionID, VisitID, MedicationName, Dosage, Quantity, Instructions)
VALUES
    (5, 5, 'Oxycodone', '5mg', 15, 'Take one tablet as needed for pain');
commit;
select * from Prescription;

-- Inserting data into the LaboratoryTest table
INSERT INTO LaboratoryTest (LabTestID, VisitID, TestName, Result)
VALUES
    (1, 1, 'Blood sugar', 'Normal');

INSERT INTO LaboratoryTest (LabTestID, VisitID, TestName, Result)
VALUES
    (2, 2, 'Cholesterol', 'High');

INSERT INTO LaboratoryTest (LabTestID, VisitID, TestName, Result)
VALUES
    (3, 3, 'X-ray', 'Clear');

INSERT INTO LaboratoryTest (LabTestID, VisitID, TestName, Result)
VALUES
    (4, 4, 'Fetal ultrasound', 'Normal');

INSERT INTO LaboratoryTest (LabTestID, VisitID, TestName, Result)
VALUES
    (5, 5, 'Wound culture', 'Negative');
commit;
select * from LaboratoryTest;


-- Inserting data into the Surgery table
INSERT INTO Surgery (SurgeryID, SurgeryDate, PatientID, PractitionerID, Details)
VALUES
    (1, TO_DATE('2024-02-25', 'YYYY-MM-DD'), 1, 5, 'Appendectomy');

INSERT INTO Surgery (SurgeryID, SurgeryDate, PatientID, PractitionerID, Details)
VALUES
    (2, TO_DATE('2024-02-26', 'YYYY-MM-DD'), 2, 5, 'Knee replacement');

INSERT INTO Surgery (SurgeryID, SurgeryDate, PatientID, PractitionerID, Details)
VALUES
    (3, TO_DATE('2024-02-27', 'YYYY-MM-DD'), 3, 5, 'Gallbladder removal');

INSERT INTO Surgery (SurgeryID, SurgeryDate, PatientID, PractitionerID, Details)
VALUES
    (4, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 4, 5, 'C-section');

INSERT INTO Surgery (SurgeryID, SurgeryDate, PatientID, PractitionerID, Details)
VALUES
    (5, TO_DATE('2024-02-29', 'YYYY-MM-DD'), 5, 5, 'Gastric bypass');
commit;
select * from Surgery;

-- Inserting data into the Delivery table
INSERT INTO Delivery (DeliveryID, DeliveryDate, PatientID, PractitionerID, Details)
VALUES
    (1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 1, 5, 'Healthy baby boy delivered');

INSERT INTO Delivery (DeliveryID, DeliveryDate, PatientID, PractitionerID, Details)
VALUES
    (2, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 2, 5, 'Successful delivery of healthy baby girl');

INSERT INTO Delivery (DeliveryID, DeliveryDate, PatientID, PractitionerID, Details)
VALUES
    (3, TO_DATE('2024-03-03', 'YYYY-MM-DD'), 3, 5, 'Baby boy born via C-section');

INSERT INTO Delivery (DeliveryID, DeliveryDate, PatientID, PractitionerID, Details)
VALUES
    (4, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 4, 5, 'C-section delivery of healthy baby girl');

INSERT INTO Delivery (DeliveryID, DeliveryDate, PatientID, PractitionerID, Details)
VALUES
    (5, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 5, 5, 'Successful gastric bypass surgery');
Commit;
Select * from Delivery;


-- Inserting data into the RecoveryRoom table
INSERT INTO RecoveryRoom (RoomID, PatientID, AdmissionDate, DischargeDate, PractitionerID, Details)
VALUES
    (1, 1, TO_DATE('2024-03-02', 'YYYY-MM-DD'), TO_DATE('2024-03-03', 'YYYY-MM-DD'), 3, 'Monitored post-surgery recovery');

INSERT INTO RecoveryRoom (RoomID, PatientID, AdmissionDate, DischargeDate, PractitionerID, Details)
VALUES
    (2, 2, TO_DATE('2024-03-03', 'YYYY-MM-DD'), TO_DATE('2024-03-04', 'YYYY-MM-DD'), 3, 'Recovery from knee replacement surgery');

INSERT INTO RecoveryRoom (RoomID, PatientID, AdmissionDate, DischargeDate, PractitionerID, Details)
VALUES
    (3, 3, TO_DATE('2024-03-04', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'), 3, 'Recovery following gallbladder removal');

INSERT INTO RecoveryRoom (RoomID, PatientID, AdmissionDate, DischargeDate, PractitionerID, Details)
VALUES
    (4, 4, TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-06', 'YYYY-MM-DD'), 3, 'Post-operative care after C-section');

INSERT INTO RecoveryRoom (RoomID, PatientID, AdmissionDate, DischargeDate, PractitionerID, Details)
VALUES
    (5, 5, TO_DATE('2024-03-06', 'YYYY-MM-DD'), TO_DATE('2024-03-07', 'YYYY-MM-DD'), 3, 'Recovery from gastric bypass surgery');
commit;
select * from RecoveryRoom;
    
-- Inserting data into the Billing table
INSERT INTO Billing (BillingID, VisitID, PatientID, Amount, PaymentStatus)
VALUES
    (1, 1, 1, 150.00, 'Paid');

INSERT INTO Billing (BillingID, VisitID, PatientID, Amount, PaymentStatus)
VALUES
    (2, 2, 2, 200.00, 'Pending');

INSERT INTO Billing (BillingID, VisitID, PatientID, Amount, PaymentStatus)
VALUES
    (3, 3, 3, 300.00, 'Paid');

INSERT INTO Billing (BillingID, VisitID, PatientID, Amount, PaymentStatus)
VALUES
    (4, 4, 4, 400.00, 'Pending');

INSERT INTO Billing (BillingID, VisitID, PatientID, Amount, PaymentStatus)
VALUES
    (5, 5, 5, 500.00, 'Paid');

commit;

select * from Billing;




