/*
 3. Buatlah function pada mysql untuk mencari tanggal terkecil dari string yang ter-concatenated seperti berikut
'2016-04-22, 2016-07-20, 2015-03-29, 2023-07-03'
apabila fungsi tersebut dipanggil maka output yang dihasilkan adalah 2015-03-29
 */

    -- Membuat function
CREATE FUNCTION find_min_date(input_str VARCHAR(255)) RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE min_date DATE;
    DECLARE curr_date DATE;

    SET min_date = NULL;

    -- Mengambil setiap tanggal dalam string
    WHILE LENGTH(input_str) > 0 DO
        -- Ambil tanggal pertama
        SET curr_date = SUBSTRING_INDEX(input_str, ',', 1);
        -- Potong tanggal yang sudah diambil
        SET input_str = TRIM(SUBSTRING(input_str, LENGTH(curr_date) + 2));

        -- Periksa apakah curr_date adalah tanggal terkecil
        IF min_date IS NULL OR curr_date < min_date THEN
            SET min_date = curr_date;
        END IF;
    END WHILE;

    -- Kembalikan tanggal terkecil
    RETURN min_date;
END

---------------------------------------------------------------------------------------

    -- Menjalankan function
SELECT find_min_date('2016-04-22, 2016-07-20, 2015-03-29, 2023-07-03');





