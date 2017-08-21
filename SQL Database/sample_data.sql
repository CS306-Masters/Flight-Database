USE flight_cs306;

INSERT INTO `airlines`(`airline_code`, `airline_name`) -- Official IATA codes used
	VALUES  ('TK', 'Turkish Airlines'),
			('LH', 'Lufthansa'),
			('FZ', 'Flydubai'),
			('QR', 'Qatar Airways'),
			('PC', 'Pegasus Airlines');


INSERT INTO `flights`(`flight_number`, `plane_model`, `tail_number`, `gate/park`, `departure/arrivalTime`, `isDomestic`, `departure`, `destination`, `runway`)
	VALUES  ('PC4122', 'BOEING 737-82R', 'TCAAO', '313B', '2017-03-19 18:15:00', TRUE, 'SAW', 'ADB', '06/24'),
			('TK7286', 'BOEING 737-8F2', 'TCSCL', '309B', '2017-03-19 19:10:00', TRUE, 'SAW', 'KYA', '03/17'),
			('QR242', 'AIRBUS A321', 'A7-ADS', '201A', '2017-03-19 21:15:00', FALSE, 'SAW', 'DOH', '12/34'),
			('PC320', 'AIRBUS A320', 'TCAAN', '17', '2017-03-19 14:19:00', FALSE, 'MUC', 'SAW', '06/24'), 
			('TK808', 'AIRBUS A320', 'TCJRY', '203B', '2017-03-19 21:00:00', FALSE, 'SAW', 'TLV', '03/17'), 
			('FZ753', 'BOEING 737-73H', 'A6-FDM', '22', '2017-03-19 21:12:00', FALSE, 'DXB', 'SAW', '06/24'); 

INSERT INTO `employees`(`ssn`, `name`, `service_type`)
	VALUES  ('768432514', 'John Appleseed', 'cabin cleaning'),
			('134284729', 'Fuat Dillan', 'cabin cleaning'),
			('523157523', 'Jack Denzil', 'cabin cleaning'),
			('412354687', 'September Brock', 'cabin cleaning'),
			('426478596', 'Bart Pancras', 'cabin cleaning'),
			('654532157', 'Murat Urbano', 'counter security'),
			('785651334', 'Zackary Gordie', 'counter security'),
			('254687321', 'Selin Timucin', 'baggage transport'),
			('546752347', 'Ece Asil', 'baggage transport');

INSERT INTO `passengers`(`class`, `name`, `customer_no`, `age`, `isFemale`)
	VALUES  ('ECONOMY', 'Altan Mehmed', '42342147966', '41', FALSE),
			('BUSINESS', 'Deniz Sukru', '16424324527', '27', FALSE),
			('BUSINESS', 'Ali Asil', '54652142362', '37', FALSE),
			('FIRST-CLASS', 'Ezgi Tunc', '42575632451', '29', TRUE),
			('ECONOMY', 'Feridun Kadri', '34567856472', '34', FALSE),
			('ECONOMY', 'Dilara Aydan', '45312478527', '39', TRUE),
			('BUSINESS', 'Esra Ilknur', '26542313482', '54', TRUE),
			('ECONOMY', 'Yildiz Mumtaz', '34541348979', '44', TRUE),
			('ECONOMY', 'Rukiye Cevahir', '38164287515', '44', TRUE),
			('ECONOMY', 'Cuneyt Esen', '54231462874', '61', FALSE);

INSERT INTO `belongs`(`airline_code`, `flight_number`)
	VALUES  ('PC', 'PC4122'),
			('TK', 'TK7286'),
			('QR', 'QR242'),
			('PC', 'PC320'),
			('TK', 'TK808'),
			('FZ', 'FZ753');

INSERT INTO `works_in`(`since`, `airline_code`, `ssn`)
	VALUES	('2002-08-17', 'TK', '768432514'),
			('2006-12-20', 'TK', '134284729'),
			('2005-11-03', 'PC', '523157523'),
			('2007-03-05', 'TK', '412354687'),
			('2012-08-22', 'QR', '426478596'),
			('2001-02-01', 'PC', '654532157'),
			('2015-08-19', 'PC', '785651334'),
			('2013-07-06', 'QR', '254687321'),
			('2006-10-15', 'FZ', '546752347');

INSERT INTO `flies`(`customer_no`, `flight_number`)
	VALUES  ('42342147966', 'PC4122'),
			('16424324527', 'TK808'),
			('54652142362', 'PC4122'),
			('42575632451', 'TK7286'),
			('34567856472', 'TK808'),
			('45312478527', 'FZ753'),
			('26542313482', 'QR242'),
			('34541348979', 'TK808'),
			('54231462874', 'PC320'),
			('38164287515', 'PC320');

INSERT INTO `contracted`(`contract_ID`, `employee_ssn`)
	VALUES  ('56486', '768432514'),
			('17654', '523157523'),
			('45345', '426478596'),
			('34567', '785651334'),
			('39876', '254687321'),
			('57687', '546752347');

INSERT INTO `hourly`(`hourly_wages`, `hours_worked`, `employee_ssn`)
	VALUES  ('25', '9137', '134284729'),
			('70', '2765', '412354687'),
			('20', '986', '654532157');

INSERT INTO `passaport_entry`(`passaport_ID`, `country_code`)
	VALUES  ('42342147966', 'EN'),
			('16424324527', 'FR'),
			('42575632451', 'EN'),
			('38164287515', 'IT');

INSERT INTO `turkish_entry`(`turkish_ID`)
	VALUES  ('54652142362'),
			('34567856472'),
			('45312478527'),
			('26542313482'),
			('34541348979'),
			('54231462874');
