import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      homeScreen(),
      const Icon(
        Icons.restore,
        size: 150,
      ),
      const FaIcon(
        FontAwesomeIcons.userAlt,
        size: 120,
      ),
    ];
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white54,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: Colors.black.withOpacity(.7)))),
            child: BottomNavigationBar(
              elevation: 2,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: Colors.black,
              fixedColor: Colors.white,
              unselectedItemColor: Colors.grey.withOpacity(.7),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.restore),
                  label: 'Chat Recent',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.solidUser,
                    size: 20,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
          body: Center(
            child: _pages.elementAt(_selectedIndex),
          )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget homeScreen() {
  return Container(
    constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(
      image: DecorationImage(
          // colorFilter: ColorFilter.mode(
          //     Colors.black.withOpacity(.4), BlendMode.softLight),
          fit: BoxFit.cover,
          image: AssetImage('assets/images/image2.jpg')),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.height * .05),
          child: RichText(
            text: const TextSpan(
              text: 'Current ',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '| Online', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(12),
            height: Get.height * .2,
            width: Get.width * .44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/image11.jpg')),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 9,
                  offset: const Offset(0, 0), //// changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Online ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 14,
                    )
                  ],
                ),
                SizedBox(height: Get.height * .108),
                const Text(
                  'Meena Sharma',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 11),
                ),
                const SizedBox(height: 3),
                const Text(
                  '4 km away',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
