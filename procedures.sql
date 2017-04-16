-- ORAN CAN
DELIMITER ;
DELIMITER $$

-- Sorunsuz
-- Flight number kısmını scroll list şeklinde yapalım.
DROP PROCEDURE IF EXISTS departureTimeUpdate $$

CREATE PROCEDURE departureTimeUpdate(t TIMESTAMP, num CHAR(7))
BEGIN
 	UPDATE `flights` SET `departure/arrivalTime` = t WHERE `flight_number` = num;
END $$

-- Eğer kullanıcı kayıtlı olanlardan başka bir flight girerse mesela BY1234 uçuşuna bilet alırsa
-- Öyle bir uçuş olmadığından hata veriyor.
-- Belki internet sitesini yaparken scroll list ile yapabiliriz. 
-- Kullanıcı girmez listeden uçuş seçer.
DROP PROCEDURE IF EXISTS addPassenger $$

CREATE PROCEDURE addPassenger(class CHAR(11), name CHAR(20), customer_no VARCHAR(11), age INT, isFemale BOOLEAN, flight_number CHAR(7))
BEGIN
	INSERT INTO `passengers`(`class`, `name`, `customer_no`, `age`, `isFemale`)
		VALUES (class, name, customer_no, age, isFemale);
	INSERT INTO `flies`(`customer_no`, `flight_number`)
		VALUES (customer_no, flight_number);
END $$ 

DROP PROCEDURE IF EXISTS newAirline $$

CREATE PROCEDURE newAirline(airline_code CHAR(4), airline_name CHAR(20))
BEGIN
	INSERT INTO `airlines`(`airline_code`, `airline_name`)
		VALUES (airline_code, airline_name);
END $$

-- Utility procedures to restrict query access to the back-end
-- MARK: BEGIN
CREATE PROCEDURE retrieveEmployee()
BEGIN
	SELECT *
	FROM `Employees`;
END $$

CREATE PROCEDURE retrieveRunways()
BEGIN
	SELECT DISTINCT `runway`
	FROM `Flights`;
END $$

-- MARK: END
-- ORAN CAN END
-- bngszcn

DROP PROCEDURE IF EXISTS addNewFlight $$

CREATE PROCEDURE addNewFlight( flightNumber CHAR(7), planeModel CHAR(20), tailNumber CHAR(6), gate_park CHAR(5), 
departure/arrivalTime TIMESTAMP, is_domestic BOOLEAN, flightDestination CHAR(3), flightDeparture CHAR(3), flightRunway CHAR(5), 
airlineCode CHAR(4))

BEGIN
     INSERT INTO `flights` (`flight_number`,`plane_model`,`tail_number`, `gate/park`,`departure/arrivalTime`,`isDomestic`, `destination`,`departure`,`runway`)
	 
     VALUES (flightNumber, planeModel, tailNumber, gate_park, departure/arrivalTime, is_domestic, flightDestination, flightDeparture, flightRunway)	;
     
	 INSERT INTO `belongs` (`airline_code`, `flight_number`)

	 VALUES (airlineCode, flightNumber);
	 
END $$

DROP PROCEDURE IF EXISTS changePlaneModel $$

CREATE PROCEDURE changePlaneModel(num CHAR(7), planeModel CHAR(20))
BEGIN
        UPDATE `flights` SET `plane_model` = planeModel WHERE `flight_number` = num;
END $$
-- bngszcn
-- berkyaglioglu
DROP PROCEDURE IF EXISTS addHourlyEmployee $$

CREATE PROCEDURE addHourlyEmployee(`since` DATE, `airline_code` CHAR(4), `ssn` INTEGER, `name` CHAR(20), `service_type` CHAR(20), `hourly_wages` INTEGER, `hours_worked` INTEGER)
BEGIN
	INSERT INTO `works_in`(`since`, `airline_code`, `ssn`)
	VALUES (since, airline_code, ssn);
	INSERT INTO `employees`(`ssn`, `name`, `service_type`)
	VALUES (ssn, name, service_type);
	INSERT INTO `hourly`(`hourly_wages`, `hours_worked`, `employee_ssn`)
	VALUES (hourly_wages, hours_worked, ssn);
END $$

DROP PROCEDURE IF EXISTS addContractedEmployee $$

CREATE PROCEDURE addContractedEmployee(`since` DATE, `airline_code` CHAR(4), `ssn` INTEGER, `name` CHAR(20), `service_type` CHAR(20), `contract_ID` INTEGER)
BEGIN
	INSERT INTO `works_in`(`since`, `airline_code`, `ssn`)
	VALUES (since, airline_code, ssn);
	INSERT INTO `employees`(`ssn`, `name`, `service_type`)
	VALUES (ssn, name, service_type);
	INSERT INTO `contracted`(`contract_ID`, `employee_ssn`)
	VALUES (contract_ID, ssn);
END $$

DROP PROCEDURE IF EXISTS removingEmployee $$

CREATE PROCEDURE removingEmployee(ssn INTEGER)
BEGIN
	DELETE FROM employees WHERE employees.ssn = ssn;
END $$

DROP PROCEDURE IF EXISTS cancelFlightByAdmin $$

CREATE PROCEDURE cancelFlightByAdmin(ssn INTEGER, flight_ID CHAR(7))
BEGIN
 	UPDATE flights SET flights.is_canceled = TRUE WHERE EXISTS 
	(SELECT * FROM belongs b, employees e, works_in w WHERE ssn = w.ssn AND w.airline_code = b.airline_code AND b.flight_number = flight_ID)
	AND flights.flight_number = flight_ID;
END $$

-- berkyaglioglu end

DROP PROCEDURE IF EXISTS removePassenger $$
-- Bahadır Yurtkulu Begin
-- sorunsuz
CREATE PROCEDURE removePassenger(customerNoEntered VARCHAR(11), flightNumEntered CHAR(7))
BEGIN
	DELETE FROM flies WHERE customer_no = customerNoEntered AND flight_number = flightNumEntered;
	COMMIT;
	DELETE FROM passengers
	WHERE passengers.customer_no NOT IN (SELECT customer_no FROM flies);
	COMMIT;
END $$

-- sorunsuz
DROP PROCEDURE IF EXISTS viewFlightInfo $$
-- This procedure takes customer no, flight no
-- and it shows name, customer no , flight no, dep time, destn, depr info.
CREATE PROCEDURE viewFlightInfo(cid VARCHAR(11), fid CHAR(7))
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS PF AS (SELECT passengers.name, passengers.customer_no, flies.flight_number FROM passengers, flies WHERE passengers.customer_no = flies.customer_no);
	CREATE TEMPORARY TABLE IF NOT EXISTS PFF AS (SELECT PF.name, PF.customer_no, flights.flight_number, flights.departure/arrivalTime, flights.destination,flights.departure FROM PF, flights WHERE PF.flight_number = flights.flight_number);
	SELECT * FROM PFF WHERE PFF.customer_no = cid AND PFF.flight_number = fid;
END $$

-- This procedure is to list the passengers filtered with given flight number
DROP PROCEDURE IF EXISTS listPassByFlight $$

CREATE PROCEDURE listPassByFlight (fid CHAR(7))
	BEGIN
	SELECT *
	FROM flies, passengers
	WHERE flies.flight_number = fid AND flies.customer_no = passengers.customer_no;
END $$

-- Bahadır Yurtkulu End

-- Bengusu Oneri: Add new flight'i silelim, yerine şunu koyalım : ssn ini girdiğim employee yi istediğim runway e atamak

DROP PROCEDURE IF EXISTS updateRunwayforEmployee $$

CREATE PROCEDURE updateRunwayforEmployee ( assign_runway CHAR(5), employee_ssn INTEGER)
BEGIN UPDATE `works_in` SET `ssn`= employee_ssn WHERE `airline_code` = ( SELECT `airline_code`
                                                                         FROM `airlines`
								         WHERE `airline_name` = (SELECT `airline_name`
												 FROM `belongs`
												WHERE `flight_number` = (SELECT `flight_number`
															FROM `flights`
															WHERE `runway` = assign_runway)));																														 
END$$

DROP PROCEDURE IF EXISTS countRunway;

CREATE PROCEDURE countRunway()
BEGIN
	SELECT runway, COUNT(*)
	FROM flights
	GROUP by runway;
END $$


-- bitti bengusu. 
