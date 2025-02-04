--1 Таблиця регіону--
CREATE TABLE Region (
RegionID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
RegionName NVARCHAR(35),
PopulationRegion INT,
);
--2 Таблиця виборів--
CREATE TABLE Election (
ElectionID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
ElectionStartDate DATE,
ElectionEndDate DATE,
);
--3 Таблиця національності--
CREATE TABLE Nationality (
NationalityID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
NationalityName NVARCHAR(25)
);
--4 Таблиця кандидатів--

CREATE TABLE Candidate (
CandidateID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR(30),
LastName NVARCHAR(30),
MiddleName NVARCHAR(30),
NationalityID INT,
DateOfBirth DATE,
InformationCandidate NVARCHAR(1000),
FOREIGN KEY (NationalityID) REFERENCES Nationality( NationalityID)
);
--5 Проміжна таблиця Кандидат-Вибори (багато до багатьох)--
CREATE TABLE CandidateElection (
CandidateID INT NOT NULL FOREIGN KEY REFERENCES Candidate(CandidateID),
ElectionID INT NOT NULL FOREIGN KEY REFERENCES Election(ElectionID),
PRIMARY KEY (CandidateID, ElectionID)
);
--6 Таблиця виборців--
CREATE TABLE Voter (
VoterID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR(30),
LastName NVARCHAR(30),
MiddleName NVARCHAR(30),
NationalityID INT,
DateOfBirth DATE,
RegionID INT,
FOREIGN KEY (NationalityID) REFERENCES Nationality(NationalityID),
FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);
--7 Таблиця кампанії--
CREATE TABLE Campaign (
CampaignID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
CandidateID INT NOT NULL,
CampaignName NVARCHAR(50),
StartDate DATE,
EndDate DATE,
CampaignDescription NVARCHAR(500)
FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID)
);
--8 Таблиця бюджету кампанії--
CREATE TABLE Budget (
BudgetID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
CampaignID INT UNIQUE,
BudgetAmount DECIMAL(18, 2),
Expenditure DECIMAL(18, 2),
FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID)
);
--9 Таблиця результат виборів--
CREATE TABLE ElectionResult (
ElectionResultID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
CandidateID INT,
ElectionID INT,
ResultDescription NVARCHAR(1000),
FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID),

FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID)
);
--10 Таблиця голосу--
CREATE TABLE Vote (
VoteID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
VoterID INT,
CandidateID INT,
ElectionID INT,
VoteDate DATETIME,
RegionID INT,
FOREIGN KEY (VoterID) REFERENCES Voter(VoterID),
FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID),
FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID),
FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);