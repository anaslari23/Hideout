import 'package:flutter/material.dart';

import 'messages.dart';

class MessagesListScreen extends StatefulWidget {
  const MessagesListScreen({super.key});

  @override
  _MessagesListScreenState createState() => _MessagesListScreenState();
}

class _MessagesListScreenState extends State<MessagesListScreen> {
  int _selectedFilterIndex = 0;
  int _selectedPageIndex = 0;
  final List<String> _filters = ['All', 'Unread', 'Approach'];

  final List<MessageItem> _messages = [
    MessageItem(
      username: 'User 1',
      message: 'Did you see the message?',
      unreadCount: 2,
      isUnread: true,
      senderAvatar: 'https://picsum.photos/200?random=1',
    ),
    MessageItem(
      username: 'User 2',
      message: 'Send the photos quick',
      unreadCount: 3,
      isUnread: true,
      senderAvatar: 'https://picsum.photos/200?random=2',
    ),
    MessageItem(
      username: 'User 4',
      message: 'When are we meeting?',
      unreadCount: 1,
      isUnread: true,
      senderAvatar: 'https://picsum.photos/200?random=4',
    ),
    MessageItem(
      username: 'Shifa',
      message: 'You: All good!',
      unreadCount: 0,
      isUnread: false,
      senderAvatar: 'https://picsum.photos/200?random=5',
    ),
    MessageItem(
      username: 'User 3',
      message: 'You: see you soon',
      unreadCount: 0,
      isUnread: false,
      senderAvatar: 'https://picsum.photos/200?random=3',
    ),
    MessageItem(
      username: 'User 5',
      message: 'Fuck off!',
      unreadCount: 1,
      isUnread: true,
      senderAvatar: 'https://picsum.photos/200?random=6',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(isDarkMode),
            _buildFilters(isDarkMode),
            Expanded(
              child: IndexedStack(
                index: _selectedPageIndex,
                children: [
                  _buildMessagesList(isDarkMode),
                  const Center(child: Text('Video Screen')),
                  const Center(child: Text('Phone Screen')),
                ],
              ),
            ),
            _buildBottomNavigation(isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : const Color(0xFFC8A2C8),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
          const Text(
            'Messages',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://picsum.photos/200'),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _filters.length,
          (index) => GestureDetector(
            onTap: () => setState(() => _selectedFilterIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: _selectedFilterIndex == index
                    ? (isDarkMode ? Colors.white : Colors.black)
                    : (isDarkMode ? Colors.grey[800] : Colors.grey[300]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _filters[index],
                style: TextStyle(
                  color: _selectedFilterIndex == index
                      ? (isDarkMode ? Colors.black : Colors.white)
                      : (isDarkMode ? Colors.white : Colors.black),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessagesList(bool isDarkMode) {
    return ListView.builder(
      itemCount: _messages.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final message = _messages[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(message: message),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                      message.senderAvatar ?? 'https://picsum.photos/200'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.username,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message.message,
                        style: TextStyle(
                          color:
                              isDarkMode ? Colors.grey[400] : Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                if (message.unreadCount > 0)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.grey[700]
                          : const Color(0xFFC8A2C8),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        message.unreadCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigation(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : const Color(0xFFC8A2C8),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
            onPressed: () {
              setState(() {
                _selectedPageIndex = 0;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.white),
            onPressed: () {
              setState(() {
                _selectedPageIndex = 1;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.phone_outlined, color: Colors.white),
            onPressed: () {
              setState(() {
                _selectedPageIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}

class MessageItem {
  final String username;
  final String message;
  final int unreadCount;
  final bool isUnread;
  final String? senderAvatar;

  MessageItem({
    required this.username,
    required this.message,
    required this.unreadCount,
    required this.isUnread,
    required this.senderAvatar,
  });
}
