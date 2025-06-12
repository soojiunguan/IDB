CREATE DATABASE IDB_Assignment_G16;

Use IDB_Assignment_G16;

CREATE TABLE Publisher
(Publisher_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Name NVARCHAR(50),
Phone_Num NVARCHAR(50),
Address NVARCHAR(100));

INSERT INTO Publisher VALUES
('P0001', 'Faber and Faber', '+4402079273800', 'Bloomsbury House, 74-77 Great Russell Street, London, WC1B 3DA'),
('P0002', 'Macmillan', '+6463075151', '175 Fifth Avenue, New York, NY 10010, USA'),
('P0003', 'Penguin', '+442070628940', 'One Embassy Gardens, 8 Viaduct Gardens, London, SW11 7BW'),
('P0004', 'Anchor', '+490406559920', 'Hermannstal 119 k, 22119 Hamburg'),
('P0005', 'Simon & Schuster', '+8455061949', '1230 Avenue of the Americas, New York, NY 10020');

SELECT * FROM Publisher;

CREATE TABLE Book
(Book_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Publisher_ID NVARCHAR(50) FOREIGN KEY REFERENCES Publisher(Publisher_ID),
ISBN NVARCHAR(50),
Title NVARCHAR(50),
Unit_Price_RM DECIMAL(10,2),
Stock_Quantity INTEGER,
Author NVARCHAR(50),
Description NVARCHAR(1000));

INSERT INTO Book VALUES
('B0008', 'P0002', '9798571981472', 'Heart Bones', '50.80', 20, 'Colleen Hoover', 'A story of a women who embarks on a spontaneous road trip with a stranger to escape her troubled life and discovers unexpected love along the way.'),
('B0879', 'P0002', '9788467050455', 'The Hating Game', '46.90', 16, 'Sally Thorne', 'Love-hate relationship between two co-workers at a publishing company who compete for the same promotion while navigating their growing attraction to each other.'),
('B0945', 'P0004', '9780349433448', 'The Fine Print', '60.20', 4, 'Lauren Asher', 'A washed-up true crime writer who becomes embroiled in a dangerous game of cat-and-mouse with a serial killer after receiving a mysterious manuscript.'),
('B0182', 'P0003', '9780747532699', 'Harry Potter ', '69.90', 2, 'J.K Rowling', 'The chronicle life of a young wizard at Hogwarts battling against the dark wizard the uncover the truth of Harry’s past.'),
('B0293', 'P0001', '9780062024039', 'Norwegian Wood', '39.90', 23,'Haruki Murakami', 'A novel that explores themes of love, loss, and mental illness through the story of a college student in 1960s Tokyo.'),
('B0470', 'P0001', '9780142414934', 'The Chronicles of Narnia', '35.70', 10, 'C. S. Lewis', 'Adventure of siblings into a magical world where they encounter talking animals, mythical creatures, and battle against evil forces.'),
('B0091', 'P0005', '9786050929997', 'The Hunger Games', '65.00', 8, 'Suzanne Collins', 'A novel that follows a young girls journey to survive in a televised fight to the death between teenagers from different districts.'),
('B0801', 'P0002', '9781780221359', 'Gone Girl', '20.50', 15, 'Gillian Flynn', 'A novel that explores the dark secrets and twisted nature of a troubled marriage.');

CREATE TABLE Genre
(Genre_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Genre NVARCHAR(50));

INSERT INTO Genre VALUES
('G001', 'Young Adult'),
('G002', 'Romance'),
('G003', 'Thriller'),
('G004', 'Sci-Fi'),
('G005', 'Adventurous'),
('G006', 'Poetry'),
('G007', 'Fantasy'),
('G008', 'Dystopian');

CREATE TABLE Book_Genre_Bridge
(Gen_Comb_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Book_ID NVARCHAR(50) FOREIGN KEY REFERENCES Book(Book_ID),
Genre_ID NVARCHAR(50) FOREIGN KEY REFERENCES Genre (Genre_ID));

INSERT INTO Book_Genre_Bridge VALUES
('GC0001', 'B0008', 'G001'),
('GC0002', 'B0008', 'G002'),
('GC0003', 'B0879', 'G002'),
('GC0004', 'B0945', 'G003'),
('GC0005', 'B0182', 'G005'),
('GC0006', 'B0182', 'G007'),
('GC0007', 'B0293', 'G006'),
('GC0008', 'B0470', 'G005'),
('GC0009', 'B0091', 'G007'),
('GC0010', 'B0801', 'G003'),
('GC0011', 'B0008', 'G003');

CREATE TABLE Bookstore_Order
(BSOrder_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Date DATE);

INSERT INTO Bookstore_Order VALUES
('BS0001', '13 December 2022'),
('BS0002', '30 December 2022'),
('BS0003', '4 January 2023'),
('BS0004', '16 January 2023'),
('BS0005', '20 January 2023'),
('BS0006', '7 February 2023'),
('BS0007', '14 February 2023'),
('BS0008', '28 February 2023');

SELECT * FROM Bookstore_Order

CREATE TABLE Book_BSOrder_Bridge
(Restock_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Book_ID NVARCHAR(50) FOREIGN KEY REFERENCES Book(Book_ID),
BSOrder_ID NVARCHAR(50) FOREIGN KEY REFERENCES Bookstore_Order(BSOrder_ID),
Quantity INTEGER);

INSERT INTO Book_BSOrder_Bridge VALUES
('RS0001', 'B0008', 'BS0001', 11),
('RS0002', 'B0879', 'BS0001', 17),
('RS0003', 'B0879', 'BS0002', 2),
('RS0004', 'B0945', 'BS0003', 9),
('RS0005', 'B0182', 'BS0004', 5),
('RS0006', 'B0293', 'BS0005', 24),
('RS0007', 'B0470', 'BS0006', 11),
('RS0008', 'B0091', 'BS0007', 8),
('RS0009', 'B0008', 'BS0008', 11),
('RS0010', 'B0801', 'BS0008', 16);

SELECT * FROM Book_BSOrder_Bridge

CREATE TABLE Member 
(Member_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Name NVARCHAR(50),
DOB DATE,
Phone_Num NVARCHAR(50),
Email NVARCHAR(50),
Delivery_Add NVARCHAR(100),
Acc_Password NVARCHAR(50));
 
INSERT INTO Member VALUES
('MEM0000152', 'Jimmy Burgess', '31 January 2000', '013-3383200', 'jimmyburgess@gmail.com', 'No. 42C, Batu 10 1/2, Jalan Cheras Perdana', 'Jimmy0031'),
('MEM0000212', 'Chris Lee', '19 August 1998', '018-5546670', 'chrislee@gmail.com', 'No. 5 Jalan Technologi, Kuala Lumpur', 'Chrislee1998'),
('MEM0000227', 'Alex Wong', '30 April 1990', '017-9273319', 'alexw@gmail.com', 'No. 7 Jalan Ipoh, Kuala Lumpur', 'Alexx1990'),
('MEM0000230', 'Aisha', '24 May 1994', '018-2188113', 'aisha24@gmail.com', 'No. 55 Jalan Temenggung, Selangor', 'Aisha9423'),
('MEM0000235', 'Dylan Tan', '17 May 1992', '012-2833409', 'dtan17@gmail.com', 'No. 66 Jalan Helang, Kuala Lumpur', 'Dylan1792'),
('MEM0000341', 'Michael', '6 March 1987', '018-2199250', 'mike@gmail.com', 'No. 24 Jalan Bangsar, Kuala Lumpur', 'Mikeee1987'),
('MEM0000373', 'Michelle', '7 October 1993', '016-9224421', 'michelleee@gmail.com', 'No. 56B, Jalan Damansara, Kuala Lumpur', 'Michelle0793'),
('MEM0000444', 'John Kuan', '12 December 2001', '017-5599174', 'johnk1201@gmail.com', 'No. 22, Jalan Impi, Kuala Lumpur', 'JKuan1212');

CREATE TABLE Payment 
(Payment_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Member_ID NVARCHAR(50) FOREIGN KEY REFERENCES Member(Member_ID),
Card_Type NVARCHAR(50),
Card_Num NVARCHAR(50),
Card_Exp NVARCHAR(50),
CVV NVARCHAR(20));
 
INSERT INTO Payment VALUES
('PA0001', 'MEM0000152', 'Maybank', '4000322275549880', '10/23', '555'),
('PA0002', 'MEM0000212', 'Public Bank', '4392926383839243', '02/24', '472'),
('PA0003', 'MEM0000227', 'Maybank', '4823002817739281', '06/23', '153'),
('PA0004', 'MEM0000230', 'Ambank', '3729288255202926', '05/24', '280'),
('PA0005', 'MEM0000235', 'Maybank', '2837282928362717', '12/23', '361'),
('PA0006', 'MEM0000341', 'Standard Chartered Bank', '4729282666278292', '10/24', '619'),
('PA0007', 'MEM0000373', 'Bank Islam', '2926728267100392', '06/24', '738'),
('PA0008', 'MEM0000444', 'CIMB Bank', '4329777540612938', '09/23', '891');

CREATE TABLE Shopping_Cart
(Cart_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Member_ID NVARCHAR(50) FOREIGN KEY REFERENCES Member(Member_ID),
Book_ID NVARCHAR(50) FOREIGN KEY REFERENCES Book(Book_ID),
Quantity INTEGER,
Status NVARCHAR(50));
 
INSERT INTO Shopping_Cart VALUES
('CA0001', 'MEM0000152', 'B0008', 2, 'Checked out'),
('CA0002', 'MEM0000152', 'B0879', 3, 'Checked out'),
('CA0003', 'MEM0000152', 'B0945', 2, 'Checked out'),
('CA0004', 'MEM0000212', 'B0293', 1, 'Checked out'),
('CA0005', 'MEM0000227', 'B0945', 2, 'Checked out'),
('CA0006', 'MEM0000227', 'B0801', 1, 'Checked out'),
('CA0007', 'MEM0000373', 'B0182', 1, 'Checked out'),
('CA0008', 'MEM0000341', 'B0470', 1, 'Checked out'),
('CA0009', 'MEM0000341', 'B0945', 1, 'Checked out'),
('CA0010', 'MEM0000341', 'B0182', 2, 'Checked out'),
('CA0011', 'MEM0000444', 'B0091', 1, 'Havent check out'),
('CA0012', 'MEM0000444', 'B0293', 2, 'Havent check out'),
('CA0013', 'MEM0000152', 'B0182', 1, 'Checked out'),
('CA0014', 'MEM0000152', 'B0293', 1, 'Checked out');

CREATE TABLE Member_order 
(MBOrder_Num NVARCHAR(50) NOT NULL PRIMARY KEY,
Date DATE,
Status NVARCHAR(50), 
Delivery_Add NVARCHAR(100));
 
INSERT INTO Member_order VALUES
('C003871', '2023-01-29', 'Processing', 'No. 42C, Batu 10 1/2, Jalan Cheras Perdana'),
('C002368', '2022-12-12', 'Delivered', 'No. 5 Jalan Technologi, Kuala Lumpur'),
('C002312', '2022-12-05', 'Delivered', 'No. 7 Jalan Ipoh, Kuala Lumpur'),
('C000461', '2022-08-20', 'Delivered', 'No. 56B, Jalan Damansara, Kuala Lumpur'),
('C001956', '2022-10-20', 'Delivered', 'No. 24 Jalan Bangsar, Kuala Lumpur'),
('C001999', '11 November 2022', 'Delivered', 'No. 42C, Batu 10 1/2, Jalan Cheras Perdana'),
('C001732', '15 September 2022', 'Delivered', 'No. 42C, Batu 10 1/2, Jalan Cheras Perdana');

CREATE TABLE Review
(Review_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
MBOrder_Num NVARCHAR(50) FOREIGN KEY REFERENCES Member_order(MBOrder_Num),
Description NVARCHAR(300));

INSERT INTO Review VALUES
('RE0001', 'C003871', 'The staff at the bookstore were helpful and friendly'),
('RE0002', 'C002368', 'Impressed by the variety of books available at the store'),
('RE0003', 'C002312', 'The store was well-organized and easy to navigate'),
('RE0004', 'C000461', 'My book arrived on time and in excellent condition'),
('RE0005', 'C001956', 'I appreciate that the delivery service was eco-friendly');

CREATE TABLE Rating
(Rating_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
MBOrder_Num NVARCHAR(50) FOREIGN KEY REFERENCES Member_order(MBOrder_Num),
Book_ID NVARCHAR(50) FOREIGN KEY REFERENCES Book(Book_ID),
Score INTEGER,
Comment NVARCHAR(50));

INSERT INTO Rating VALUES
('R0001', 'C002368', 'B0293', 7, 'Recommended'),
('R0002', 'C002312', 'B0945', 5, 'Engaging and exciting'),
('R0003', 'C002312', 'B0801', 8, 'It was a great read'),
('R0004', 'C000461', 'B0182', 6, 'The ending caught me by surprise'),
('R0005', 'C001956', 'B0470', 10, 'Disappointed with the sad ending'),
('R0006', 'C001956', 'B0945', 7, 'Nice book'),
('R0007', 'C001956', 'B0182', 3, 'Bad ending');

CREATE TABLE Member_order_detail 
(Detail_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Cart_ID NVARCHAR(50) FOREIGN KEY REFERENCES Shopping_cart(Cart_ID),
Line_Total DECIMAL(10,2),
MBOrder_Num NVARCHAR(50) FOREIGN KEY REFERENCES Member_order(MBOrder_Num));

INSERT INTO Member_order_detail VALUES
('D0001', 'CA0001', '101.60', 'C003871'),
('D0002', 'CA0002', '140.70', 'C003871'),
('D0003', 'CA0003', '120.40', 'C003871'),
('D0004', 'CA0004', '39.90', 'C002368'),
('D0005', 'CA0005', '120.40', 'C002312'),
('D0006', 'CA0006', '20.50', 'C002312'),
('D0007', 'CA0007', '69.90', 'C000461'),
('D0008', 'CA0008', '35.70', 'C001956'),
('D0009', 'CA0009', '60.20', 'C001956'),
('D0010', 'CA0010', '139.80', 'C001956'),
('D0011', 'CA0013', '69.90', 'C001999'),
('D0012', 'CA0014', '39.90', 'C001732');

--iv. Find the total number of feedbacks per member. Show member id, member name, and total number of feedbacks per member.
SELECT Member.Member_ID, Member.Name, COUNT(Review.Review_ID) AS TotalNum_Review 
FROM Review JOIN Member_order_detail ON Review.MBOrder_Num = Member_order_detail.MBOrder_Num 
JOIN Shopping_Cart ON Shopping_Cart.Cart_ID = Member_order_detail.Cart_ID 
RIGHT JOIN Member ON Member.Member_ID = Shopping_Cart.Member_ID
GROUP BY Member.Member_ID, Member.Name ORDER BY TotalNum_Review DESC;

--v. Find the publisher who published the most number of books.
SELECT Publisher.Publisher_ID, Publisher.Name, COUNT(Book.Book_ID) as PublishedBook_Num
FROM Publisher JOIN Book ON Publisher.Publisher_ID = Book.Publisher_ID
GROUP BY Publisher.Publisher_ID, Publisher.Name 
HAVING COUNT(Book.Book_ID) = (SELECT MAX(BookCount)
FROM (SELECT COUNT(Book.Book_ID) AS BookCount 
FROM Publisher JOIN Book ON Publisher.Publisher_ID = Book.Publisher_ID 
GROUP BY Publisher.Publisher_ID) AS PublishedBook_Num);

--vi. Find the total number of books ordered by store manager from each publisher.
Select Publisher.Publisher_ID, Publisher.Name, SUM(Book_BSOrder_Bridge.Quantity) AS TotalNum_OrderedBook
FROM Bookstore_Order JOIN Book_BSOrder_Bridge ON Bookstore_Order.BSOrder_ID = Book_BSOrder_Bridge.BSOrder_ID
JOIN Book ON Book_BSOrder_Bridge.Book_ID = Book.Book_ID 
JOIN Publisher ON Book.Publisher_ID = Publisher.Publisher_ID
GROUP BY Publisher.Publisher_ID, Publisher.Name ORDER BY TotalNum_OrderedBook DESC;

--SHOW BOOKS THAT HAVE MORE THAN 2 GENRE
SELECT Book.Book_ID, Book.Title, Count(Book_Genre_Bridge.Book_ID) AS GenreCount
FROM Book JOIN Book_Genre_Bridge ON Book.Book_ID =  Book_Genre_Bridge.Book_ID
GROUP BY Book.Book_ID,Book.Title HAVING (Count(Book_Genre_Bridge.Book_ID)>2);