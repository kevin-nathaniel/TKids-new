import 'package:flutter/material.dart';
import 'package:my_first_project/app_styles.dart';
import 'package:my_first_project/screen/authentication/login_screen.dart';
import 'package:my_first_project/screen/grade/grade.dart';
import 'package:my_first_project/screen/location/map_view.dart';
import 'package:my_first_project/screen/report/log_activities.dart';
import 'package:my_first_project/screen/screens.dart';
import 'package:my_first_project/size_configs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig?.blockSizeV ?? 0.0;
    double width = SizeConfig?.blockSizeH ?? 0.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: 'Hai, ',
            style: TextStyle(
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: 'Jo Kevin Nathaniel',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: PrimaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 250,
              width: width * 100,
              color: PrimaryColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Column(
                  children: [
                    ClipPath(),
                  ],
                ),
                Expanded(
                  child: Container(
                    // color: Colors.purple,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            children: [
                              Text(
                                'Our Services',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.black,
                                            padding: EdgeInsets.all(1),
                                            child: ItemCategory(
                                              title: 'Activity',
                                              icon:
                                                  'assets/images/icons/blue-report.png',
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ActivityList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            color: Colors.black,
                                            child: ItemCategory(
                                              title: 'Grade',
                                              icon:
                                                  'assets/images/icons/blue-nilai.png',
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        GradeList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            color: Colors.black,
                                            child: ItemCategory(
                                              title: 'Location',
                                              icon:
                                                  'assets/images/icons/blue-maps.png',
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MapsPage(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 7),
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ItemNav(
                                icon: 'beranda',
                                status: true,
                                title: 'Home',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                              ),
                              ItemNav(
                                icon: 'report',
                                status: false,
                                title: 'Report',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ActivityList(),
                                    ),
                                  );
                                },
                              ),
                              ItemNav(
                                icon: 'maps',
                                status: false,
                                title: 'Location',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MapsPage(),
                                    ),
                                  );
                                },
                              ),
                              ItemNav(
                                icon: 'nilai',
                                status: false,
                                title: 'Grade',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GradeList(),
                                    ),
                                  );
                                },
                              ),
                              ItemNav(
                                icon: 'profile',
                                status: false,
                                title: 'Profile',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfileScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemNew extends StatelessWidget {
  ItemNew({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig?.blockSizeV ?? 0.0;
    double width = SizeConfig?.blockSizeH ?? 0.0;
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: width * 50,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  ItemCategory({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(
                icon,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemNav extends StatelessWidget {
  ItemNav({
    Key? key,
    required this.status,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final bool status;
  final String title;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 25,
            child: Image.asset(
              (status == true)
                  ? 'assets/images/icons/$icon-active.png'
                  : 'assets/images/icons/$icon.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: (status == true) ? PrimaryColor : Color(0xFF747D8C),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
