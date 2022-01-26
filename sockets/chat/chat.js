
let connectedUsers = [];

exports.onJoinConv = (socket, conv_id) => {
    socket.join(conv_id);
    const object = connectedUsers.find(item => item.socket_id == socket.id);

    if (object && conv_id){
        object.conv_id = conv_id;
    }
}

exports.onJoinUser = (socket, user_id) => {
    connectedUsers.push({
        socket_id: socket.id,
        user_id: user_id,
        conv_id: null,
        isTyping: false
    });
}

exports.onDisconnectUser = (socket) => {
    connectedUsers = connectedUsers.filter((item) => item.socket_id != socket.id);
}

exports.onLeaveRoom = (socket) => {
    const object = connectedUsers.find(item => item.socket_id == socket.id);
    if (object) {
        socket.leave(object.conv_id);
        object.conv_id = null;
    }
}

exports.sendMessage = (socket, user_id) => {
    const user = connectedUsers.find(item => item.socket_id == socket.id);
    if (user) {
        io.to(user.conv_id).emit('get-message');

        const user2 = connectedUsers.find(item => item.user_id == user_id);
        if (user2) {
            io.to(user2.socket_id).emit('get-conv');
        } 
    }
}