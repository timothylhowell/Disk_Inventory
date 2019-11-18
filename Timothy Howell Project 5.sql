--Timothy L Howell Disk Inventory Project V4


--V4 Date 10/22/2019
-- Change Log
-- Added Insert, Update, and Delete stored procedures for Artists, Borrowers, and Disks
-- Added example executions for each stored procedure added

--V3 Date 10/18/2019
-- Updated table information to be real world data
--Added select for individual artists
--Added view View_Individual_Artist to display artist names but not groups and an update to modify it to show the opposite
--Added select to show disks and their borrowers
--Added select to show disks and how many times they have been borrowed
--Added select to show disks that are currently out

-- V2 Date 10/11/2019
-- Changed table structure to more functional version
-- Added data to tables
-- Used stand in data for Artists, Borrowers, and Disks (To be filled with better data in next version)
-- Genre table to be expanded with film genres at later date

-- V1 Date 10/4/2019
-- Intitial Deployment
-- Created table structure
-- Created Login and User with permissions for read only

--Drops Database if already exists
IF DB_ID('disk_inventoryTH') IS NOT NULL
	DROP DATABASE disk_inventoryTH
go

--Creates database and sets to use the disk inventory database
CREATE DATABASE disk_inventoryTH;
go

USE disk_inventoryTH;
go

--Creates Artist Type table
CREATE TABLE Artist_Type (
	artistTypeID		INT			NOT NULL IDENTITY PRIMARY KEY,
	artistDescription	varchar(32)	NOT NULL
);

--Creates Artists table, references artist type
CREATE TABLE Artists (
	artistID			INT			NOT NULL IDENTITY PRIMARY KEY,
	artistFirstName		varchar(32)	NULL,
	artistLastName		varchar(32)	NULL,
	artistGroupName		varchar(32) NULL,
	artistTypeID		INT			NOT NULL REFERENCES Artist_Type(artistTypeID)
);

--Creates Borrowers table
CREATE TABLE Borrowers (
	borrowerID			INT			NOT NULL IDENTITY PRIMARY KEY,
	borrowerFirstName	varchar(32)	NOT NULL,
	borrowerLastName	varchar(32)	NOT NULL,
	borrowerPhone		char(12)	NOT NULL
);

--Creates Genre table
CREATE TABLE Genre (
	genreID				INT			NOT NULL IDENTITY PRIMARY KEY,
	genreDescription	varchar(32)	NOT NULL
);

--Creates Disk Status table to track current state of a disk
CREATE TABLE Disk_Status (
	statusID			INT			NOT NULL IDENTITY PRIMARY KEY,
	statusDescription	varchar(32)	NOT NULL
);

--Creates Disk Type table
CREATE TABLE Disk_Type (
	diskTypeID			INT			NOT NULL IDENTITY PRIMARY KEY,
	diskTypeDescription	varchar(32)	NOT NULL
);

--Creates Disks table
CREATE TABLE Disks (
	diskID				INT			NOT NULL IDENTITY PRIMARY KEY,
	genreID				INT			NOT NULL REFERENCES Genre(genreID),
	diskName			varchar(164)	NOT NULL,
	releaseDate			date		NOT NULL,
	statusID			INT			NOT NULL REFERENCES Disk_Status(statusID),
	diskTypeID			INT			NOT NULL REFERENCES Disk_Type(diskTypeID)
);

--Creates Disk Artist table
CREATE TABLE Disk_Artist (
	diskID				INT			NOT NULL REFERENCES Disks(diskID),
	artistID			INT			NOT NULL REFERENCES Artists(artistID)
);

--Creates Borrowed Disks table to track which disks are currently borrowed
CREATE TABLE Borrowed_Disks (
	borrowedDate		date		NOT NULL,
	borrowerID			INT			NOT NULL REFERENCES Borrowers(borrowerID),
	diskID				INT			NOT NULL REFERENCES Disks(diskID),
	returnedDate		date		NULL
);

go

--Removes Login if it already exists
IF SUSER_ID('diskUserTH') IS NOT NULL Drop LOGIN diskUserTH 

--Creates the login for the diskUser
CREATE LOGIN diskUserTH WITH PASSWORD = 'Pa$$w0rd',
DEFAULT_DATABASE = disk_inventoryTH;
go

use disk_inventoryTH;
go

--Removes user if it already exists
DROP USER IF EXISTS diskUserTH;
go

--Creates diskUser and assigns role as a data reader
CREATE USER diskUserTH;

ALTER ROLE db_datareader ADD MEMBER diskUserTH;


--Table filling follows


--Adds Generes to the genere table
USE [disk_inventoryTH]
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Rock')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Electronic')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('R&B')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Funk')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Jazz')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Folk')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Pop')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Classical')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Blues')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Country')
GO

INSERT INTO [dbo].[Genre]
           ([genreDescription])
     VALUES
           ('Film')
GO


--Populates Artist_Types

USE [disk_inventoryTH]
GO

INSERT INTO [dbo].[Artist_Type]
           ([artistDescription])
     VALUES
           ('Solo')
GO

INSERT INTO [dbo].[Artist_Type]
           ([artistDescription])
     VALUES
           ('Group')
GO

INSERT INTO [dbo].[Artist_Type]
           ([artistDescription])
     VALUES
           ('Collab')
GO

INSERT INTO [dbo].[Artist_Type]
           ([artistDescription])
     VALUES
           ('Director')
GO

--Populates Disk_Type

USE [disk_inventoryTH]
GO

INSERT INTO [dbo].[Disk_Type]
           ([diskTypeDescription])
     VALUES
           ('CD')
GO

INSERT INTO [dbo].[Disk_Type]
           ([diskTypeDescription])
     VALUES
           ('Vinyl Record')
GO

INSERT INTO [dbo].[Disk_Type]
           ([diskTypeDescription])
     VALUES
           ('DVD')
GO

INSERT INTO [dbo].[Disk_Type]
           ([diskTypeDescription])
     VALUES
           ('BluRay')
GO

INSERT INTO [dbo].[Disk_Type]
           ([diskTypeDescription])
     VALUES
           ('HD-DVD')
GO

INSERT INTO [dbo].[Disk_Type]
           ([diskTypeDescription])
     VALUES
           ('Laser Disk')
GO

--Populates Disk_Status

USE [disk_inventoryTH]
GO

INSERT INTO [dbo].[Disk_Status]
           ([statusDescription])
     VALUES
           ('Checked In')
GO

INSERT INTO [dbo].[Disk_Status]
           ([statusDescription])
     VALUES
           ('Checked Out')
GO

INSERT INTO [dbo].[Disk_Status]
           ([statusDescription])
     VALUES
           ('Missing')
GO

INSERT INTO [dbo].[Disk_Status]
           ([statusDescription])
     VALUES
           ('Damaged')
GO

--Populates the Borrower table

USE [disk_inventoryTH]
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('First'
           ,'Borrower'
           ,'555-555-5501')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Second'
           ,'Borrower'
           ,'555-555-5502')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Third'
           ,'Renter'
           ,'555-555-5503')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('First'
           ,'Jones'
           ,'555-555-5504')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Second'
           ,'Smith'
           ,'555-555-5505')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Sixth'
           ,'Borrower'
           ,'555-555-5506')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Seven'
           ,'Test'
           ,'555-555-5507')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Test'
           ,'Eight'
           ,'555-555-5508')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Ninth'
           ,'Rent'
           ,'555-555-5509')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Number'
           ,'Ten'
           ,'555-555-5510')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Borrower'
           ,'Eleven'
           ,'555-555-5511')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Test'
           ,'Tester'
           ,'555-555-5512')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Thirteen'
           ,'Number'
           ,'555-555-5513')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Four'
           ,'Teen'
           ,'555-555-5514')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Teen'
           ,'Fifth'
           ,'555-555-5515')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Test'
           ,'Sixteen'
           ,'5555555516')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Joe'
           ,'Test'
           ,'555-555-5517')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Jim'
           ,'Borrower'
           ,'555-555-5518')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Nineteen'
           ,'Borrower'
           ,'555-555-5519')
GO

INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Borrower'
           ,'Twenty'
           ,'555-555-5520')
GO

--Example Borrower to be deleted
INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           ('Delete'
           ,'Me'
           ,'555-555-5555')
GO

--Deletes borrower 'Delete Me' with the ID of 21
USE [disk_inventoryTH]
GO

IF EXISTS (SELECT borrowerID FROM Borrowers WHERE borrowerID = 21)
DELETE FROM [dbo].[Borrowers]
      WHERE borrowerID = 21
GO

--Populates Artists table

USE [disk_inventoryTH]
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('Queen'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
		   ,[artistGroupName]
           ,[artistTypeID])
     VALUES
           ('Ronnie James'
           ,'Dio'
		   ,'DIO'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
		   ,[artistGroupName]
           ,[artistTypeID])
     VALUES
           ('Andrew'
           ,'Wilkes-Krier'
		   ,'Andrew W.K.'
           ,1)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
           ,[artistTypeID])
     VALUES
           ('Elvis'
           ,'Presley'
           ,1)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
           ,[artistTypeID])
     VALUES
           ('Billy'
           ,'Joel'
           ,1)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
           ,[artistTypeID])
     VALUES
           ('David'
           ,'Bowie'
           ,1)
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('The Megas'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('The Protomen'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('The Pillows'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('Beat Crusaders'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('Yes'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
		   ,[artistGroupName]
           ,[artistTypeID])
     VALUES
           ('Aurelio'
           ,'Voltaire'
		   ,'Voltaire'
           ,1)
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('The Blue Hearts'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('The Beatles'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('Styx'
           ,2)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
           ,[artistTypeID])
     VALUES
           ('Johnny'
           ,'Cash'
           ,1)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
           ,[artistTypeID])
     VALUES
           ('Akira'
           ,'Kurosawa'
           ,4)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
           ,[artistTypeID])
     VALUES
           ('George'
           ,'Lucas'
           ,4)
GO

INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
           ,[artistTypeID])
     VALUES
           ('Orson'
           ,'Welles'
           ,4)
GO

INSERT INTO [dbo].[Artists]
           ([artistGroupName]
           ,[artistTypeID])
     VALUES
           ('Monty Python'
           ,4)
GO

--Populates Disk table

USE [disk_inventoryTH]
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'A Kind of Magic'
           ,'06-02-1986'
           ,2
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (7
           ,'Hot Space'
           ,'05-21-1982'
           ,2
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'Holy Diver'
           ,'05-25-1983'
           ,2
           ,2)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'The Wolf'
           ,'09-09-2003'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'Blue Hawaii'
           ,'10-20-1961'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (7
           ,'Piano Man'
           ,'11-09-1973'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (7
           ,'Diamond Dogs'
           ,'05-24-1974'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'History Repeating: Blue'
           ,'06-18-2012'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'Act 2: The Father of Death'
           ,'09-08-2009'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'Please Mr.Lostman'
           ,'01-22-1997'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (7
           ,'Hit In The USA'
           ,'10-20-2004'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'Fragile'
           ,'11-12-1971'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (7
           ,'Riding A Black Unicorn Down The Side of An Erupting Volcano While Drinking From A Chalice Filled With The Laughter of Small Children'
           ,'09-02-2011'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'High Kicks'
           ,'12-21-1991'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (7
           ,'Abbey Road'
           ,'09-26-1969'
           ,1
           ,2)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'Kilroy Was Here'
           ,'02-22-1983'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'Man in Black'
           ,'05-01-1971'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (11
           ,'Seven Samurai'
           ,'04-26-1954'
           ,1
           ,6)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (11
           ,'Star Wars Episode IV: A New Hope'
           ,'05-25-1977'
           ,1
           ,5)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (11
           ,'Macbeth'
           ,'10-01-1948'
           ,1
           ,4)
GO

INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (11
           ,'Monty Python and The Holy Grail'
           ,'03-14-1975'
           ,1
           ,3)
GO

--Disk for Updating
INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (1
           ,'BROKEN DISK UPDATE ME!'
           ,'02-01-2010'
           ,4
           ,1)
GO

--Updates 'BROKEN DISK UPDATE ME!' by diskID
USE [disk_inventoryTH]
GO

UPDATE [dbo].[Disks]
   SET [diskName] = 'Fixed Disk'
      ,[statusID] = 1
 WHERE diskID = 22
GO

--Populates the Borrowed_Disks table

USE [disk_inventoryTH]
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID])
     VALUES
           ('01-01-2019'
           ,1
           ,1)
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID])
     VALUES
           ('01-02-2019'
           ,2
           ,2)
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID])
     VALUES
           ('01-03-2019'
           ,3
           ,3)
GO


INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-01-2019'
           ,1
           ,3
           ,'01-02-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-05-2019'
           ,4
           ,4
           ,'02-05-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-06-2019'
           ,5
           ,5
           ,'02-06-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('02-07-2019'
           ,4
           ,4
           ,'03-07-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-08-2019'
           ,6
           ,6
           ,'02-08-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-07-2019'
           ,7
           ,7
           ,'02-07-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-08-2019'
           ,8
           ,8
           ,'02-08-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-09-2019'
           ,9
           ,9
           ,'02-09-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-10-2019'
           ,10
           ,10
           ,'02-10-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-11-2019'
           ,11
           ,11
           ,'02-11-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-12-2019'
           ,12
           ,12
           ,'02-12-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-13-2019'
           ,13
           ,13
           ,'02-13-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-14-2019'
           ,4
           ,14
           ,'02-05-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-15-2019'
           ,15
           ,15
           ,'02-15-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-16-2019'
           ,16
           ,17
           ,'02-16-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('03-17-2019'
           ,17
           ,17
           ,'03-17-2019')
GO

INSERT INTO [dbo].[Borrowed_Disks]
           ([borrowedDate]
           ,[borrowerID]
           ,[diskID]
           ,[returnedDate])
     VALUES
           ('01-18-2019'
           ,18
           ,18
           ,'02-18-2019')
GO

--Populates the Disk_Artist table

USE [disk_inventoryTH]
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (1
           ,1)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (2
           ,1)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (2
           ,6)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (3
           ,2)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (4
           ,3)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (5
           ,4)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (6
           ,5)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (7
           ,6)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (8
           ,7)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (9
           ,8)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (10
           ,9)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (11
           ,10)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (12
           ,11)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (13
           ,12)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (14
           ,13)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (15
           ,14)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (16
           ,15)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (17
           ,16)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (18
           ,17)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (19
           ,18)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (20
           ,19)
GO

INSERT INTO [dbo].[Disk_Artist]
           ([diskID]
           ,[artistID])
     VALUES
           (21
           ,20)
GO


--Query to select and display all currently Checked Out Disks

SELECT borrowerID, diskID, borrowedDate, returnedDate
FROM Borrowed_Disks
WHERE returnedDate IS NULL


--Show the disks in the database and any associated Individual artists only. Sorted by Artist Last Name, First Name & Disk Name.
SELECT diskName, releaseDate, artistFirstName, artistLastName
FROM Disk_Artist JOIN Disks ON Disks.diskID = Disk_Artist.diskID JOIN Artists ON Artists.artistID = Disk_Artist.artistID 
WHERE artistTypeID = 1
ORDER BY artistLastName, artistFirstName, diskName
go

--Creates a view called View_Individual_Artist that shows the artists’ names and not group names. 
DROP VIEW IF EXISTS View_Individual_Artist
go

CREATE VIEW View_Individual_Artist
AS
SELECT artistID, artistFirstName, artistLastName
FROM Artists
WHERE artistFirstName IS NOT NULL AND artistLastName IS NOT NULL
go

SELECT artistFirstName, artistLastName
FROM View_Individual_Artist
ORDER BY artistLastName
go

--Show the disks in the database and any associated Group artists only. Sorted by Group Name & Disk Name.
ALTER VIEW View_Individual_Artist
AS
SELECT diskName, releaseDate, artistGroupName
FROM Disk_Artist JOIN Disks ON Disks.diskID = Disk_Artist.diskID JOIN Artists ON Artists.artistID = Disk_Artist.artistID 
WHERE artistGroupName IS NOT NULL
go

SELECT *
FROM View_Individual_Artist
ORDER BY artistGroupName, diskName
go

--Show which disks have been borrowed and who borrowed them. 
--Sort by Borrower’s Last Name, then First Name, then Disk Name, then Borrowed Date, then Returned Date
SELECT diskName, borrowerFirstName, borrowerLastName, borrowedDate, returnedDate
FROM Borrowed_Disks JOIN Disks ON Disks.diskID = Borrowed_Disks.diskID JOIN Borrowers ON Borrowers.borrowerID = Borrowed_Disks.borrowerID
ORDER BY borrowerLastName, borrowerFirstName, diskName, borrowedDate, returnedDate
go

--In disk_id order, shows the number of times each disk has been borrowed.
SELECT Borrowed_Disks.diskID, diskName, COUNT(*) AS 'Times Borrowed'
FROM Borrowed_Disks JOIN Disks ON Disks.diskID = Borrowed_Disks.diskID
GROUP BY Borrowed_Disks.diskID, diskName
ORDER BY Borrowed_Disks.diskID
go

--Shows the disks outstanding or on-loan and who has each disk.
SELECT diskName, borrowedDate, returnedDate, borrowerLastName
FROM Borrowed_Disks JOIN Disks ON Disks.diskID = Borrowed_Disks.diskID JOIN Borrowers ON Borrowers.borrowerID = Borrowed_Disks.borrowerID
WHERE returnedDate IS NULL
ORDER BY diskName
go


--Creates Insert, Update, and Delete stored procedures for Artists

--Insert Artist Procedure
DROP PROC IF EXISTS sp_InsertArtist
GO

CREATE PROC sp_InsertArtist
@artistTypeID int,
@artistFirstName varchar(32) = NULL,
@artistLastName varchar(32) = NULL,
@artistGroupName varchar(32) = NULL
AS
BEGIN TRY
INSERT INTO [dbo].[Artists]
           ([artistFirstName]
           ,[artistLastName]
           ,[artistGroupName]
           ,[artistTypeID])
     VALUES
           (@artistFirstName
           ,@artistLastName
           ,@artistGroupName
           ,@artistTypeID);
END TRY
BEGIN CATCH
PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(256), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(256), ERROR_MESSAGE());
END CATCH
GO

--Example, adds Cher as Artist 21 to the table
EXEC sp_InsertArtist 1, 'Cher', NULL, NULL
GO


--Update Artist Procedure
DROP PROC IF EXISTS sp_UpdateArtist
GO

CREATE PROC sp_UpdateArtist
@artistFirstName varchar(32) = NULL,
@artistLastName varchar(32) = NULL,
@artistGroupName varchar(32) = NULL,
@artistTypeID int,
@updateTarget int
AS
BEGIN TRY
UPDATE [dbo].[Artists]
   SET [artistFirstName] = @artistFirstName
      ,[artistLastName] = @artistLastName
      ,[artistGroupName] = @artistGroupName
      ,[artistTypeID] = @artistTypeID
 WHERE artistID = @updateTarget
 END TRY
 BEGIN CATCH
PRINT 'An error occurred. Row was not updated.';
    PRINT 'Error number: ' +
        CONVERT(varchar(256), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(256), ERROR_MESSAGE());
END CATCH
GO

--Example, changes Artist 21 to a test data set
EXEC sp_UpdateArtist 'TEST', 'Testing', 'The Tests', 2, 21
GO

--Creates the DeleteArtist process
DROP PROC IF EXISTS sp_DeleteArtist
GO

CREATE PROC sp_DeleteArtist
@deleteTarget int
AS
BEGIN TRY
DELETE FROM [dbo].[Artists]
      WHERE artistID = @deleteTarget

END TRY
BEGIN CATCH
PRINT 'An error occurred. Row was not deleted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(256), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(256), ERROR_MESSAGE());
END CATCH
GO

--Example, deletes artist 21
EXEC sp_DeleteArtist 21
GO

--Creates Insert, Update, and Delete stored procedures for Borrowers

--Insert procedure for Borrowers
DROP PROC IF EXISTS sp_InsertBorrower
GO

CREATE PROC sp_InsertBorrower
@borrowerFirstName varchar(32),
@borrowerLastName varchar(32),
@borrowerPhone char(12)
AS
BEGIN TRY
INSERT INTO [dbo].[Borrowers]
           ([borrowerFirstName]
           ,[borrowerLastName]
           ,[borrowerPhone])
     VALUES
           (@borrowerFirstName
           ,@borrowerLastName
           ,@borrowerPhone)
END TRY
BEGIN CATCH
PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(256), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(256), ERROR_MESSAGE());
END CATCH
GO

--Example, inserts new borrower Inserted McBorrow
EXEC sp_InsertBorrower 'Inserted', 'McBorrow', '5555555555'
GO

--Update procedure for Borrowers
DROP PROC IF EXISTS sp_UpdateBorrower
GO

CREATE PROC sp_UpdateBorrower
@borrowerFirstName varchar(32),
@borrowerLastName varchar(32),
@borrowerPhone char(12),
@targetBorrower int
AS
BEGIN TRY
UPDATE [dbo].[Borrowers]
   SET [borrowerFirstName] = @borrowerFirstName
      ,[borrowerLastName] = @borrowerLastName
      ,[borrowerPhone] = @borrowerPhone
 WHERE borrowerID = @targetBorrower
END TRY
BEGIN CATCH
PRINT 'An error occurred. Row was not updated.';
    PRINT 'Error number: ' +
        CONVERT(varchar(256), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(256), ERROR_MESSAGE());
END CATCH
GO

--Example, Updates borrower 22 to change test data
EXEC sp_UpdateBorrower 'Updated', 'TestBorrow', '5555555556', 22
GO

--Delete procedure for Borrowers
DROP PROC IF EXISTS sp_DeleteBorrower
GO

CREATE PROC sp_DeleteBorrower
@deleteTarget int
AS
BEGIN TRY
DELETE FROM [dbo].[Borrowers]
      WHERE borrowerID = @deleteTarget
END TRY
BEGIN CATCH
PRINT 'An error occurred. Row was not deleted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(256), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(256), ERROR_MESSAGE());
END CATCH
GO

--Example, deletes borrower 22
EXEC sp_DeleteBorrower 22
GO

--Creates Insert, Update, and Delete stored procedures for Disks


--Insert procedure for Disks
DROP PROC IF EXISTS sp_InsertDisk
GO

CREATE PROC sp_InsertDisk
@genreID int,
@diskName varchar(164),
@releaseDate date,
@statusID int,
@diskTypeID int
AS
BEGIN TRY
INSERT INTO [dbo].[Disks]
           ([genreID]
           ,[diskName]
           ,[releaseDate]
           ,[statusID]
           ,[diskTypeID])
     VALUES
           (@genreID
           ,@diskName
           ,@releaseDate
           ,@statusID
           ,@diskTypeID)
END TRY
BEGIN CATCH
PRINT 'An error occurred. Row was not inserted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(256), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(256), ERROR_MESSAGE());
END CATCH
GO

--Example, Inserts new test disk
EXEC sp_InsertDisk 1, 'TESTING INSERT', '05-05-2005', 1, 1
GO

--Update procedure for Disks
DROP PROC IF EXISTS sp_UpdateDisk
GO

CREATE PROC sp_UpdateDisk
@genreID int,
@diskName varchar(164),
@releaseDate date,
@statusID int,
@diskTypeID int,
@updateTarget int
AS
BEGIN TRY
UPDATE [dbo].[Disks]
   SET [genreID] = @genreID
      ,[diskName] = @diskName
      ,[releaseDate] = @releaseDate
      ,[statusID] = @statusID
      ,[diskTypeID] = @diskTypeID
 WHERE diskID = @updateTarget
END TRY
BEGIN CATCH
PRINT 'An error occurred. Row was not updated.';
    PRINT 'Error number: ' +
        CONVERT(varchar(256), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(256), ERROR_MESSAGE());
END CATCH
GO

--Example, updates disk 23
EXEC sp_UpdateDisk 2, 'Updated Test', '09-09-2009', 2, 1, 23
GO

--Delete procedure for disks
DROP PROC IF EXISTS sp_DeleteDisk
GO

CREATE PROC sp_DeleteDisk
@deleteTarget int
AS
BEGIN TRY
DELETE FROM [dbo].[Disks]
      WHERE diskID = @deleteTarget
END TRY
BEGIN CATCH
PRINT 'An error occurred. Row was not deleted.';
    PRINT 'Error number: ' +
        CONVERT(varchar(256), ERROR_NUMBER());
    PRINT 'Error message: ' +
        CONVERT(varchar(256), ERROR_MESSAGE());
END CATCH
GO

--Example, deletes disk 23
EXEC sp_DeleteDisk 23
GO