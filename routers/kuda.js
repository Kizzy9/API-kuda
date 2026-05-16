const express = require('express');
const router = express.Router();
const db = require('../config/db');

// GET
router.get('/', (req, res) => {
    db.query('SELECT * FROM kuda', (err, result) => {
        if (err) {
            res.status(500).json(err);
        } else {
            res.json(result);
        }
    });
});

// POST
router.post('/', (req, res) => {

    const {
        nama_kuda,
        asal_negara,
        harga,
        umur,
        kategori_id
    } = req.body;

    const sql = `
        INSERT INTO kuda
        (nama_kuda, asal_negara, harga, umur, kategori_id)
        VALUES (?, ?, ?, ?, ?)
    `;

    db.query(
        sql,
        [nama_kuda, asal_negara, harga, umur, kategori_id],
        (err, result) => {

            if (err) {
                res.status(500).json(err);
            } else {
                res.json({
                    message: 'Data kuda berhasil ditambahkan'
                });
            }

        }
    );
});

// PUT
router.put('/:id', (req, res) => {

    const {
        nama_kuda,
        asal_negara,
        harga,
        umur,
        kategori_id
    } = req.body;

    const sql = `
        UPDATE kuda
        SET
        nama_kuda = ?,
        asal_negara = ?,
        harga = ?,
        umur = ?,
        kategori_id = ?
        WHERE id = ?
    `;

    db.query(
        sql,
        [
            nama_kuda,
            asal_negara,
            harga,
            umur,
            kategori_id,
            req.params.id
        ],
        (err, result) => {

            if (err) {
                res.status(500).json(err);
            } else {
                res.json({
                    message: 'Data kuda berhasil diupdate'
                });
            }

        }
    );
});

// DELETE
router.delete('/:id', (req, res) => {

    db.query(
        'DELETE FROM kuda WHERE id = ?',
        [req.params.id],
        (err, result) => {

            if (err) {
                res.status(500).json(err);
            } else {
                res.json({
                    message: 'Data kuda berhasil dihapus'
                });
            }

        }
    );
});

module.exports = router;