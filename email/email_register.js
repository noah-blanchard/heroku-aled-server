const emailConfig = require("./email_config.js");

exports.sendRegisterMail = async (to, verification) => {

    let url = `http://localhost:3000/verification/${verification}`;
    let mail = 'ptut.testmail@gmail.com';

    let mailOptions = {
        from: mail,
        to: to,
        subject: "Confirme ton compte !",
        html: `
        <html>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&display=swap');
            * {
            font-family: 'Lato', sans-serif !important;
            }
            body {
                display:flex ;
                flex-direction:column ;
                align-items: center;
                background-color: #E7F1FB;
                height : 100vh ;
                padding: 0;
                margin: 0 ;
            }
            img {
                width: 4em;
                margin-right:1em;
            }
            .main {
                margin-top:2em;
                background-color : white ;
                width: 70%;
                padding:2em;
            }
            .img1 {
                margin-top: 2em;
                width: 100%;
                height: 7em;
                background-color: lightskyblue;
            }
            a{
                text-decoration:none;
                color: white;
                background-color :rgb(7, 160, 255);
                font-size:12pt ;
                padding : 10pt ;
                border-radius : 0.7em;
                
            }
            .para {
                margin-bottom : 2em ;
                margin-top : 2em ;
            }
            .logo {
                display :flex ;
                flex-direction:row ;
                border-bottom : solid lightgrey 1px ;
                padding-bottom:2em;
            }
            
    
        </style>
        <body>
            <div class="main">
                <h1>ALED</h1>

                <div class="logo">
                    <img width="200" src="https://pbs.twimg.com/media/FETI63AXwAEPlBT?format=png&name=small"/>
                </div>
                <div class="bloch"></div>
                <h1>Bienvenue sur la plateforme ALED ! </h1>
                <p>
                    Bonjour,
                </p>
                <p class="para">
                    Nous sommes tr??s heureux de t'acceuillir dans la communaut?? dans notre application. 
                    Ici tu disposeras de toutes les ressources qui te permettront 
                    de t'aider dans tes r??visions et plus g??n??ralement dans ta vie scolaire.
                    <br>
                    Mais avant de commencer nous avons besoin que tu confirmes ton comptes.
                    <br>Pour cela rends toi sur l'application !
                </p>
                <a href="${url}">Acc??der ?? ALED</a>
                <p class="para">
                    Si tu rencontres des probl??mes avec ton compte ou que tu souhaites 
                    simplement nous contacter pour une autre raison, nous sommes toujours 
                    pr??sents pour vous aider.
                </p>
                <a href="mailto:${mail}">Nous contacter</a>
                <div class="img1">
                </div>
                <cite><p>L'??quipe ALED</p></cite>
            </div>
        </body>
    
    </html>`
    }

    emailConfig.transporter.sendMail(mailOptions, (err, data) => {
        if(err) console.log(err)
        else  console.log("Verification email sent to" + mailOptions.to);
    });
}