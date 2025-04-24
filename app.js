const express = require('express');
const mysql = require('mysql2');
const multer = require('multer');
const path = require('path');
const bodyParser = require('body-parser');
const fs = require('fs');

const app = express();
const port = 3000;

// MySQL Connection Setup
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'keerthana49',  // Change this to your MySQL password
    database: 'facultyResearch'
});

connection.connect((err) => {
    if (err) {
        console.error("Database connection failed:", err);
    } else {
        console.log("Connected to MySQL!");
    }
});

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

// Ensure 'uploads' folder exists
const uploadDir = 'uploads';
if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir);
}

// Serve uploaded files
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// File Upload Configuration
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage });

// Upload Research OR Publication
app.post('/upload', upload.single('file'), (req, res) => {
    if (!req.file) {
        return res.status(400).send('No file uploaded.');
    }

    let { title, abstract, facultyName, department, type } = req.body;

    // Normalize spaces and lowercase faculty name for consistency
    facultyName = facultyName.replace(/\s+/g, ' ').trim().toLowerCase();

    const filePath = `/uploads/${req.file.filename}`;

    let query;
    if (type === 'research') {
        query = `INSERT INTO researches (title, abstract, facultyName, filePath, department) VALUES (?, ?, ?, ?, ?)`;
    } else {
        query = `INSERT INTO publications3 (title, abstract, facultyName, filePath, department) VALUES (?, ?, ?, ?, ?)`;
    }

    connection.query(query, [title, abstract, facultyName, filePath, department], (err) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Error uploading file.');
        }
        res.send(`${type} uploaded successfully!`);
    });
});

// Search Only Researches (for Student Portal)
app.get('/searchResearch', (req, res) => {
    let { facultyName } = req.query;

    if (!facultyName) {
        return res.status(400).send("Faculty name is required.");
    }

    facultyName = facultyName.replace(/\s+/g, ' ').trim().toLowerCase();

    const query = `SELECT title, filePath FROM researches WHERE LOWER(REPLACE(facultyName, ' ', '')) LIKE LOWER(REPLACE(?, ' ', ''))`;
    connection.query(query, [facultyName], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Error fetching research data.');
        }
        res.json(results);
    });
});

// Search Only Publications (for Student Portal)
app.get('/searchPublication', (req, res) => {
    let { facultyName } = req.query;

    if (!facultyName) {
        return res.status(400).send("Faculty name is required.");
    }

    facultyName = facultyName.replace(/\s+/g, ' ').trim().toLowerCase();

    const query = `SELECT title, filePath FROM publications3 WHERE LOWER(REPLACE(facultyName, ' ', '')) LIKE LOWER(REPLACE(?, ' ', ''))`;
    connection.query(query, [facultyName], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Error fetching publication data.');
        }
        res.json(results);
    });
});

// Search Faculty (for Faculty Portal, returns both Research & Publications)
app.get('/searchFaculty', (req, res) => {
    let { facultyName } = req.query;

    if (!facultyName) {
        return res.status(400).send("Faculty name is required.");
    }

    // Normalize name (remove extra spaces & make case insensitive)
    facultyName = facultyName.replace(/\s+/g, ' ').trim().toLowerCase();

    const query = `
        (SELECT title, 'publication' AS type, filePath FROM publications3 WHERE LOWER(REPLACE(facultyName, ' ', '')) LIKE LOWER(REPLACE(?, ' ', '')))
        UNION
        (SELECT title, 'research' AS type, filePath FROM researches WHERE LOWER(REPLACE(facultyName, ' ', '')) LIKE LOWER(REPLACE(?, ' ', '')))
    `;

    connection.query(query, [facultyName, facultyName], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Error fetching faculty details.');
        }
        res.json(results);
    });
});

// Start Server
app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
