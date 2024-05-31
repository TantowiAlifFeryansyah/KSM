/*
2.Buat stored procedure pada mysql untuk mengekstrak isi dari ksm_kurs_pajak menjadi 1 table kurs pajak
*/


	-- Membuat tabel kurs_pajak
CREATE TABLE kurs_pajak (
    id_ksm_kurs_pajak INT,
    kurs_rate DECIMAL(20, 4),
    tgl DATE,
    curr_id INT
);


	-- Membuat Stored Procedure
CREATE PROCEDURE extract_kurs_pajak()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Hapus data dari kurs_pajak jika ada
    TRUNCATE TABLE kurs_pajak;

    -- Masukan data dari ksm_kurs_pajak ke kurs_pajak
    INSERT INTO kurs_pajak (id_ksm_kurs_pajak, kurs_rate, tgl, curr_id)
    SELECT id, kurs_rate, start_date, curr_id
    FROM ksm_kurs_pajak;

    COMMIT;
END //

---------------------------------------------------------------------------------------

	-- Menjalankan Stored Procedure
CALL classicmodels.extract_kurs_pajak();

