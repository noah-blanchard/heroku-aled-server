const nodemailer = require("nodemailer");
const { google } = require('googleapis');

const mail = "plateforme.document@gmail.com";
const clientId = "628528040612-hd1k7diuhk0hb55tvqslhekfo6mklmfo.apps.googleusercontent.com";
const clientSecret = "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";
const refreshToken = "1//04Y8KCVgrpZmECgYIARAAGAQSNwF-L9IryDq_xdCk1BijV6dAUlOcFMh06UNELdAQV24CYOmsIt6t8DPKBRbOVZTtkjP3YKIpx4w";
const OAuth2 = google.auth.OAuth2;

const oauth2Client = new OAuth2(
  clientId, // ClientID
  clientSecret, // Client Secret
  "https://developers.google.com/oauthplayground" // Redirect URL
);


oauth2Client.setCredentials({
  refresh_token: refreshToken
});

const accessToken = oauth2Client.getAccessToken()

exports.transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
       type: "OAuth2",
       user: mail, 
       clientId: clientId,
       clientSecret: clientSecret,
       refreshToken: refreshToken,
       accessToken: accessToken
  },
  tls: {
      rejectUnauthorized: false
    }
});

/*
// Créer un transporteur
exports.transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: "ptut.testmail@gmail.com",
        pass: "ptuttestmail?"
    },
});
*/