drop table if exists room;
drop table if exists treatmentsAdministered;
drop table if exists volunteers;
drop table if exists patients;
drop table if exists treatments;
drop table if exists employees;
drop table if exists diagnosis;


create table volunteers(
vid int not null auto_increment,
firstName varchar (30) not null,
lastName varchar (30) not null,
service ENUM ('Gift Shop','Information Desk','Snack Carts','Reading Carts') not null,
sunday tinyint not null default 0,
monday tinyint not null default 0,
tuesday tinyint not null default 0,
wednesday tinyint not null default 0,
thursday tinyint not null default 0,
friday tinyint not null default 0,
sat tinyint not null default 0,
primary key (vid)
);

create table employees(
eid int not null auto_increment,
medicalType ENUM ('Nurse','Technician','Staff','Administrator','Doctor') not null,
firstName varchar (30) not null,
lastName varchar (30) not null,
ssn int not null,
address varchar (50) not null,
city varchar (50) not null,
state varchar (2) not null,
zip int (5) not null,
phone varchar (30),
dob date not null,
email varchar (50),
DoctorConsultingRights tinyint not null default 0,
DoctorAdmitRights tinyint not null default 0,
staffNonMedicalWorkArea varchar (30),
primary key (eid)
);



create table treatments(
tid int not null auto_increment,
name varchar (30) not null,
description varchar (50),
treatmentType ENUM ('Procedure','Medication') not null,
primary key (tid)
);

create table diagnosis(
did int not null auto_increment,
diagnosisCode varchar (50) not null,
diagnosisName varchar (80) not null,
totalOccurrences int,
primary key (did)
);


create table patients(
pid int not null auto_increment,
admittingDoctor int,
did int,
firstName varchar (30) not null,
lastName varchar (30) not null,
ssn int not null,
address varchar (50) not null,
city varchar (50) not null,
state varchar (2) not null,
zip int (5) not null,
phone varchar (30),
dob date not null,
email varchar (50),
emergencyContect varchar(50),
insuranceGroupNumber bigint,
extraDoctor1 int,
extraDoctor2 int,
extraDoctor3 int,
extraDoctor4 int,
extraDoctor5 int,
foreign key (did) references diagnosis(did),
foreign key (extraDoctor1) references employees(eid),
foreign key (extraDoctor2) references employees(eid),
foreign key (extraDoctor3) references employees(eid),
foreign key (extraDoctor4) references employees(eid),
foreign key (extraDoctor5) references employees(eid),
foreign key (admittingDoctor) references employees(eid),
primary key (pid)
);

create table treatmentsAdministered(
taid int not null auto_increment,
pid int not null,
treatmentsOrderedBy int not null,
treatmentsOrderedByDate  datetime default current_timestamp,
treatmentsAdministered int,
treatmentsAdministeredBy int,
treatmentsAdministeredByDate  datetime default current_timestamp,
primary key (taid),
foreign key (treatmentsOrderedBy) references employees(eid),
foreign key (treatmentsAdministered) references treatments(tid),
foreign key (treatmentsAdministeredBy) references employees(eid),
foreign key (pid) references patients(pid)
);

create table room(
rid int not null auto_increment,
roomNumber int not null,
pid int,
foreign key (pid) references patients(pid),
admitDate date not null,
exitDate date,
assignedBy int,
dischargedBy int,
foreign key (assignedBy) references employees(eid),
foreign key (dischargedBy) references employees(eid),
primary key (rid)
);




insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('F0151', 'Pulmonary anthrax', 201);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('G1221', 'Brucellosis due to Brucella suis', 2);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('G451', 'Melioidosis, unspecified', 20);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('G459', 'Other forms of erysipeloid', 65);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('G461', 'Pasteurellosis', 32);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('H02031', 'Leprosy, unspecified', 11);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('H02032', 'Listerial meningoencephalitis', 5);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I232', 'Diphtheritic tubulo-interstitial nephropathy', 36);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I238', 'Syphilitic cerebral arteritis', 65);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I25110', 'Latent syphilis, unspecified as early or late', 22);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I63211', 'Gonococcal peritonitis', 11);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I63312', 'Multiple papillomata and wet crab yaws', 10);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I63332', 'Bone and joint lesions of yaws', 9);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I63349', 'Western equine encephalitis', 5);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70421', 'Marburg virus disease', 2);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70432', 'Zoster ocular disease, unspecified', 3);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70435', 'Rubella without complication', 7);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70443', 'Yatapoxvirus infection, unspecified', 3);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70463', 'Chronic viral hepatitis C', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70539', 'Viral myocarditis', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70549', 'Tinea unguium', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70593', 'Cutaneous blastomycosis', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70633', 'Aspergillosis, unspecified', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70642', 'Mycetoma, unspecified', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('I70721', 'Visceral leishmaniasis', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('M80042D', 'Chagas disease with digestive system involvement, unspecified', 2);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('N413', 'Rhodesiense trypanosomiasis', 5);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('N46024', 'Echinococcus granulosus infection of liver', 7);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('T7621XA', 'Echinococcus multilocularis infection of liver', 54);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('Z6822', 'Filariasis due to Wuchereria bancrofti', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('H04533', 'Trichuriasis', 6);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('P012', 'Sequelae of viral encephalitis', 85);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('P0229', 'Unspecified infectious disease', 32);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('P0514', 'Malignant neoplasm of external lip, unspecified', 21);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('P0703', 'Malignant neoplasm of branchial cleft', 11);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('P113', 'Malignant neoplasm of anus, unspecified', 31);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('P280', 'Malignant neoplasm of unspecified main bronchus', 2);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('P368', 'Malignant neoplasm of long bones of left lower limb', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('P619', 'Merkel cell carcinoma of other parts of face', 1);
insert into diagnosis (diagnosisCode, diagnosisName, totalOccurrences) values('P830', 'Squamous cell carcinoma of skin of unspecified parts of face', 1);
insert into treatments (name, description, treatmentType) values('Fosinovice','Facet Joint Injection', 'Medication');
insert into treatments (name, description, treatmentType) values('Alvitoin','Weak Bones', 'Medication');
insert into treatments (name, description, treatmentType) values('Antanosine','Pain in Hands', 'Medication');
insert into treatments (name, description, treatmentType) values('Methivene','Migrane', 'Medication');
insert into treatments (name, description, treatmentType) values('Etotrana','Neck Pain', 'Medication');
insert into treatments (name, description, treatmentType) values('Zannovate','Stomach Pain', 'Medication');
insert into treatments (name, description, treatmentType) values('Tamsuterol','Night Sweats', 'Medication');
insert into treatments (name, description, treatmentType) values('Ramistrin','Anxiety', 'Medication');
insert into treatments (name, description, treatmentType) values('Hyaluretin','Depression', 'Medication');
insert into treatments (name, description, treatmentType) values('Afiniphine','Stroke', 'Medication');
insert into treatments (name, description, treatmentType) values('Aldurarall','Migrane', 'Medication');
insert into treatments (name, description, treatmentType) values('Allolimus','Flu', 'Medication');
insert into treatments (name, description, treatmentType) values('Compabutrol','Swine Flu', 'Medication');
insert into treatments (name, description, treatmentType) values('Brimospan','Nile Virus', 'Medication');
insert into treatments (name, description, treatmentType) values('Tazalazine','SARS', 'Procedure');
insert into volunteers (firstName, lastName, service, monday) values( 'Margo', 'Harry', 'Gift Shop', 1);
insert into volunteers (firstName, lastName, service, tuesday) values( 'Bobby', 'Pierce', 'information desk', 1);
insert into volunteers (firstName, lastName, service, tuesday, wednesday) values( 'Sara', 'Hudson', 'Snack Carts', 1, 1);
insert into volunteers (firstName, lastName, service, thursday) values( 'Eli', 'Musk', 'Reading Carts', 1);
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('nurse', 'Robert', 'Crawford', 954498536, 'address', 'Auburn', 'AL', 65986, 555358604, 19800804, 'rc@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('nurse', 'James', 'Wimbish', 986358741, 'address', 'Auburn', 'AL', 62358, 555831266, 19970301, 'jw@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('nurse', 'Jerry', 'Carter', 986636987, 'address', 'Auburn', 'AL', 98426, 555984483, 19820910, 'jc@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('nurse', 'Ellis', 'Turner', 953689744, 'address', 'Auburn', 'AL', 95687, 555144612, 19910217, 'et@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('nurse', 'Lesley', 'Seitz', 956369875, 'address', 'Auburn', 'AL', 12568, 555226575, 19840131, 'ls@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('technician', 'Helen', 'Brown', 515969364, 'address', 'Auburn', 'AL', 74589, 555803977, 19960519, 'hb@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('technician', 'Gladys', 'Rucker', 852369587, 'address', 'Auburn', 'AL', 36258, 555237566, 19821206, '@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('technician', 'Margaret', 'Cotton', 159654785, 'address', 'Auburn', 'AL', 26587, 555225964, 19981211, '@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('technician', 'Phillip', 'Salazar', 653698521, 'address', 'Auburn', 'AL', 13658, 555851267, 19840814, '@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('technician', 'Mannino', 'Martin', 986532147, 'address', 'Auburn', 'AL', 36958, 555627971, 19800901, '@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, staffNonMedicalWorkArea) values('staff', 'Aliff', 'Perry', 123659875, 'address', 'Auburn', 'AL', 65328, 555891992, 19830929, '@rhyta.com', 'Cafeteria');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, staffNonMedicalWorkArea) values('staff', 'Skinner', 'Stark', 326985693, 'address', 'Auburn', 'AL', 98657, 555949196, 19850927, '@rhyta.com','Gift Shop');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, staffNonMedicalWorkArea) values('staff', 'Chandler', 'Anthony', 321459638, 'address', 'Auburn', 'AL', 98659, 555722469, 19970514, '@rhyta.com','Janitorial');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, staffNonMedicalWorkArea) values('staff', 'Gray', 'Gregory', 326985859, 'address', 'Auburn', 'AL', 32159, 555487200, 19861125, '@rhyta.com','Snack Cart');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, staffNonMedicalWorkArea) values('staff', 'Jordan', 'Dennis', 326987569, 'address', 'Auburn', 'AL', 98745, 555215728, 19861115, '@rhyta.com','Reading Cart');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('administrator', 'Hahn', 'Booth', 326985987, 'address', 'Auburn', 'AL', 55536985, 555151495, 19980527, '@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('administrator', 'Lytton', 'Williams', 326987896, 'address', 'Auburn', 'AL', 55565987, 555680626, 19871207, '@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('administrator', 'Collier', 'Bynum', 326985415, 'address', 'Auburn', 'AL', 55532159, 555228960, 20000721, '@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('administrator', 'Carroll', 'Williams', 321596325, 'address', 'Auburn', 'AL', 55514596, 555124590, 19900725, '@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email) values('administrator', 'Fane', 'Marshall', 125489675, 'address', 'Auburn', 'AL', 55532987, 555146806, 19980504, '@rhyta.com');
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, DoctorConsultingRights, DoctorAdmitRights) values('doctor', 'Borchers', 'Celentano', 326987531, 'address', 'Auburn', 'AL', 32698, 555435127, 19890406, '@rhyta.com', 1, 1);
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, DoctorConsultingRights, DoctorAdmitRights) values('doctor', 'Davis', 'Frazier', 326985214, 'address', 'Auburn', 'AL', 95874, 555985630, 19920206, '@rhyta.com', 1, 1);
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, DoctorConsultingRights, DoctorAdmitRights) values('doctor', 'Miller', 'Marshall', 326987536, 'address', 'Auburn', 'AL', 95368, 555513014, 19901009, '@rhyta.com', 1, 1);
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, DoctorConsultingRights) values('doctor', 'Blackburn', 'Boston', 329648962, 'address', 'Auburn', 'AL', 98745, 555272350, 19960126, '@rhyta.com', 1);
insert into employees (medicaltype, firstName, lastName, ssn, address, city, state, zip, phone, dob, email, DoctorConsultingRights) values('doctor', 'Hall', 'Carney', 329658964, 'address', 'Auburn', 'AL', 92364, 555531286, 19960803, 'hc@rhyta.com', 1);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, extraDoctor1, did) values( 'Toshiko', 'Schwartz', 456784567, '1795 Post Avenue', 'Philadelphia', 'AL', 16512,  19900604, 'niveddole-3710@yopmail.com', 21, 'Santa Claus', 5698752394, 21, 1);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, extraDoctor1, extraDoctor2, did) values( 'Jeanne', 'McMillan', 456234857, '1251 Gambler Lane', 'Charleroi', 'AK', 34588,  19880322, 'zosexossat-0450@yopmail.com', 21, 'Santa Claus', 2158965478, 22, 23, 2);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, extraDoctor1, extraDoctor2, extraDoctor3, did) values( 'Karina', 'Taylor', 904583156, '2947 Comfort Court', 'Truman', 'AZ', 75675,  19860411, 'ipakohu-2084@yopmail.com', 22, 'Santa Claus', 4566985236, 21, 22, 23, 3);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, extraDoctor1, did) values( 'Mary', 'Giron', 678905431, '877 American Drive', 'Miami', 'AR', 45678,  19900426, 'vafehehego-4997@yopmail.com', 25, 'Santa Claus', 1255478536, 25, 4);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, extraDoctor1, extraDoctor2, did) values( 'Don', 'Pickett', 678965328, '2250 Cameron Road', 'Bedford', 'CA', 44578,  19960408, 'reppellazyz-1313@yopmail.com', 24, 'Santa Claus', 1255963598, 22, 24, 5);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, did) values( 'Nancy', 'Jones', 789541578, '3787 Tyler Avenue', 'Phoenix', 'CO', 85455,  19840127, 'mummorriwumm-2825@yopmail.com', 23, 'Santa Claus', 4566987566, 6);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, did) values( 'Kelvin', 'Christie', 670987316, '356 Buffalo Creek Road', 'Saxonsburg', 'CT', 45764,  19980502, 'iremadybe-6450@yopmail.com', 22, 'Santa Claus', 4566985214, 7);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, did) values( 'Donald', 'Webb', 780653158, '2256 Burke Street', 'Austin', 'DE', 32455,  19850228, 'idakypeff-3958@yopmail.com', 22, 'Santa Claus', 1222544783, 8);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, did) values( 'Carmelo', 'Prince', 780532156, '1814 Jerry Toth Drive', 'Troy', 'FL', 34555,  19880527, 'attuttirre-1225@yopmail.com', 25, 'Santa Claus', 1236547855, 9);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, admittingDoctor, emergencyContect, insuranceGroupNumber, did) values( 'Cecily', 'Welch', 780564217, '4120 Saint Clair Street', 'El Monte', 'GA', 88899,  19981127, 'essisaffur-9740@yopmail.com', 23, 'Santa Claus', 1255447832, 10);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Victoria', 'Spearman', 790564321, '267 Filbert Street', 'New York', 'HI', 99065,  19890406, 'laqereda-6316@yopmail.com', 11);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Edwin', 'Dye', 890763578, '2339 Star Route',  'Concord', 'ID', 45555, 19900514, 'mycussutty-4958@yopmail.com', 12);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Jay', 'Albers', 888907654, '800 Ford Street',  'Forestburg', 'IL', 54445, 19941209, 'cidadossy-5156@yopmail.com', 13);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Ryan', 'Johnson', 666543215, '127 Watson Street',  'Augusta', 'IN', 45676, 19990529, 'ossirrypu-0392@yopmail.com', 14);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Matthew', 'Deleon', 888765678, '1003 Coolidge Street',  'Sacramento', 'IA', 45543, 19821228, 'immittudop-1131@yopmail.com', 15);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Casey', 'Honeycutt', 119878909, '2389 Deer Haven Drive',  'Pittsburgh', 'KS', 22664, 19840913, 'lenukyfacy-9466@yopmail.com', 16);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Ronald', 'Chastain', 334455667, '1164 Sardis Station',  'Jackson', 'KY', 34566, 19971212, 'asilimac-4417@yopmail.com', 17);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Charles', 'Cabrera', 776768909, '2226 Hickory Lane',  'Cockeysville', 'LA', 64554, 19951007, 'vyxositty-9747@yopmail.com', 18);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Harold', 'Schwartz', 123445667, '2289 Abner Road',  'Saint Louis', 'ME', 45668, 19980214, 'zasessatteq-7472@yopmail.com', 19);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Susan', 'Gibson', 890998765, '2294 Ocello Street',  'Port Matilda', 'MD', 45685, 19840529, 'levekaqid-6005@yopmail.com', 20);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Clara', 'Griffiths', 445677894, '3892 Arrowood Drive',  'Sacramento', 'MA', 34558, 19810225, 'usecowes-5742@yopmail.com', 21);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Theodore', 'Torres', 556712321, '2821 Sunburst Drive',  'Norwalk', 'MI', 87666, 19910905, 'hegehakov-0310@yopmail.com', 22);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Mark', 'Shea', 567067666, '2841 University Drive',  'Phoenix', 'MN', 67833, 20000904, 'arimaffe-9623@yopmail.com', 40);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Amanda', 'Audette', 667744567, '3583 Bernardo Street',  'White River Junction', 'MS', 34578, 19930318, 'edavarraffa-5889@yopmail.com', 23);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Amy', 'Messer', 546678909, '3103 Lake Road',  'Oakland', 'MO', 34588, 19830421, 'ymmufasih-3934@yopmail.com', 24);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Ray', 'Harris', 112343678, '2130 Chenoweth Drive',  'Elizabethtown', 'MT', 23478, 19880127, 'asemene-8870@yopmail.com', 25);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Michael', 'Lesher', 778654457, '3419 Nixon Avenue',  'Tukwila', 'NE', 78427, 19910903, 'olloddemmimm-7553@yopmail.com', 26);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Daryl', 'Jackson', 455546709, '1008 Dennison Street',  'Warrensburg', 'NV', 54198, 19970808, 'gupahenak-4262@yopmail.com', 27);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Frederick', 'Dant', 123345768, '2666 Richland Avenue',  'Gary', 'NH', 34565, 19940209, 'cojifevob-2226@yopmail.com', 28);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Lisa', 'Petrick', 119876643, '1169 Calvin Street',  'Southfield', 'NJ', 65487, 19980202, 'tomiqucali-4987@yopmail.com', 29);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Ramona', 'Bennett', 556124789, '4618 Camden Street',  'San Jose', 'NM', 76543, 19870615, 'veddamoffob-8604@yopmail.com', 30);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Paul', 'Wilson', 117634555, '4697 Norma Avenue',  'East Rochester', 'NY', 34589, 19890125, 'bohekysadu-6940@yopmail.com', 31);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Donald', 'McCarter', 345678943, '1175 Wescam Court',  'Seattle', 'NC', 99534, 19990613, 'arattawy-3957@yopmail.com', 32);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Taylor', 'Loving', 354534578, '4292 Conference Center Way',  'Chantilly', 'ND', 45689, 19820201, 'coffyhepul-2961@yopmail.com', 33);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Lyle', 'Whiteley', 345788909, '3264 Veltri Drive',  'Florala', 'OH', 98536, 19930810, 'onaquki-9652@yopmail.com', 34);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Roberta', 'Tobias', 345333458, '1512 Redbud Drive',  'Brockton', 'OK', 67679, 19860923, 'hagunezu-4445@yopmail.com', 35);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Sierra', 'Stein', 345678909, '3540 Wayback Lane',  'Fallbrook', 'OR', 98532, 19850720, 'vahissatte-7262@yopmail.com', 36);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Victoria', 'Dickens', 345689099, '2520 Bedford Street',  'Marion', 'PA', 65756, 19921128, 'attytofu-7076@yopmail.com', 37);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Jennifer', 'Young', 994564894, '879 Trymore Road',  'East Haven', 'RI', 45689, 19990320, 'exazapeti-0491@yopmail.com', 38);
insert into patients (firstName, lastName, ssn, address, city, state, zip,  dob, email, did) values( 'Bobby', 'Yung', 548896634, '879 Main Road',  'West Haven', 'RI', 45689, 19870907, 'qolummucerr-2606@yopmail.com', 39);
insert into room (roomnumber, pid, admitDate, assignedBy) values(101, 1, 20170418, 16);
insert into room (roomnumber, pid, admitDate, assignedBy) values(102, 2, 20170217, 16);
insert into room (roomnumber, pid, admitDate, assignedBy) values(103, 3, 20170603, 18);
insert into room (roomnumber, pid, admitDate, assignedBy) values(104, 4, 20170113, 17);
insert into room (roomnumber, pid, admitDate, assignedBy) values(105, 5, 20170213, 19);
insert into room (roomnumber, pid, admitDate, assignedBy) values(106, 6, 20170303, 20);
insert into room (roomnumber, pid, admitDate, assignedBy) values(107, 7, 20170808, 20);
insert into room (roomnumber, pid, admitDate, assignedBy) values(108, 8, 20170120, 17);
insert into room (roomnumber, pid, admitDate, assignedBy) values(109, 9, 20170530, 18);
insert into room (roomnumber, pid, admitDate, assignedBy) values(110, 10, 20170207, 19);
insert into room (roomnumber, pid, admitDate, assignedBy) values(201, 11, 20170605, 20);
insert into room (roomnumber, pid, admitDate, assignedBy) values(202, 12, 20170307, 18);
insert into room (roomnumber, pid, admitDate, exitDate, assignedBy, dischargedBy) values(203, 13, 20170430, 20170505, 18, 16);
insert into room (roomnumber, pid, admitDate, exitDate, assignedBy, dischargedBy) values(204, 14, 20170522, 20170601, 19, 17);
insert into room (roomnumber, pid, admitDate, exitDate, assignedBy, dischargedBy) values(205, 15, 20170602, 20170701, 20, 18);
insert into room (roomnumber, pid, admitDate, exitDate, assignedBy, dischargedBy) values(206, 16, 20170131, 20170303, 16, 19);
insert into treatmentsAdministered (pid, treatmentsOrderedBy, treatmentsAdministered, treatmentsAdministeredBy) values(1, 21, 2, 21);
insert into treatmentsAdministered (pid, treatmentsOrderedBy, treatmentsAdministered, treatmentsAdministeredBy, treatmentsOrderedByDate) values(1, 21, 2, 21, 20170101);



