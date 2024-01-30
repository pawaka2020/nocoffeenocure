import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FAQScreenState();
}

class FAQScreenState extends State<FAQScreen> {
  bool isExpanded = false;

  Widget buildFAQCard(String question, String answer) {
    return Column(
      children: [
        Card(
          child: ExpansionTile(
            title: Text(
              question,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    answer,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
            trailing: isExpanded
                ? Icon(Icons.keyboard_arrow_up)
                : Icon(Icons.keyboard_arrow_down),
            onExpansionChanged: (bool expanding) {
              setState(() {
                isExpanded = expanding;
              });
            },
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        children: [
          SizedBox(height: 20),
          buildFAQCard(
              "Doe you offer decaffeinated coffee?",
              "Certainly! We provide decaffeinated coffee options for those who prefer to limit their caffeine intake."),
          buildFAQCard(
              "Can I customize my coffee order?",
              "Absolutely! We offer a variety of customization options, including different milk choices, sweeteners, and flavor additions."),
          buildFAQCard("Is your packaging eco-friendly?",
              "Yes, we are committed to sustainability. Our packaging is eco-friendly, and we encourage customers to recycle."),
          buildFAQCard("Do you have options for lactose-intolerant customers?",
              "Yes, we provide lactose-free milk alternatives such as almond, soy, and oat milk."),
        ],
      ),
    );
  }
}