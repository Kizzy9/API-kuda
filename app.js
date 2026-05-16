const express = require('express');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(express.json());

// Route kuda
app.use('/kuda', require('./routers/kuda'));

app.get('/', (req, res) => {
    res.send('API Peternakan Kuda Berjalan');
});

app.listen(3000, () => {
    console.log('Server berjalan di port 3000');
});