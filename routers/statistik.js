const express = require('express');
const router = express.Router();
const db = require('../config/db');


// =========================
// Statistik transaksi
// =========================
router.get('/', (req, res) => {

    const sql = `
        SELECT
        COUNT(*) AS total_transaksi,
        SUM(total_harga) AS total_penjualan
        FROM transaksi
    `;

    db.query(sql, (err, result) => {

        if (err) {
            res.status(500).json(err);
        } else {
            res.json(result);
        }

    });

});

module.exports = router;