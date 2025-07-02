import 'package:flutter/material.dart';

void main() {
  runApp(SocialFeedApp());
}

class SocialFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Feed Clone',
      theme: ThemeData.dark(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _bottomNavIndex = 0;
  int _railIndex = 0;
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> feedData = [
    {
      'username': 'KANG DEDI MULYADI CHANN...',
      'title': 'INI PENJELASAN KDM PADA REMAJA YANG KECEWA KARENA RUMAHNYA DIBONGKAR',
      'description': '',
      'views': '1.820.637 x ditonton',
      'time': '1h lalu',
      'avatar': 'https://i.pravatar.cc/150?img=11',
      'image': 'assets/pinjol2.jpg',
      'likes': '30K',
      'retweets': '3K',
      'comments': '1K',
      'bookmarks': '3.6M',
    },
    {
      'username': 'OKUYZZ',
      'title': 'Ternyata dia sales pinjol.',
      'description': 'Informasi terkait sales pinjol dan tips menghadapinya.',
      'views': '3.6M views',
      'time': '15 jam lalu',
      'avatar': 'https://i.pravatar.cc/150?img=12',
      'image': 'assets/pinjol.jpg',
      'likes': '30K',
      'retweets': '3K',
      'comments': '1K',
      'bookmarks': '3.6M',
    },
    {
      'username': 'TanyarI 💚',
      'title': '💚diantara mereka, siapa yg "lebih baik" dikit',
      'views': '3.6M views',
      'likes': '1.3M likes',
      'retweets': '2.1K retweets',
      'comments': '1.8K comments',
      'time': '6 jam lalu',
      'avatar': 'assets/tanyarl.jpg',
      'image': 'assets/nobita.jpg'
    },
  ];

  final List<Map<String, String>> suggestedUsers = [
    {
      'name': 'TanyarI 💚',
      'username': '@tanyakanrI',
      'avatar': 'assets/tanyarl.jpg',
    },
    {
      'name': 'Mahyar Tousi',
      'username': '@MahyarTousi',
      'avatar': 'assets/t.jpg',
    },
    {
      'name': 'Brian Lau 🇨🇳🇭🇰',
      'username': '@BrianLauQuedic',
      'avatar': 'assets/b.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget buildFeed() {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.all(8),
      itemCount: feedData.length,
      itemBuilder: (context, index) {
        final item = feedData[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item['avatar'] ?? ''),
                    radius: 24,
                  ),
                  title: Text(
                    item['username'] ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: FollowButton(),
                ),
                SizedBox(height: 8),
                Text(
                  item['title'] ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Image.network(
                    item['image'] ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                if (item['description'] != null && item['description']!.isNotEmpty)
                  Text(item['description']!, style: TextStyle(fontSize: 14)),
                SizedBox(height: 4),
                Text(
                  '${item['views'] ?? ''} · ${item['time'] ?? ''}',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWithText(icon: Icons.mode_comment_sharp, text: item['comments'] ?? ''),
                    IconWithText(icon: Icons.repeat, text: item['retweets'] ?? ''),
                    IconWithText(icon: Icons.favorite_border, text: item['likes'] ?? ''),
                    IconWithText(icon: Icons.bookmark_border, text: item['bookmarks'] ?? ''),
                    IconWithText(icon: Icons.share, text: ''),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTopTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.blue,
              labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'For You'),
                Tab(text: 'Following'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSidebar(bool isMobile) {
    if (isMobile) {
      return BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          if (index == 1) {
            showSearch(context: context, delegate: SimpleSearchDelegate());
          } else {
            setState(() {
              _bottomNavIndex = index;
            });
          }
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: ''),
        ],
      );
    } else {
      return NavigationRail(
        backgroundColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.blue),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        labelType: NavigationRailLabelType.none,
        destinations: const [
          NavigationRailDestination(icon: Icon(Icons.home), label: SizedBox.shrink()),
          NavigationRailDestination(icon: Icon(Icons.search), label: SizedBox.shrink()),
          NavigationRailDestination(icon: Icon(Icons.notifications), label: SizedBox.shrink()),
          NavigationRailDestination(icon: Icon(Icons.mail_outline), label: SizedBox.shrink()),
          NavigationRailDestination(icon: Icon(Icons.auto_awesome), label: SizedBox.shrink()),
          NavigationRailDestination(icon: Icon(Icons.group), label: SizedBox.shrink()),
          NavigationRailDestination(icon: Icon(Icons.more_vert), label: SizedBox.shrink()),
        ],
        selectedIndex: _railIndex,
        onDestinationSelected: (index) {
          setState(() {
            _railIndex = index;
          });
        },
      );
    }
  }

  Widget buildWhoToFollow() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Who to follow', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...suggestedUsers.map((user) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar']!),
                    radius: 18,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(user['username']!, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const FollowButton(),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: const Text('Show more'),
          ),
        ],
      ),
    );
  }

  Widget buildPageContent(int index) {
    switch (index) {
      case 0:
        return Column(
          children: [
            buildTopTabs(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildFeed(),
                  const Center(child: Text('Following Tab (kosong)')),
                ],
              ),
            ),
          ],
        );
      case 1:
        return Center(
          child: ElevatedButton.icon(
            icon: Icon(Icons.search),
            label: Text('Tap to Search'),
            onPressed: () {
              showSearch(context: context, delegate: SimpleSearchDelegate());
            },
          ),
        );
      default:
        return Center(child: Text(''));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    int selectedIndex = isMobile ? _bottomNavIndex : _railIndex;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: !isMobile
          ? FloatingActionButton(
              heroTag: 'scrollTopBtn',
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              backgroundColor: Colors.grey[850],
              child: Icon(Icons.refresh, color: Colors.white),
            )
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (!isMobile) buildSidebar(false),
            if (!isMobile) const VerticalDivider(width: 1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: buildPageContent(selectedIndex),
              ),
            ),
            if (!isMobile) const VerticalDivider(width: 1),
            if (!isMobile)
              Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          showSearch(context: context, delegate: SimpleSearchDelegate());
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    buildWhoToFollow(),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: isMobile ? buildSidebar(true) : null,
    );
  }
}

class FollowButton extends StatefulWidget {
  const FollowButton({Key? key}) : super(key: key);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isFollowing = !isFollowing;
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: isFollowing ? Colors.grey[700] : Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Text(isFollowing ? 'Following' : 'Follow'),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconWithText({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[400]),
        if (text.isNotEmpty) ...[
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ]
      ],
    );
  }
}

class SimpleSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) => Center(child: Text("Hasil untuk '$query'"));

  @override
  Widget buildSuggestions(BuildContext context) => Center(child: Text("Ketik untuk mencari..."));
}
