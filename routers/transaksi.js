const express = require('express');
const router = express.Router();
const db = require('../config/db');


// =========================
// GET semua transaksi
// =========================
router.get('/', (req, res) => {

    const sql = `
        SELECT * FROM transaksi
    `;

    db.query(sql, (err, result) => {

        if (err) {
            res.status(500).json(err);
        } else {
            res.json(result);
        }

    });

});


// =========================
// POST tambah transaksi
// =========================
router.post('/', (req, res) => {

    const {
        pelanggan_id,
        tanggal_transaksi,
        total_harga
    } = req.body;

    const sql = `
        INSERT INTO transaksi
        (pelanggan_id, tanggal_transaksi, total_harga)
        VALUES (?, ?, ?)
    `;

    db.query(
        sql,
        [pelanggan_id, tanggal_transaksi, total_harga],
        (err, result) => {

            if (err) {
                res.status(500).json(err);
            } else {
                res.json({
                    message: 'Transaksi berhasil ditambahkan'
                });
            }

        }
    );

});

module.exports = router;