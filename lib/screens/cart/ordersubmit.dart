import 'package:flutter/material.dart';

class OrderSubmit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(0),
          child: Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: Container(
                  height: 100, //100
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, //spaceEvenly
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text("RM 10.00",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ]
                        ),
                        PlaceOrderButton(context)
                      ]
                  )
              )
          ),
        )
    );
  }
}

class PlaceOrderButton extends StatelessWidget {
  final BuildContext context;
  PlaceOrderButton(this.context);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //AddToCart(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange, ///Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded button edges
        ),
      ),
      child: Container(
        width: double.infinity, // Occupy the maximum available width
        child: Center(
          child: Text(
            "Place Order",
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 16, // Text size
            ),
          ),
        ),
      ),
    );
  }
}

class PriceDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("RM 10.00"),
      ]
    );
  }

}


Text placeholder = Text(
  "placeholder"
);