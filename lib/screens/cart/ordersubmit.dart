import 'package:flutter/material.dart';

class OrderSubmit extends StatelessWidget {
  final double finalPrice;
  final VoidCallback func;
  OrderSubmit(this.finalPrice, this.func);

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
                              Text('\RM ${finalPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ]
                        ),
                        PlaceOrderButton(context, func)
                      ]
                  )
              )
          ),
        )
    );
  }
}

class PlaceOrderButton extends StatelessWidget {
  final VoidCallback func;
  final BuildContext context;
  PlaceOrderButton(this.context, this.func);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        func();
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

SizedBox buildSubmitOrder(double finalPrice, VoidCallback func) {
  return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(0),
        child: Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Container(
                height: 100,
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
                            Text('\RM ${finalPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ]
                      ),
                      ElevatedButton(
                        onPressed: () {
                          func();
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
                      )
                    ]
                )
            )
        ),
      )
  );
}