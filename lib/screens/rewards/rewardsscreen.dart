import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
Rewards list:
1 - Travel and Services
2D1L trip to Kota Kinabalu.
1-day Tour guide of Taman Negara.
Full body health screening at Hippocratus Pharmacy.
2 - Entertainment
Ticket for Michael Jackson 'This is It' concert.
1 Go-kart session at Pirate Nation.
1 Golden Ticket for Gamuda Land.
3 - Health & Beauty
Estee Lauder facial cleanser.
Garnier facemask.
*/

class RewardsScreen extends StatefulWidget {
  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  PageController _pageController = PageController();
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rewards',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 48.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildCategoryTab('Travel and Services', 0),
                buildCategoryTab('Entertainment', 1),
                buildCategoryTab('Health & Beauty', 2),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
              children: [
                buildCategoryList([
                  '2D1L trip to Kota Kinabalu',
                  '1-day Tour guide of Taman Negara',
                  'Full body health screening at Hippocratus Pharmacy',
                ]),
                buildCategoryList([
                  'Ticket for Michael Jackson \'This is It\' concert',
                  '1 Go-kart session at Pirate Nation',
                  '1 Golden Ticket for Gamuda Land',
                ]),
                buildCategoryList([
                  'Estee Lauder facial cleanser',
                  'Garnier facemask',
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryTab(String categoryName, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedCategoryIndex = index;
            _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
          });
        },
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: _selectedCategoryIndex == index ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategoryList(List<String> items) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
      padding: EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navigate to a separate page with reward details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RewardDetailsPage(itemDetails: items[index]),
              ),
            );
          },
          child: Card(
            child: ListTile(
              title: Text(items[index]),
              // Add more customization as needed for each card
            ),
          ),
        );
      },
    );
  }
}

class RewardDetailsPage extends StatelessWidget {
  final String itemDetails;

  RewardDetailsPage({required this.itemDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward Details'),
      ),
      body: Center(
        child: Text(itemDetails),
      ),
    );
  }
}