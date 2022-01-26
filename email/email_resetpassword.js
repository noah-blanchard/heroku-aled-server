const emailConfig = require("./email_config.js");

exports.sendResetPasswordMail = (to, id) => {
    const url = `http://localhost:3000/resetpassword/${id}`;

    let mailOptions = {
        from: 'ptut.testmail@gmail.com',
        to: to,
        subject: "Réinitialisation de mot de passe ALED",
        html: `<body>
        <div class="main">
            <div class="div1">
                <img width="100" src="https://pbs.twimg.com/media/FETI63AXwAEPlBT?format=png&name=small"/>
                <h1>ALED</h1>
                
            </div>
            <img class="img1" width="300" src="https://i0.wp.com/www.mon-enfant-et-les-ecrans.fr/wp-content/uploads/2018/12/image_article_mot_de_passe.png?fit=1200%2C630&ssl=1"/>
            <div class="div2">
                <h1>Tu as oublié ton mot de passe ?</h1>
                <p> Pas de panique ! Appuie sur le bouton ci-dessous pour 
                    renitialiser ton mot de passe en quelques secondes !
                </p>
                <br>
                <a href="${url}">Modifier le mot de passe</a>
            </div>
        </div>
    </body>`
    }
    emailConfig.transporter.sendMail(mailOptions, (err, data) => {
        if(err) console.log(err)
        else console.log("Password reset email sent to " + mailOptions.to);
    });
}