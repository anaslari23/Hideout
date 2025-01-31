import 'package:flutter/material.dart';
import 'profile/profile.dart';
import 'messages/messagesList.dart';
import 'films/filmsScreen.dart';
import 'camera_screen.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  _HomeFeedScreenState createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = [
    'Feed',
    'Threads',
    'Messages',
    'QuickPic',
    'Films',
    'Connect'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xFFE5E5E5),
      body: SafeArea(
        child: Column(
          children: [
            _buildNavigationHeader(isDarkMode),
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _tabs.length,
                itemBuilder: (context, index) {
                  final isSelected = _tabController.index == index;
                  return GestureDetector(
                    onTap: () {
                      _tabController.animateTo(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? (isDarkMode
                                      ? Colors.blue.withOpacity(0.3)
                                      : const Color.fromARGB(255, 4, 100, 255)
                                          .withOpacity(0.1))
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _tabs[index],
                              style: TextStyle(
                                fontSize: isSelected ? 16 : 14,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected
                                    ? (isDarkMode
                                        ? Colors.blue
                                        : const Color.fromARGB(
                                            255, 4, 100, 255))
                                    : (isDarkMode
                                        ? Colors.white70
                                        : Colors.black54),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildFeedContent(isDarkMode),
                  _buildThreadsContent(isDarkMode),
                  MessagesListScreen(),
                  _buildQuickPicContent(isDarkMode),
                  FilmsScreen(),
                  _buildConnectContent(isDarkMode),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationHeader(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HIDEOUT',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt,
                        color: isDarkMode ? Colors.white : Colors.black),
                    onPressed: () {
                      _openCamera();
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Icon(Icons.search,
                        color: isDarkMode ? Colors.white : Colors.black),
                    onPressed: () {
                      // Handle search icon press
                    },
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: Icon(Icons.notifications_none,
                        color: isDarkMode ? Colors.white : Colors.black),
                    onPressed: () {
                      // Handle notification icon press
                    },
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                isDarkMode ? Colors.white70 : Colors.black12),
                      ),
                      child: Icon(Icons.person_outline,
                          size: 20,
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeedContent(bool isDarkMode) {
    return ListView(
      children: [
        _buildStoryRow(isDarkMode),
        _buildFeedPost(isDarkMode),
        _buildFeedPost(isDarkMode),
      ],
    );
  }

  Widget _buildThreadsContent(bool isDarkMode) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[850] : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        isDarkMode ? Colors.black12 : Colors.black12,
                    child: Icon(Icons.person_outline,
                        color: isDarkMode ? Colors.white70 : Colors.black54),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'user-${index + 1}',
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s.',
                style: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black87),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildInteractionButton(Icons.favorite_border, isDarkMode),
                  const SizedBox(width: 16),
                  _buildInteractionButton(
                      Icons.chat_bubble_outline, isDarkMode),
                  const SizedBox(width: 16),
                  _buildInteractionButton(Icons.share_outlined, isDarkMode),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildConnectContent(bool isDarkMode) {
    return Center(
      child: Text(
        'Connect Content',
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildQuickPicContent(bool isDarkMode) {
    return Center(
      child: Text(
        'QuickPic Content',
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildStoryRow(bool isDarkMode) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 8,
              right: index == 5 ? 16 : 8,
            ),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: isDarkMode ? Colors.white70 : Colors.black12),
                  ),
                  child: CircleAvatar(
                    backgroundColor: isDarkMode ? Colors.black : Colors.white,
                    child: Icon(Icons.person_outline,
                        color: isDarkMode ? Colors.white70 : Colors.black26),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'user-${index + 1}',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeedPost(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isDarkMode ? Colors.white70 : Colors.black12),
                ),
                child: CircleAvatar(
                  backgroundColor: isDarkMode ? Colors.black : Colors.white,
                  child: Icon(Icons.person_outline,
                      color: isDarkMode ? Colors.white70 : Colors.black26),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'user-x',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 400,
          color: isDarkMode ? Colors.grey[900] : Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildInteractionButton(Icons.favorite_border, isDarkMode),
              const SizedBox(width: 16),
              _buildInteractionButton(Icons.chat_bubble_outline, isDarkMode),
              const SizedBox(width: 16),
              _buildInteractionButton(Icons.share_outlined, isDarkMode),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInteractionButton(IconData icon, bool isDarkMode) {
    return GestureDetector(
      onTap: () {},
      child: Icon(icon,
          size: 24, color: isDarkMode ? Colors.white70 : Colors.black87),
    );
  }

  void _openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraScreen()),
    );
  }
}
