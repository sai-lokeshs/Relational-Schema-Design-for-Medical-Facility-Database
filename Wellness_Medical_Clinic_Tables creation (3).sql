CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Staff_Type VARCHAR2(100),
    Name VARCHAR2(100),
    Specialization VARCHAR2(100),
    Type_of_Staff VARCHAR2(100)
);

-- Table for Patient Details
CREATE TABLE Patient_Details (
    Patient_ID INT PRIMARY KEY,
    Contact_Details VARCHAR2(100),
    Medical_History VARCHAR2(100),
    Guardian_Name VARCHAR2(100),
    Insurance_Details VARCHAR2(100)
);

-- Table for Appointment
CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    CONSTRAINT fk_patient_id_appt FOREIGN KEY (Patient_ID) REFERENCES Patient_Details(Patient_ID)
);


-- Table for Coverage Schedule
CREATE TABLE Coverage_Schedule (
    Schedule_ID INT PRIMARY KEY,
    Schedule_Time TIMESTAMP,
    Staff_ID INT,
    CONSTRAINT fk_staff_id_cov_sched FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- Table for Patient Monthly Details
CREATE TABLE Patient_Monthly_Details (
    Statement_ID INT PRIMARY KEY,
    Patient_ID INT,
    Balance DECIMAL(10, 2),
    Payments_Received DECIMAL(10, 2),
    CONSTRAINT fk_patient_id_monthly FOREIGN KEY (Patient_ID) REFERENCES Patient_Details(Patient_ID)
);

-- Table for Daily Laboratory Log
CREATE TABLE Daily_Laboratory_Log (
    ID INT PRIMARY KEY,
    Log_Date DATE,
    Records VARCHAR2(100)
);

-- Table for Master Schedule
CREATE TABLE Master_Schedule (
    Practitioner_ID INT PRIMARY KEY,
    Patient_ID INT,
    Visit_Date DATE,
    CONSTRAINT fk_patient_id_master_sched FOREIGN KEY (Patient_ID) REFERENCES Patient_Details(Patient_ID)
);

-- Table for Walk-ins
CREATE TABLE Walk_ins (
    Insurance_Provider VARCHAR2(100),
    Insurance_ID INT PRIMARY KEY,
    Visit_ID INT,
    Type_of_Visit VARCHAR2(100),
    CONSTRAINT fk_visit_id_walk_ins FOREIGN KEY (Visit_ID) REFERENCES Master_Schedule(Practitioner_ID)
);

-- Table for Operating Log
CREATE TABLE Operating_Log (
    Log_ID INT PRIMARY KEY,
    Log_Date DATE,
    Surgery_Details VARCHAR2(100)
);

-- Table for Operating Room Schedule
CREATE TABLE Operating_Room_Schedule (
    Schedule_ID INT PRIMARY KEY,
    Schedule_Date DATE,
    Surgery_Info VARCHAR2(100)
);

-- Table for Delivery Log
CREATE TABLE Delivery_Log (
    Log_ID INT PRIMARY KEY,
    Delivery_Information VARCHAR2(100),
    Delivery_Date DATE
);

-- Table for Recovery Room Log
CREATE TABLE Recovery_Room_Log (
    Log_ID INT PRIMARY KEY,
    Recovery_Details VARCHAR2(100),
    Recovery_Date DATE
);

-- Table for Monthly Activity Log
CREATE TABLE Monthly_Activity_Log (
    Report_ID INT PRIMARY KEY,
    Month_Year VARCHAR2(50),
    Activity_Centric_Details VARCHAR2(100)
);

-- Table for Facility
CREATE TABLE Facility (
    Facility_ID INT PRIMARY KEY,
    Type_of_Facility VARCHAR2(100)
);

-- Table for Prescription
CREATE TABLE Prescription (
    Rx_Number INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_Name VARCHAR2(100),
    Total_Price DECIMAL(10, 2),
    Balance_Due DECIMAL(10, 2),
    CONSTRAINT fk_patient_id_prescription FOREIGN KEY (Patient_ID) REFERENCES Patient_Details(Patient_ID)
);

-- Table for Payments
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Payment_Date DATE,
    Amount DECIMAL(10, 2),
    Payment_Method VARCHAR2(50),
    CONSTRAINT fk_patient_id_payments FOREIGN KEY (Patient_ID) REFERENCES Patient_Details(Patient_ID)
);

