import 'package:flutter/material.dart';
import 'package:firebase3/grafics/MyColors.dart';

class MyCard {
  final String name;
  final String category;
  final double amount;

  MyCard({required this.name, required this.category, required this.amount});
}

class CardArrayH extends StatelessWidget {
  final List<MyCard> cards = [
    MyCard(name: '2 days', category: 'fixed', amount: 100),
    MyCard(name: 'Card 2', category: 'flexible', amount: 20.0),
    MyCard(name: 'Card 3', category: 'fixed', amount: 30.0),
    MyCard(name: 'Card 4', category: 'fixed', amount: 40.0),
    MyCard(name: 'Card 5', category: 'flexible', amount: 50.0),
    MyCard(name: 'Card 6', category: 'fixed', amount: 60.0),
    MyCard(name: 'Card 7', category: 'fixed', amount: 70.0),
    MyCard(name: 'Card 8', category: 'fixed', amount: 80.0),
    MyCard(name: 'Card 9', category: 'flexible', amount: 90.0),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cards.map((card) {
          return cardview(
            cardName: card.name,
            cardCategory: card.category,
            cardAmount: card.amount,
          );
        }).toList(),
      ),
    );
  }
}


class cardview extends StatelessWidget {
  final String cardName;
  final String cardCategory;
  final double cardAmount;

  cardview({
    required this.cardName,
    required this.cardCategory,
    required this.cardAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 250,
        height: 200,
        padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
        color: Colors.white,
        child: Stack(
          children: [
            // Base container with rounded corners
            Container(
              constraints: BoxConstraints.tightFor(
                width: double.infinity,
                height: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
              ),
            ),

            // Gradient container with rounded corners and inner shadow
            Positioned(
              top: -2,
              left: -2,
              right: 1,
              bottom: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.0),
                      offset: Offset(2, 2),
                      blurRadius: 15,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.9),
                      offset: Offset(-2, 2),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(2, -2),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),

            // Row widget to align the text
            //ObenRechts zwei schriften
            Positioned(
              top: 16,
              left: 22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardName.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Klee",
                    ),
                  ),
                  Text(
                    cardCategory.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Klee",
                      fontWeight: FontWeight.w600,
                    ),

                  ),
                ],
              ),
            ),

            //menge unten links
            Positioned(
              bottom: 22,
              left: 22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardAmount.toInt().toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Klee"
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
                top: 20,
                right: 22,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
                  ),
                  height: 30,
                  width: 30,
                )
            ),

            //bald kreis

            // button unten rechts
            Positioned(
              bottom: 10,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.zero,
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(0, 0), // Adjust the height as needed
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(MyColors.giveBackButton),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 4, 15, 7),
                      child: Text(
                        'give back',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Klee",
                          fontWeight: FontWeight.w600,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}