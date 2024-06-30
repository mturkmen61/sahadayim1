import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahadayim/constants/colors.dart';

class HomeScreenTab extends StatefulWidget {
  const HomeScreenTab({
    super.key,
  });

  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Örnek rakip takım listesi
  final List<String> _teamList = [
    'Team A',
    'Team B',
    'Team C',
    'Team D',
    'Team E',
    'Team F',
    'Team G',
    'Team H',
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> filteredList = _teamList.take(3).toList();
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/map.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                "Ilanlar",
                style: TextStyle(
                    color: AppColors.darkGreen,
                    fontFamily: "Lato",
                    fontSize: 16),
              ),
              centerTitle: true,
              leading: _buildCircularIcon("assets/images/TextLeft.svg"),
              actions: [
                _buildCircularIcon("assets/images/ChatCenteredText.svg"),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: const Color(0xff0F4D00),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Rakip',
                  ),
                  Tab(
                    text: 'Eksik Takım',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildListView(filteredList),
                  buildListView(filteredList),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildListView(List<String> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xffC9F881),
                  child: Text(
                    list[index][0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  list[index],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: const Color(0xffC9F881),
                      borderRadius: BorderRadius.circular(35)),
                  child: const Text(
                    'Takımları maça çağırabilmeliyiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCircularIcon(String assetName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFF1F1F1), // Adjust the color as needed
            width: 1.0, // 1-pixel border width
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            assetName,
            fit: BoxFit.scaleDown,
            width: 24, // Adjust the width and height as needed
            height: 24,
          ),
        ),
      ),
    );
  }
}
