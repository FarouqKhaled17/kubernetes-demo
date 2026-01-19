import express from 'express';
import dotenv from 'dotenv';

dotenv.config();
const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.json({
        message: "Hello from Kubernetes Demo App!",
        server: process.env.SERVER_NAME || "Unknown Server",
        pod: process.env.POD_NAME || "Unknown Pod",
        timestamp: new Date().toISOString()
    })
})

app.get("/health", (req, res) => {
    res.status(200).send("OK");
})

app.get("/ready", (req, res) => {
    res.status(200).send("OK");
})

app.listen(port, () => {
    console.log(`App is running on port ${port}`);
})