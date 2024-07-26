SHOW TABLES;
DROP TABLE intitutions;
describe institutions;

INSERT INTO institutions (`name`,`description`) values
('Fundacja "Dbam o Zdrowie"','Pomoc dzieciom z ubogich rodzin.'),
('Fundacja “Dla dzieci"','Pomoc osobom znajdującym się w trudnej sytuacji życiowej.'),
('Fundacja "A kogo"','Pomoc wybudzaniu dzieci ze śpiączki.'),
('Fundacja “Bez domu”','Pomoc dla osób nie posiadających miejsca zamieszkania.');

SELECT * FROM institutions;

DELETE FROM institutions;

INSERT INTO institutions (`name`,`description`) values
                                                    ('Fundacja "Monster Energy Drink"','Pomoc dzieciom bez energii.');

ubrania, które nadają się do ponownego użycia
ubrania, do wyrzucenia
    zabawki
książki
inne

INSERT INTO categories (name) values ('ubrania, które nadają się do ponownego użycia'),('ubrania, do wyrzucenia'),('zabawki'),('książki'),('inne');