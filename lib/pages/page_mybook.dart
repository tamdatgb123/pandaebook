import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandaebook/pages/page_details.dart';

import '../services/helper.dart';
import 'page_main.dart';
import 'page_myaccount.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Book"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(10),
            child: Text(
              "Read Recently",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
          MyBooks(),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(10),
            child: Text(
              "Favorites",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        width: double.infinity,
        color: Color(0xFF4C53A5),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Helper.createBottomNaviItem(Icons.home, () {
            Helper.newPage(context, Mainpage());
          }),
          Helper.createBottomNaviItem(Icons.book_sharp, () {}),
          Helper.createBottomNaviItem(Icons.account_box, () {
            Helper.newPage(context, MyaccountPage());
          }),
        ]),
      ),
    );
  }
}

class MyBooks extends StatelessWidget {
  const MyBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.62,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 5; i++)
          Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 5),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Helper.nextPage(context, DetailsPage());
                    // Navigator.pushNamed(context, itemPage),
                  },
                  child: Container(
                    margin: EdgeInsets.all(0),
                    child: Image.asset(
                      "assets/images/$i.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    child: Text(
                      "Book Title Bi Mat Phan Thien An Hahaha hasda",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          overflow: TextOverflow.fade),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
