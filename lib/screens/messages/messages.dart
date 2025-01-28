import 'package:flutter/material.dart';
import 'messagesList.dart';

class ChatScreen extends StatefulWidget {
  final MessageItem message;

  const ChatScreen({super.key, required this.message});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [
    Message(
      text: "Hi, how are you?",
      isMe: false,
      senderAvatar: "https://picsum.photos/200",
    ),
    Message(
      text: "Hello, I am good!",
      isMe: true,
      senderAvatar: "https://picsum.photos/201",
    ),
    Message(
      text: "Lets do a meetup",
      isMe: false,
      senderAvatar: "https://picsum.photos/200",
    ),
    Message(
      text: "Sounds good, lets do this",
      isMe: true,
      senderAvatar: "https://picsum.photos/201",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildMessageList(),
            ),
            _buildMessageInput(mediaQuery),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFC8A2C8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          BackButton(
            color: Colors.black,
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                widget.message.senderAvatar ?? 'https://picsum.photos/200'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message.username,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "@user-x",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.phone_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment:
                message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!message.isMe) ...[
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(message.senderAvatar),
                ),
                const SizedBox(width: 8),
              ],
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  message.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              if (message.isMe) ...[
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(message.senderAvatar),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessageInput(MediaQueryData mediaQuery) {
    return Container(
      padding: EdgeInsets.all(mediaQuery.size.width * 0.04),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: mediaQuery.size.width * 0.02),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFC8A2C8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send),
              color: Colors.white,
              onPressed: () {
                if (_messageController.text.isNotEmpty) {
                  setState(() {
                    _messages.add(
                      Message(
                        text: _messageController.text,
                        isMe: true,
                        senderAvatar: "https://picsum.photos/201",
                      ),
                    );
                    _messageController.clear();
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

class Message {
  final String text;
  final bool isMe;
  final String senderAvatar;

  Message({
    required this.text,
    required this.isMe,
    required this.senderAvatar,
  });
}
