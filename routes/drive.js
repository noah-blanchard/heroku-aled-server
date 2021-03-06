const fs = require('fs');
const cors = require("cors");
const readline = require('readline');
const { google } = require('googleapis');
const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser')
const { Duplex } = require('stream'); // Native Node Module 

router.use(bodyParser.json());
router.use(cors());


/* ------------------------------------------ */

// If modifying these scopes, delete token.json.
const SCOPES = ['https://www.googleapis.com/auth/drive'];
// The file token.json stores the user's access and refresh tokens, and is
// created automatically when the authorization flow completes for the first
// time.
const TOKEN_PATH = 'drive/token.json';

// Load client secrets from a local file.
fs.readFile('drive/credentials.json', (err, content) => {
    if (err) return console.log('Error loading client secret file:', err);
    // Authorize a client with credentials, then call the Google Drive API.
    authorize(JSON.parse(content), global);
});

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 * @param {Object} credentials The authorization client credentials.
 * @param {function} callback The callback to call with the authorized client.
 */
function authorize(credentials, callback) {
    const {
        client_secret,
        client_id,
        redirect_uris
    } = credentials.installed;
    const oAuth2Client = new google.auth.OAuth2(
        client_id, client_secret, redirect_uris[0]);

    // Check if we have previously stored a token.
    fs.readFile(TOKEN_PATH, (err, token) => {
        if (err) return getAccessToken(oAuth2Client, callback);
        oAuth2Client.setCredentials(JSON.parse(token));
        callback(oAuth2Client);
    });
}

/**
 * Get and store new token after prompting for user authorization, and then
 * execute the given callback with the authorized OAuth2 client.
 * @param {google.auth.OAuth2} oAuth2Client The OAuth2 client to get token for.
 * @param {getEventsCallback} callback The callback for the authorized client.
 */
function getAccessToken(oAuth2Client, callback) {
    const authUrl = oAuth2Client.generateAuthUrl({
        access_type: 'offline',
        scope: SCOPES,
    });
    console.log('Authorize this app by visiting this url:', authUrl);
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
    });
    rl.question('Enter the code from that page here: ', (code) => {
        rl.close();
        oAuth2Client.getToken(code, (err, token) => {
            if (err) return console.error('Error retrieving access token', err);
            oAuth2Client.setCredentials(token);
            // Store the token to disk for later program executions
            fs.writeFile(TOKEN_PATH, JSON.stringify(token), (err) => {
                if (err) return console.error(err);
                console.log('Token stored to', TOKEN_PATH);
            });
            callback(oAuth2Client);
        });
    });
}

function bufferToStream(myBuuffer) {
    let tmp = new Duplex();
    tmp.push(myBuuffer);
    tmp.push(null);
    return tmp;
}


/* ------------------------------------------ */

function global(auth) {

    router.post("/", (req, res) => {
        const file = req.files.file;
        const file_name = req.body.file_name || "unknown";
        const parent = req.body.parent || "1IFLwhJtaJB435kvoiHqkPMhXJs38wy8A";

        if (!req.files || !req.files.file || Object.keys(req.files).length === 0) {
            res.send("Erreur: l'envoie du fichier ?? ??chou??.");
            return;
        }

        const drive = google.drive({ version: 'v3', auth });
        let fileMetadata = { 'name': file_name, parents: [parent] };
        let media = { body: bufferToStream(file.data)};
        drive.files.create({ resource: fileMetadata, media: media, fields: 'id' }, (err, file) => {
            if (err) res.send(err);
            else res.send(file.data.id);
        });
    })
}

module.exports = router;