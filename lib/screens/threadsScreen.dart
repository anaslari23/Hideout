import 'package:flutter/material.dart';

class ThreadsScreen extends StatefulWidget {
  const ThreadsScreen({super.key});

  @override
  _ThreadsScreenState createState() => _ThreadsScreenState();
}

class _ThreadsScreenState extends State<ThreadsScreen> {
  List<bool> likedThreads = [
    false,
    false,
    false
  ]; // Track liked state for each thread

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  _buildInteractionButton(
                    likedThreads[index]
                        ? Icons.favorite
                        : Icons.favorite_border,
                    () {
                      setState(() {
                        likedThreads[index] = !likedThreads[index];
                      });
                      print('Liked thread $index: ${likedThreads[index]}');
                    },
                  ),
                  const SizedBox(width: 16),
                  _buildInteractionButton(Icons.chat_bubble_outline, () {
                    // Handle reply action
                    print('Reply to thread $index');
                    // You can add navigation to a reply screen here
                  }),
                  const SizedBox(width: 16),
                  _buildInteractionButton(Icons.share_outlined, () {
                    // Handle share action
                    print('Shared thread $index');
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInteractionButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(icon, size: 24, color: Colors.black87),
    );
  }
}
