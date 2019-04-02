DROP DATABASE IF EXISTS kartotek_db;
CREATE DATABASE kartotek_db;
USE kartotek_db;

###################
##TABLE CREATIONS##
###################

CREATE TABLE activityTypes
(
	activityType VARCHAR(30) PRIMARY KEY
);

CREATE TABLE memberTypes
(
	memberType VARCHAR(8) PRIMARY KEY
);

CREATE TABLE contributions
(
	contributionId INT PRIMARY KEY AUTO_INCREMENT,
    activityType VARCHAR(30) NOT NULL,
    amount DOUBLE NOT NULL,
    paymentDate DATE NOT NULL,
    FOREIGN KEY (activityType) REFERENCES activityTypes(activityType)
);

CREATE TABLE members
(
	memberId SMALLINT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    mail VARCHAR(100),
    phoneNumber INT,
    creationDate DATE NOT NULL,
    memberType VARCHAR(8),
    isBoard VARCHAR(3) NOT NULL,
    FOREIGN KEY(memberType) REFERENCES memberTypes(memberType) 
);

CREATE TABLE subscriptions
(
	memberId SMALLINT PRIMARY KEY,
    payDate DATE,
    FOREIGN KEY (memberId) REFERENCES members(memberId) ON DELETE CASCADE
);

CREATE TABLE addresses
(
	memberId SMALLINT PRIMARY KEY,
    streetName VARCHAR(50),
    zipCode SMALLINT,
    city VARCHAR(50),
    FOREIGN KEY (memberId) REFERENCES members(memberId) ON DELETE CASCADE
);

CREATE TABLE userTypes
(
	userType VARCHAR(13) PRIMARY KEY
);

CREATE TABLE users
(
	username VARCHAR(20) PRIMARY KEY,
    userPassword VARCHAR(60) NOT NULL,
    userType VARCHAR(13) NOT NULL,
    FOREIGN KEY (userType) REFERENCES userTypes(userType)
);

CREATE TABLE subLogs
(
	subLogId INT PRIMARY KEY AUTO_INCREMENT,
    edit VARCHAR(26) NOT NULL,
    editDate DATE NOT NULL,
    memberId SMALLINT,
    username VARCHAR(20) NOT NULL,
    FOREIGN KEY(memberId) REFERENCES members(memberId) ON DELETE CASCADE,
    FOREIGN KEY(username) REFERENCES users(username) ON DELETE CASCADE
);

###########
##INSERTS##
###########

INSERT INTO memberTypes VALUES
		    ('Primær'),
		    ('Sekundær'),
		    ('Ekstern');

INSERT INTO members VALUES
			(1, 'Christian', 'Grye Skydt', 'Christian@mail.com', 27131428, '2018-05-20', 'Ekstern', 'Ja'),
            (2, 'Martin', 'Borup Larsen', 'Martin@mail.dk', 12321248, '2018-05-20', 'Ekstern', 'Nej'),
            (3, 'Mikkel', 'Pieler', 'Mikkel@mail.dk', 97937285, '2018-05-20', 'Sekundær', 'Nej'),
            (4, 'Jakob', 'Wulff', 'Jakob@mail.dk', 63462132, '2018-01-19', 'Primær', 'Ja'),
            (5, 'Troels', 'Helbo Jensen', 'Troels@mail.dk', 27131428, '2014-05-20', 'Ekstern', 'Nej'),
            (6, 'Nicolaj', 'Madsen', 'Nicolaj@gmail.dk', 12321248, '2007-05-20', 'Ekstern', 'Ja'),
            (7, 'Mira', 'Bo Jakobsen', 'Mira@mail.dk', 97937285, '2011-05-20', 'Sekundær', 'Ja'),
            (8, 'Filippa', 'Hansen', 'Filippa@mail.dk', 63462132, '2015-01-19', 'Primær', 'Nej'),
            (9, 'Yvonne', 'Pedersen', 'Yvonne@mail.dk', 27131428, '2013-05-20', 'Ekstern', 'Nej'),
            (10, 'Emil', 'Grye Skydt', 'Emil@mail.dk', 12321248, '2016-05-20', 'Primær', 'Nej'),
            (11, 'Maria', 'Frederiksen', 'Maria@mail.dk', 97937285, '2018-05-20', 'Sekundær', 'Nej'),
            (12, 'Camilla', 'Grye Skydt', 'Camilla@mail.dk', 63462132, '2018-06-19', 'Sekundær', 'Nej'),
            (13, 'Katrine', 'Stagstrup', 'Katrine@mail.dk', 27131428, '2018-05-20', 'Primær', 'Ja'),
            (14, 'Sofie', 'Larsen', 'Sofie@mail.dk', 12321248, '2018-05-20', 'Primær', 'Ja'),
            (15, 'Leo', 'Skydt Jørgensen', 'Leo@mail.dk', 97937285, '2018-05-20', 'Sekundær', 'Nej'),
            (16, 'Henrik', 'Nielsen', 'Henrik@mail.com', 63462132, '2018-01-19', 'Primær', 'Nej'),
            (17, 'Andreas', 'Sunesen', 'AndreasMail.dk', 27131428, '2018-05-20', 'Primær', 'Nej'),
            (18, 'Tina', 'Skovsted', 'Tina@mail.dk', 12321248, '2018-05-20', 'Ekstern', 'Nej'),
            (19, 'Asger', 'Klausen', 'AsgerMail.dk', 97937285, '2018-05-20', 'Sekundær', 'Nej'),
            (20, 'Linda', 'Kjær', 'Lindamail.dk', 63462132, '2018-01-19', 'Primær', 'Nej');

INSERT INTO addresses VALUES
			(1, 'Mosevej 32', 7700, 'Thisted'),
            (2, 'Katholmvej 34', 7700, 'Thisted'),
            (3, 'Nordre Fasanvej 194', 2000, 'Frederiksberg'),
            (4, 'Snejstrupvej 173', 3246, 'Ishøj'),
            (5, 'Mosevej 32', 7700, 'Thisted'),
            (6, 'Katholmvej 34', 7700, 'Thisted'),
            (7, 'Nordre Fasanvej 194', 2000, 'Frederiksberg'),
            (8, 'Snejstrupvej 173', 3246, 'Ishøj'),
            (9, 'Mosevej 32', 7700, 'Thisted'),
            (10, 'Katholmvej 34', 7700, 'Thisted'),
            (11, 'Nordre Fasanvej 194', 2000, 'Frederiksberg'),
            (12, 'Snejstrupvej 173', 3246, 'Ishøj'),
            (13, 'Mosevej 32', 7700, 'Thisted'),
            (14, 'Katholmvej 34', 7700, 'Thisted'),
            (15, 'Nordre Fasanvej 194', 2000, 'Frederiksberg'),
            (16, 'Snejstrupvej 173', 3246, 'Ishøj'),
            (17, 'Mosevej 32', 7700, 'Thisted'),
            (18, 'Katholmvej 34', 7700, 'Thisted'),
            (19, 'Nordre Fasanvej 194', 2000, 'Frederiksberg'),
            (20, 'Snejstrupvej 173', 3246, 'Ishøj');

INSERT INTO subscriptions VALUES
			(1, '2018-05-20'),
			(2, '2018-04-20'),
			(3, '2018-03-20'),
            (4, '2018-12-30'),
            (5, '2018-05-20'),
			(6, '2018-04-20'),
			(7, '2018-03-20'),
            (8, '2018-12-30'),
            (9, '2018-05-20'),
			(10, '2018-04-20'),
			(11, '2018-03-20'),
            (12, '2018-12-30'),
            (13, '2018-05-20'),
			(14, '2018-04-20'),
			(15, '2018-03-20'),
            (16, '2018-12-30'),
            (17, '2018-05-20'),
			(18, '2018-04-20'),
			(19, '2018-03-20'),
            (20, '2018-12-30');

INSERT INTO activityTypes VALUES
			('Foredrag'), ('Bowling'),
            ('Biograftur'), ('Svømning'),
            ('Indkøb'), ('Ishockey'), ('Ture_ud_af_huset'),
            ('Museumstur'), ('Fodboldkampe'),
            ('Vinterbadning'), ('Gaver'), ('Jul_og_nytårs_arrangement'), ('Agromek'),
            ('Kurbad'), ('Besøge_andre_huse'), ('Skitur'), ('Tipi_rejsning'), ('Diverse');
            
INSERT INTO contributions VALUES
			(DEFAULT, 'Svømning', 33.54, '2018-05-20'),
            (DEFAULT, 'Fodboldkampe', 23.75, '2018-03-18'),
            (DEFAULT, 'Bowling', 55.95, '2018-01-14');

INSERT INTO userTypes VALUES
			('Administrator'),
            ('Standard');            

INSERT INTO users VALUES
			('Leo', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 'Administrator'),
            ('Britta', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 'Administrator'),
            ('Flemming', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 'Standard');

INSERT INTO subLogs VALUES
			(DEFAULT, 'Status sat til betalt', '2018-03-12', 1, 'Britta'),
            (DEFAULT, 'Status sat til ikke betalt', '2018-07-12', 2, 'Leo'),
            (DEFAULT, 'Status sat til betalt', '2018-08-13', 2, 'Leo');