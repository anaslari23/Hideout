import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFFd9d9d9),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildCoverAndProfile(),
                const SizedBox(height: 16),
                _buildProfileInfo(),
                const SizedBox(height: 24),
                _buildStats(),
                const SizedBox(height: 24),
                _buildTabs(),
              ],
            ),
          ),
          _buildPostsGrid(),
        ],
      ),
    );
  }

  Widget _buildCoverAndProfile() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              height: 200,
              color: Colors.white,
            ),
            const SizedBox(height: 60),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF1877f2),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFd9d9d9),
                width: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        const Text(
          'Anas Lari',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF080808),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            '@user-x',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF080808),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Coffee Lover | Tech Enthusiast\nPhotography',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF080808),
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatItem('Followers', '999'),
        Container(
          width: 1,
          height: 24,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          color: const Color(0xFF080808).withOpacity(0.2),
        ),
        _buildStatItem('Following', '200'),
      ],
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF080808).withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF080808),
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return TabBar(
      controller: _tabController,
      indicatorColor: const Color(0xFF03a9f4),
      labelColor: const Color(0xFF080808),
      unselectedLabelColor: const Color(0xFF080808).withOpacity(0.5),
      tabs: const [
        Tab(text: 'Posts'),
        Tab(text: 'Films'),
        Tab(text: 'Threads'),
      ],
    );
  }

  Widget _buildPostsGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              color: Colors.white,
            );
          },
          childCount: 9,
        ),
      ),
    );
  }
}
