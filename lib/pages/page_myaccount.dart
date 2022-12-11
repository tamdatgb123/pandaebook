import 'page_updateavatar.dart';
import 'page_updateprofile.dart';
import '../services/profile.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../services/helper.dart';
import 'page_main.dart';
import 'page_mybook.dart';

class MyaccountPage extends StatelessWidget {
  const MyaccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("My account")),
      body: Stack(children: [
        Positioned(
          top: 0,
          child: Container(
            height: 130,
            width: size.width,
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      child: Container(
                        height: 80,
                        width: 80,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/spinner.gif',
                          image: Profile.avatar,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Helper.nextPage(context, PageUpdateAvatar());
                      },
                      icon: const Icon(Icons.camera_alt_rounded),
                      label: Text('change'),
                    ),
                  ],
                ),
                buildQrImage(14.0),
              ],
            ),
          ),
        ),
        Positioned(
          top: 120,
          child: Container(
            padding: EdgeInsets.only(left: 20, top: 40, right: 20),
            // height: size.height - 120,
            width: size.width,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tên: ${Profile.first_name} ${Profile.last_name}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Số điện thoại: ${Profile.phone}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Email: ${Profile.email}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Địa chỉ: ${Profile.address}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 140,
          right: 10,
          child: TextButton.icon(
            onPressed: () {
              Helper.nextPage(context, PageUpdateProfile());
            },
            icon: Icon(Icons.edit),
            label: Text(''),
          ),
        )
      ]),
      bottomNavigationBar: createBottomNav(context),
    );
  }

  Widget buildQrImage(double defaultSize) {
    return QrImage(
      data: Helper.baseurl + Profile.id.toString(),
      version: QrVersions.auto,
      size: defaultSize * 10,
      gapless: false,
    );
  }

  Container createBottomNav(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xFF4C53A5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Helper.createBottomNaviItem(Icons.home, () {
          Helper.newPage(context, Mainpage());
        }),
        Helper.createBottomNaviItem(Icons.library_books, () {
          Helper.newPage(context, ProductPage());
        }),
        Helper.createBottomNaviItem(Icons.account_box, () {}),
      ]),
    );
  }
}
