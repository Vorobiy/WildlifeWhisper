Create database Wildlife_Whisper; 
Use Wildlife_Whisper;

Create Table Reporter (
RID int primary key,
RName varchar(25) Default 'Anonymous',
RPhone varchar(12) Default 'N/A',
REmail varchar(20) Default 'N/A',
Date_Reported date
);

Create Table Poacher (
PID int primary key,
PIdentity varchar(25) Default '',
Reported_By int references Reporter(RID),
Animal_Hunt varchar(25) Default 'Not Known',
LocationID int references Location(LocationID), 
Date_Reported date
);

Create Table Reported (
RID int references Reporter(RID),
PID int references Poacher(PID),
Date_Reported date,
primary key (RID, PID, Date_Reported) 
);

Create Table Animal (
AID int primary key,
Aname varchar(25) Default 'Not Known',
Endangered_Level varchar(30) Default 'Vulnerable',
Effects varchar(50) 
);

CREATE TABLE Location (
    LocationID INT PRIMARY KEY ,
    LocationName VARCHAR(50),
    Province VARCHAR(30),
    Longitude DECIMAL(9,6),
    Latitude DECIMAL(8,6)
);


Create Table Hunt(
PID int references Poacher(PID),
AID int references Animal(AID),
LocationID int references Location(LocationID),
primary key (PID, AID)
);

INSERT INTO Reporter (RID, RName, RPhone, REmail, Date_Reported) VALUES
(1, 'Emily Clark', '2345678901', 'emily@example.com', '2024-06-10'),
(2, 'Michael Brown', '3456789012', 'michael@example.com', '2024-06-15'),
(3, 'Sarah Johnson', '4567890123', 'sarah@example.com', '2024-07-01'),
(4, 'David Lee', '5678901234', 'david@example.com', '2024-07-10'),
(5, 'Olivia Davis', '6789012345', 'olivia@example.com', '2024-07-15'),
(6, 'James Wilson', '7890123456', 'james@example.com', '2024-07-20'),
(7, 'Sophia Martinez', '8901234567', 'sophia@example.com', '2024-07-25'),
(8, 'Liam Garcia', '9012345678', 'liam@example.com', '2024-08-01'),
(9, 'Anonymous', 'N/A', 'N/A', '2024-08-05'),
(10, 'Noah Clark', '1234509876', 'noah@example.com', '2024-08-10'),
(11, 'Isabella Rodriguez', '2345608765', 'isabella@example.com', '2024-08-15'),
(12, 'William Lewis', '3456707654', 'william@example.com', '2024-08-20'),
(13, 'Anonymous', 'N/A', 'N/A', '2024-08-25'),
(14, 'Ethan Hall', '5678905432', 'ethan@example.com', '2024-09-01'),
(15, 'Ava Young', '6789004321', 'ava@example.com', '2024-09-05');

INSERT INTO Location (LocationID, LocationName, Province, Longitude, Latitude) VALUES
(1, 'Banff National Park', 'Alberta', -115.5708, 51.1784),
(2, 'Algonquin Provincial Park', 'Ontario', -78.3577, 45.8372),
(3, 'Jasper National Park', 'Alberta', -118.0814, 52.8734),
(4, 'Yoho National Park', 'British Columbia', -116.5772, 51.3761),
(5, 'Gros Morne National Park', 'Newfoundland and Labrador',-57.7432, 49.6820),
(6, 'Pacific Rim National Park', 'British Columbia', -125.8045, 48.8322),
(7, 'Kluane National Park', 'Yukon',-138.5613, 60.7500),
(8, 'Waterton Lakes National Park', 'Alberta', -113.9144, 49.0526),
(9, 'Prince Edward Island National Park', 'Prince Edward Island', -63.1311, 46.4395),
(10, 'Fundy National Park', 'New Brunswick',  -65.0267, 45.5941),
(11, 'Auyuittuq National Park', 'Nunavut',  -65.1137, 67.8810),
(12, 'Cape Breton Highlands National Park', 'Nova Scotia', -60.4068, 46.7375),
(13, 'Kootenay National Park', 'British Columbia', -116.0521, 50.9242),
(14, 'Thousand Islands National Park', 'Ontario', -76.0420, 44.3617),
(15, 'Wood Buffalo National Park', 'Alberta',  -112.4397, 59.3920);

INSERT INTO Poacher (PID, PIdentity, Reported_By, Animal_Hunt, LocationID, Date_Reported) VALUES
(1, 'Poacher X', 1, 'Moose', 1, '2024-06-10'),
(2, 'Poacher Y', 2, 'Gray Wolf', 2, '2024-06-15'),
(3, 'Poacher Z', 3, 'Grizzly Bear', 3, '2024-07-01'),
(4, 'Poacher A', 4, 'Beaver', 4, '2024-07-10'),
(5, 'Poacher B', 5, 'Canadian Lynx', 5, '2024-07-15'),
(6, 'Poacher C', 6, 'Bald Eagle', 6, '2024-07-20'),
(7, 'Poacher D', 7, 'Caribou', 7, '2024-07-25'),
(8, 'Poacher E', 8, 'Snowshoe Hare', 8, '2024-08-01'),
(9, 'Poacher F', 9, 'American Black Bear', 9, '2024-08-05'),
(10, 'Poacher G', 10, 'Arctic Fox', 10, '2024-08-10'),
(11, 'Poacher H', 11, 'Peregrine Falcon', 11, '2024-08-15'),
(12, 'Poacher I', 12, 'Beluga Whale', 12, '2024-08-20'),
(13, 'Poacher J', 13, 'Eastern Cougar', 13, '2024-08-25'),
(14, 'Poacher K', 14, 'Red Fox', 14, '2024-09-01'),
(15, 'Poacher L', 15, 'Harbour Seal', 15, '2024-09-05');

INSERT INTO Reported (RID, PID, Date_Reported) VALUES
(1, 1, '2024-06-10'),
(2, 2, '2024-06-15'),
(3, 3, '2024-07-01'),
(4, 4, '2024-07-10'),
(5, 5, '2024-07-15'),
(6, 6, '2024-07-20'),
(7, 7, '2024-07-25'),
(8, 8, '2024-08-01'),
(9, 9, '2024-08-05'),
(10, 10, '2024-08-10'),
(11, 11, '2024-08-15'),
(12, 12, '2024-08-20'),
(13, 13, '2024-08-25'),
(14, 14, '2024-09-01'),
(15, 15, '2024-09-05');


INSERT INTO Animal (AID, AName, Endangered_Level, Effects) VALUES
(1, 'Moose', 'Least Concern', 'Habitat loss, hunting'),
(2, 'Gray Wolf', 'Least Concern', 'Habitat loss, conflict with humans'),
(3, 'Grizzly Bear', 'Vulnerable', 'Habitat loss, hunting'),
(4, 'Beaver', 'Least Concern', 'Habitat destruction, water pollution'),
(5, 'Canadian Lynx', 'Least Concern', 'Habitat loss, hunting'),
(6, 'Bald Eagle', 'Least Concern', 'Habitat destruction, pollution'),
(7, 'Caribou', 'Vulnerable', 'Habitat loss, climate change'),
(8, 'Snowshoe Hare', 'Least Concern', 'Predation, habitat loss'),
(9, 'American Black Bear', 'Least Concern', 'Habitat loss, hunting'),
(10, 'Arctic Fox', 'Least Concern', 'Climate change, habitat loss'),
(11, 'Peregrine Falcon', 'Least Concern', 'Habitat destruction, pollution'),
(12, 'Beluga Whale', 'Near Threatened', 'Pollution, hunting'),
(13, 'Eastern Cougar', 'Critically Endangered', 'Habitat loss, hunting'),
(14, 'Red Fox', 'Least Concern', 'Habitat loss, hunting'),
(15, 'Harbour Seal', 'Least Concern', 'Pollution, hunting');


INSERT INTO Hunt (PID, AID, LocationID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15);

Select PID As PoacherId, PIdentity As Poacher_Name, RID As ReporterID,
Rname AS Reported_By, p.Date_Reported, Aname As Animal_Hunted,
Endangered_Level,Effects, l.LocationName, Province, Longitude, Latitude
From Poacher p, Reporter r,  Location l, Animal a
Where p.Reported_By = r.RID
	AND p.Date_Reported = r.Date_Reported 
    AND a.Aname = p.Animal_Hunt
    AND l.LocationID = p.LocationID
Order By PID;
    
/*Select PIdentity As Poacher_Name, Animal_Hunt As Animal_Hunted, 
 l.LocationName, Longitude, Latitude
From Location l, Poacher p
Where l.LocationID = p.LocationID
Order By Animal_Hunt;*/
