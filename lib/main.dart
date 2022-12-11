import 'package:flutter/material.dart';
import 'package:pandaebook/pages/page_main.dart';

import 'pages/page_login.dart';
import 'pages/page_register.dart';
import 'services/helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: const Mainpage(),
    );
  }
}

class PandaEBook extends StatelessWidget {
  const PandaEBook({super.key});
  void nextPage(BuildContext context, Widget page) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const textStyleTieude = TextStyle(
      fontSize: 24.0,
      height: 1.4,
      color: Color(0xFF4C53A5),
    );
    const textStyleCommand = TextStyle(
      fontSize: 20.0,
      height: 1.8,
      color: Color(0xFF4C53A5),
    );
    return Scaffold(
      appBar: AppBar(title: Text("PandaEbook")),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
          ),
          Container(
            height: 0.7 * size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment(0, 1),
                fit: BoxFit.cover,
                image: AssetImage("assets/images/flash_connection.png"),
              ),
            ),
            alignment: Alignment.center,
          ),
          Positioned(
            bottom: 0,
            width: size.width,
            child: Container(
              width: size.width,
              height: 0.3 * size.height,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    style: textStyleTieude,
                    "Welcome to PandaEbook",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Helper.newPage(context, PageRegister());
                        },
                        icon: const Icon(
                          Icons.app_registration,
                          size: 20,
                        ),
                        label: const Text(style: textStyleCommand, "Register"),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Helper.newPage(context, PageLogin());
                        },
                        icon: const Icon(
                          Icons.login,
                          size: 20,
                        ),
                        label: const Text(style: textStyleCommand, "Login"),
                      ),
                      // TextButton(
                      //     onPressed: null,
                      //     child: const Text(style: textStyleCommand, "Exit"))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
