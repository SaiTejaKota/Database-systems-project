--Inser statements

INSERT INTO Utilities (UtilityID, ApartmentID, UtilityType, DueDate, Amount, PaymentStatus)
VALUES
(9, 101, 'Electricity', '2022-01-10', 80.00, 'Unpaid');

INSERT INTO MaintenanceRequest (RequestID, TenantID, StaffID, ApartmentID, RequestDate, Description, Status)
VALUES
(1, 1, 2, 101, '2024-02-01', 'window broken', 'Completed');

--Update statements

UPDATE Tenants SET ContactNumber='312-951-6754' Where TenantID=1;

UPDATE Lease SET MonthlyRent =1100.00 where ApartmentID=301;

--Delete statement

DELETE from Utilities where UtilityID=5;

--Simple select statements

SELECT * from Utilities where PaymentStatus='Unpaid';

--Join statements

SELECT Tenants.FirstName, Tenants.LastName, Lease.ApartmentID, Lease.MonthlyRent from Tenants inner join lease on Tenants.TenantID=lease.TenantID;

SELECT MaintenanceStaff.FirstName, maintenancestaff.lastname, MaintenanceRequest.RequestID, MaintenanceRequest.Status 
from maintenancestaff inner join maintenanceRequest on maintenancestaff.staffid=maintenancerequest.staffid;

summary

Select count(*) as totalUnpaid from utilities where Paymentstatus='Unpaid';

select utilitytype, sum(amount), paymentstatus from utilities where paymentstatus='Unpaid' group by utilitytype;

--multi table 

SELECT Tenants.TenantID, Tenants.FirstName, Tenants.LastName, Lease.LeaseStartDate, Lease.LeaseEndDate,
Apartment.ApartmentID, Apartment.Area, Apartment.Bedrooms,Apartment.Bathrooms,
Apartment.RentAmount FROM Tenants INNER JOIN Lease ON Tenants.TenantID = Lease.TenantID
INNER JOIN Apartment ON Lease.ApartmentID = Apartment.ApartmentID;

--choice

select * from apartment where occupancystatus='Vacant' order by rentamount;
