import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
        children: [
          SizedBox(height: 20),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                "assets/images/aboutus.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Concept",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("We all know it, coffee is the cure, and you should know it too.",
                      textAlign: TextAlign.start,),
                    SizedBox(height: 5),
                    Text(
                      "Improved productivity, boosted energy levels, metabolism, you name it. Hence, a bottle of CURE is housed within the cup of coffee.",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 200,
                child: Image.asset(
                  "assets/images/about_1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Story",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "'No Coffee No Cure' is a new venture that will passionately serve specialty grade brews & light pastries.",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "We aim to be the MOST EXTRAORDINARY coffee label in town.",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "We’re focused on being:\nQuirky,\nKooky,\nOut of the ordinary,\nStand out from the common trend.",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 200,
                child: Image.asset(
                  "assets/images/about_2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
