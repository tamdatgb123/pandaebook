import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Book details"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/images/1.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(
                          "Book Title",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Author",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        padding: EdgeInsets.all(10),
        width: double.infinity,
        color: Color(0xFF4C53A5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  Icon(
                    Icons.visibility,
                    color: Color(0xFFEDECF2),
                  ),
                  Text(
                    "Read",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEDECF2),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Color(0xFFEDECF2),
                  ),
                  Text(
                    "Like",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEDECF2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
