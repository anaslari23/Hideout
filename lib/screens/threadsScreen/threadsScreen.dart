import 'package:flutter/material.dart';

class ThreadsScreen extends StatelessWidget {
  const ThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        title: Text('Threads'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.person_outline, color: Colors.black54),
                    ),
                    const SizedBox(width: 8),
                    Text('user-${index + 1}'),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s.',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildInteractionButton(Icons.favorite_border),
                    const SizedBox(width: 16),
                    _buildInteractionButton(Icons.chat_bubble_outline),
                    const SizedBox(width: 16),
                    _buildInteractionButton(Icons.share_outlined),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInteractionButton(IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: Icon(icon, size: 24, color: Colors.black87),
    );
  }
}
