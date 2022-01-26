require('dotenv').config();
const express = require("express");
const cors = require("cors");
const app = express();
const port = process.env.PORT || 5000;
const fileupload = require("express-fileupload");

const userRoutes = require('./routes/user');
const categoryRoutes = require('./routes/category');
const colorRoutes = require('./routes/color');
const topicRoutes = require('./routes/topic');
const classRoutes = require('./routes/class');
const favoriteRoutes = require('./routes/favorite');
const messageRoutes = require('./routes/message');
const documentRoutes = require('./routes/document');
const driveRoutes = require('./routes/drive');
const ratingRoutes = require('./routes/rating');
const markRoutes = require('./routes/mark');
const convRoutes = require("./routes/conversation");
const eventRoutes = require("./routes/calendar");



// Socket IO
const socket = require("socket.io");
// global error handler
const errorHandler = require('./helpers/error-handler');


app.use(fileupload());
app.use(cors({origin: '*'}));
app.use(express.json({limit: '3mb'}));
app.use(express.urlencoded({limit: '3mb', extended: true}));

app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});



const server = app.listen(port, () => {
    console.log(`Listening on ${port}`);
});

app.get("/", (req, res) => {
    res.send("Serveur Opérationnel")
});

app.use('/api/user', userRoutes);
app.use('/api/category', categoryRoutes);
app.use('/api/color', colorRoutes);
app.use('/api/topic', topicRoutes);
app.use('/api/class', classRoutes);
app.use('/api/favorite', favoriteRoutes);
app.use('/api/message', messageRoutes);
app.use('/api/document', documentRoutes);
app.use('/api/drive', driveRoutes);
app.use('/api/rating', ratingRoutes);
app.use('/api/mark', markRoutes);
app.use('/api/conversation', convRoutes);
app.use('/api/calendar', eventRoutes);

app.use(errorHandler);

// Sockets
const io = socket(server, {
    cors: {
        origin: "*",
        methods: ["GET", "POST"]
    }
});

let connectedUsers = [];

const onJoinConv = (socket, conv_id) => {
    socket.join(conv_id);
    const object = connectedUsers.find(item => item.socket_id == socket.id);

    if (object && conv_id){
        object.conv_id = conv_id;
    }
}

const onJoinUser = (socket, user_id) => {
    connectedUsers.push({
        socket_id: socket.id,
        user_id: user_id,
        conv_id: null,
        isTyping: false
    });
}

const onDisconnectUser = (socket) => {
    connectedUsers = connectedUsers.filter((item) => item.socket_id != socket.id);
}

const onLeaveRoom = (socket) => {
    const object = connectedUsers.find(item => item.socket_id == socket.id);
    if (object) {
        socket.leave(object.conv_id);
        object.conv_id = null;
    }
}

const sendMessage = (socket, user_id) => {
    const user = connectedUsers.find(item => item.socket_id == socket.id);
    if (user) {
        io.to(user.conv_id).except(user.socket_id).emit('get-message');

        const user2 = connectedUsers.find(item => item.user_id == user_id);
        if (user2) {
            io.to(user2.socket_id).emit('get-conv');
        } 
    }
}

io.on('connection', (socket) => {
    socket.on("join-user", (user_id) => onJoinUser(socket, user_id));

    socket.on("join-conv", (conv_id) => onJoinConv(socket, conv_id ));

    socket.on("post-message", (user_id) => sendMessage(socket, user_id))

    socket.on("leave-room", () => onLeaveRoom(socket));

    socket.on("disconnect", () => onDisconnectUser(socket));

    // force disconnect
    socket.on('forceDisconnect', () => {
        socket.disconnect();
    });

});