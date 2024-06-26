-- Stored Procedure untuk memasukkan data baru pada sebuah tabel:
DELIMITER //

CREATE PROCEDURE InsertData(IN p_name VARCHAR(255), IN p_age INT, OUT p_result VARCHAR(255))
BEGIN
    INSERT INTO your_table_name (NAME, age) VALUES (p_name, p_age);
    SET p_result = 'Data inserted successfully';
END //

-- Stored Procedure untuk memperbaharui data pada sebuah tabel:
DELIMITER ;

CALL InsertData('John Doe', 30, @result);
SELECT @result AS Result;


SHOW DATABASES;
SHOW TABLES;


-- Stored Procedure untuk menghapus data pada sebuah tabel:
DELIMITER //

CREATE PROCEDURE UpdateData(IN p_id INT, IN p_new_name VARCHAR(255), IN p_new_age INT, OUT p_result VARCHAR(255))
BEGIN
    UPDATE your_table_name SET NAME = p_new_name, age = p_new_age WHERE id = p_id;
    SET p_result = CONCAT('Data with id ', p_id, ' updated successfully');
END //

DELIMITER ;

-- Stored Procedure untuk menghapus data pada sebuah tabel:
DELIMITER //

CREATE PROCEDURE DeleteData(IN p_id INT, OUT p_result VARCHAR(255))
BEGIN
    DELETE FROM your_table_name WHERE id = p_id;
    SET p_result = CONCAT('Data with id ', p_id, ' deleted successfully');
END //

-- Contoh penggunaan:
DELIMITER ;

CALL InsertData('John', 30, @result);
SELECT @result;

CALL UpdateData(1, 'Jane', 35, @result);
SELECT @result;

CALL DeleteData(1, @result);
SELECT @result;