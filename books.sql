CREATE TABLE member (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    card_number VARCHAR(20)
);


CREATE TABLE book (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    checked_out_by INTEGER REFERENCES member(id)
);


INSERT INTO member (name, card_number) VALUES
    ('Annabelle Aster', '772-93-110'),
    ('Boris Berceli', '000-00-000'),
    ('Carter Corbin', '282-09-382');
	
	
INSERT INTO book (title, author, checked_out_by) VALUES
   ('In Search of Lost Time', 'Marcel Proust', 1),
   ('Ulysses', 'James Joyce', 1),
   ('Don Quixote', 'Miguel de Cervantes', 3),
   ('Moby Dick', 'Herman Melville', NULL);
	
	
UPDATE member SET card_number = '357-15-964' WHERE id = 2;

DELETE FROM member WHERE id = 2;

SELECT * FROM member WHERE card_number = '772-93-110';

SELECT * FROM book ORDER BY title;

UPDATE book SET checked_out_by = 1 WHERE title = 'Moby Dick';

UPDATE book SET checked_out_by = NULL WHERE title = 'Ulysses';

SELECT b.title, b.author, m.name AS checked_out_to
FROM book b
LEFT JOIN member m ON b.checked_out_by = m.id;

SELECT b.title
FROM book b
JOIN member m ON b.checked_out_by = m.id
WHERE m.name = 'Annabelle Aster';

SELECT m.name, m.card_number
FROM member m
JOIN book b ON m.id = b.checked_out_by
WHERE b.author = 'Herman Melville';