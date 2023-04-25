CREATE TABLE Banks (
    BankCode INT PRIMARY KEY,
    BankName TEXT,
    LegalAddress TEXT
);

CREATE TABLE ATMs (
    ATMNumber INT PRIMARY KEY,
    ATMAddress TEXT,
    BankCode INT,
    FOREIGN KEY (BankCode) REFERENCES Banks(BankCode)
);

CREATE TABLE Clients (
    CardNumber INT PRIMARY KEY,
    FullName TEXT,
    ClientAddress TEXT,
    BankCode INT,
    FOREIGN KEY (BankCode) REFERENCES Banks(BankCode)
);

CREATE TABLE Operations (
    OperationID INT PRIMARY KEY,
    CardNumber INT,
    ATMNumber INT,
    Date DATE,
    Time TIME,
    Commission BOOLEAN,
    WithdrawalAmount DECIMAL(10,2),
    FOREIGN KEY (CardNumber) REFERENCES Clients(CardNumber),
    FOREIGN KEY (ATMNumber) REFERENCES ATMs(ATMNumber)
);


-- Banks
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (1, 'Bank A', 'Address A');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (2, 'Bank B', 'Address B');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (3, 'Bank C', 'Address C');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (4, 'Bank D', 'Address D');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (5, 'Bank E', 'Address E');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (6, 'Bank F', 'Address F');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (7, 'Bank G', 'Address G');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (8, 'Bank H', 'Address H');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (9, 'Bank I', 'Address I');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (10, 'Bank J', 'Address J');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (11, 'Bank K', 'Address K');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (12, 'Bank L', 'Address L');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (13, 'Bank M', 'Address M');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (14, 'Bank N', 'Address N');
INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (15, 'Bank O', 'Address O');

-- ATMs
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (1, 'ATM Address 1', 1);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (2, 'ATM Address 2', 2);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (3, 'ATM Address 3', 3);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (4, 'ATM Address 4', 4);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (5, 'ATM Address 5', 5);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (6, 'ATM Address 6', 6);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (7, 'ATM Address 7', 7);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (8, 'ATM Address 8', 8);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (9, 'ATM Address 9', 9);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (10, 'ATM Address 10', 10);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (11, 'ATM Address 11', 11);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (12, 'ATM Address 12', 12);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (13, 'ATM Address 13', 13);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (14, 'ATM Address 14', 14);
INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (15, 'ATM Address 15', 15);


-- Add more rows if needed

-- Add more rows as needed

-- Clients
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (1, 'Client 1', 'Client Address 1', 1);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (2, 'Client 2', 'Client Address 2', 2);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (3, 'Client 3', 'Client Address 3', 1);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (4, 'Client 4', 'Client Address 4', 2);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (5, 'Client 5', 'Client Address 5', 3);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (6, 'Client 6', 'Client Address 6', 4);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (7, 'Client 7', 'Client Address 7', 4);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (8, 'Client 8', 'Client Address 8', 5);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (9, 'Client 9', 'Client Address 9', 5);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (10, 'Client 10', 'Client Address 10', 3);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (11, 'Client 11', 'Client Address 11', 4);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (12, 'Client 12', 'Client Address 12', 4);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (13, 'Client 13', 'Client Address 13', 5);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (14, 'Client 14', 'Client Address 14', 5);
INSERT INTO Clients (CardNumber, FullName, ClientAddress, BankCode) VALUES (15, 'Client 15', 'Client Address 15', 3);

-- Add more rows if needed
-- Add more rows as needed

-- Operations
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (1, 1, 1, '2023-01-01', '09:00:00', 0, 100.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (2, 1, 2, '2023-01-02', '10:00:00', 1, 200.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (3, 2, 1, '2023-01-03', '11:00:00', 1, 300.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (4, 2, 2, '2023-01-04', '12:00:00', 0, 400.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (5, 3, 3, '2023-01-05', '13:00:00', 1, 500.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (6, 4, 4, '2023-01-06', '14:00:00', 0, 600.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (7, 4, 5, '2023-01-07', '15:00:00', 1, 700.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (8, 5, 6, '2023-01-08', '16:00:00', 0, 800.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (9, 5, 7, '2023-01-09', '17:00:00', 1, 900.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (10, 6, 8, '2023-01-10', '18:00:00', 1, 1000.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (11, 4, 4, '2023-01-06', '19:00:00', 0, 600.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (12, 4, 5, '2023-01-07', '20:00:00', 1, 700.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (13, 5, 6, '2023-01-08', '21:00:00', 0, 800.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (14, 5, 7, '2023-01-09', '22:00:00', 1, 900.00);
INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (15, 6, 8, '2023-01-10', '23:00:00', 1, 1000.00);
