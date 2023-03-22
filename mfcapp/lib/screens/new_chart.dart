import 'package:flutter/material.dart';
import 'package:mfcapp/config.dart';
import 'package:mfcapp/models/message_model.dart';
import 'package:uuid/uuid.dart';
import 'package:ably_flutter_plugin/ably_flutter_plugin.dart' as ably;

class ChatScreen extends StatefulWidget {
  ChatScreen();

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ably.Realtime realtimeInstance;
  var newMsgFromAbly;
  late ably.RealtimeChannel chatChannel;
  var myInputController = TextEditingController();
  var myRandomClientId = '';
  bool isChanged = false;

  @override
  void initState() {
    super.initState();

    createAblyRealtimeInstance();
  }

  @override
  void dispose() {
    myInputController.dispose();
    super.dispose();
  }

  void createAblyRealtimeInstance() async {
    var uuid = const Uuid();
    myRandomClientId = uuid.v4();
    var clientOptions = ably.ClientOptions.fromKey(AblyAPIKey);
    clientOptions.clientId = myRandomClientId;
    try {
      realtimeInstance = ably.Realtime(options: clientOptions);
      print('Ably instantiated');
      chatChannel = realtimeInstance.channels.get('mfc-chat');
      subscribeToChatChannel();
      realtimeInstance.connection
          .on(ably.ConnectionEvent.connected)
          .listen((ably.ConnectionStateChange stateChange) async {
        print('Realtime connection state changed: ${stateChange.event}');
      });
    } catch (error) {
      print('Error creating Ably Realtime Instance: $error');
      rethrow;
    }
  }

  void subscribeToChatChannel() {
    var messageStream = chatChannel.subscribe();
    messageStream.listen((ably.Message message) {
      Message newChatMsg;
      newMsgFromAbly = message.data;
      print("New message arrived ${message.data}");
      var hoursIn12HrFormat = message.timestamp.hour > 12
          ? (message.timestamp.hour - 12)
          : (message.timestamp.hour);
      var timeOfDay = message.timestamp.hour < 12 ? ' AM' : ' PM';
      var msgTime = "$hoursIn12HrFormat:${message.timestamp.minute}$timeOfDay";
      if (message.clientId == myRandomClientId) {
        newChatMsg = Message(
          sender: currentUser,
          time: msgTime,
          text: newMsgFromAbly["text"],
          unread: false,
        );
      } else {
        String text = '';
        try{
          text = newMsgFromAbly["text"];
        } catch(e) {
          print(e.toString());
          text = newMsgFromAbly;
        }
        newChatMsg = Message(
          sender: randomChatUser,
          time: msgTime,
          text: text,
          unread: false,
        );
      }

      setState(() {
        messages.insert(0, newChatMsg);
      });
    });
  }

  void publishMyMessage() async {
    var myMessage = myInputController.text;
    myInputController.clear();
    chatChannel.publish(name: "chatMsg", data: {
      "sender": "randomChatUser",
      "text": myMessage,
    });
  }

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: isMe ? const Color(0xFFD6F4D4) : const Color(0xFFFEF9EB),
          borderRadius: isMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFDFDDCE),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              isMe ? Text('You') : Text(message.sender.name)
            ],
          ),
          Text(
            message.text,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                message.time,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      height: 70.0,
      decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: myInputController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    isChanged = true;
                  });
                } else {
                  setState(() {
                    isChanged = false;
                  });
                }
              },
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: isChanged ? Colors.green : Theme.of(context).primaryColor,
            onPressed: () {
              if (myInputController.text.isNotEmpty) {
                publishMyMessage();
                setState(() {
                  isChanged = false;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFDDCE),
        title: Text(
          'My Chat',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[700]
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
