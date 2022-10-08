import 'package:dev_card/sizeconfig.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _iconBool = true;
  final IconData _iconLight = Icons.wb_sunny;
  final IconData _iconDark = Icons.nights_stay;

  final ThemeData _themeLight =
      ThemeData(primaryColor: Colors.red, brightness: Brightness.light);

  final ThemeData _themeDark = ThemeData(
    primaryColor: const Color(0xff2A383D),
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      theme: _iconBool ? _themeDark : _themeLight,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: const Color(0xff2A383D),
        body: SafeArea(
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _iconBool = !_iconBool;
                        });
                      },
                      icon: Icon(_iconBool ? _iconDark : _iconLight),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.12,
                ),
                CircleAvatar(
                  radius: SizeConfig.safeBlockVertical * 13,
                  backgroundImage: const AssetImage('assets/image/coder.png'),
                  backgroundColor: const Color(0xff2A383D),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.025,
                ),
                Text(
                  'Priyank Bhagat',
                  style: TextStyle(
                    fontFamily: 'font3',
                    fontSize: SizeConfig.safeBlockHorizontal * 14,
                    color: const Color(0xff81D9E8),
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                      fontFamily: 'font1',
                      letterSpacing: 3,
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      color: const Color(0xff9C9C9C)),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.35,
                  child: Divider(
                    height: SizeConfig.screenHeight * 0.045,
                    thickness: 2,
                    color: const Color(0xffFAC068),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Uri phoneopen = Uri.parse('tel:+916351491481');
                    if (await launchUrl(phoneopen)) {
                      //dialer opened
                    } else {
                      //dailer is not opened
                    }
                  },
                  child: Card(
                    color: const Color(0xff81D9E8),
                    //padding:const EdgeInsets.all(10), Cards widget don't have padding
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 1,
                        horizontal: SizeConfig.safeBlockHorizontal * 4),
                    child: ListTile(
                      leading: const Icon(Icons.call),
                      title: Text(
                        '+91 6351 491 481',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4.7,
                            fontFamily: 'font1'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Uri emailopen =
                        Uri.parse('mailto:priyankb4dev@proton.me?');
                    if (await launchUrl(emailopen)) {
                      //dialer opened
                    } else {
                      //dailer is not opened
                    }
                  },
                  child: Card(
                    color: const Color(0xff81D9E8),
                    //padding:const EdgeInsets.all(10), Cards widget don't have padding
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 2,
                        horizontal: SizeConfig.safeBlockHorizontal * 4),
                    child: ListTile(
                      leading: const Icon(Icons.email),
                      title: Text(
                        'priyankb4dev@proton.me',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4.7,
                            fontFamily: 'font1'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
