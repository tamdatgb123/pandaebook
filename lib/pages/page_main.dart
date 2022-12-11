import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/function.dart';
import '../services/helper.dart';
import 'page_myaccount.dart';
import 'page_mybook.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Panda EBook"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
          ),
          ImageSideshow(),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Bestseller Book",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
          ItemWidget(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        width: double.infinity,
        color: Color(0xFF4C53A5),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Helper.createBottomNaviItem(Icons.home, () {}),
          Helper.createBottomNaviItem(Icons.book_sharp, () {
            Helper.newPage(context, ProductPage());
          }),
          Helper.createBottomNaviItem(Icons.account_box, () {
            Helper.getProfile(context);
          }),
        ]),
      ),
    );
  }

  Widget createBottomNaviItem(String title, IconData icon, Function() press) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
