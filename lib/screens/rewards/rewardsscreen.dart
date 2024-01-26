import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

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
      body: Padding(
        padding: EdgeInsets.only(left:12.0, right: 12.0, ),
        child: Column(
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
                    'Health screening Pharmacy',
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
        )
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
        mainAxisSpacing: 16.0, //16
        crossAxisSpacing: 16.0, //16
        childAspectRatio: 0.52 //0.60
      ),
      padding: EdgeInsets.only(top: 0, bottom: 8, left:16, right: 16),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/coffeesample.png',
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                    child: Text(
                      items[index],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                        "50 coins",
                        style: TextStyle(
                            fontSize: 12
                        )
                    ),
                  ),
                ],
              ),
            )
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