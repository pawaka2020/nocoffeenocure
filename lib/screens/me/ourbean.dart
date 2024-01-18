import 'package:flutter/material.dart';

class OurBeanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Our Bean',
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
                "assets/images/coffeestockimage.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "At 'No Coffee No Cure,' we take our beans seriously. We source the finest coffee beans from around the world to ensure a rich and satisfying cup every time.",
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text(
            "Our selection includes a variety of beans, each with its unique flavor profile. Whether you prefer a bold and robust espresso or a smooth and mellow drip coffee, we've got the perfect bean for you.",
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text(
            "We believe that great coffee starts with exceptional beans. That's why we work closely with our suppliers to maintain the highest standards of quality and sustainability.",
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20),
          Text(
            "Explore our bean selection and experience the difference that quality makes in every cup.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

Center placeholder = Center(
    child: Text(
      'Our Bean',
      style: TextStyle(fontSize: 24),
    )
);