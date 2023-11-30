import 'package:flutter/material.dart';
import 'package:my_first_project/app_styles.dart';
import 'package:my_first_project/main.dart';
import 'package:my_first_project/model/onboard_data.dart';
import 'package:my_first_project/size_configs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/components.dart';
import '../screens.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? PrimaryColor : SecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenonBoard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    super.initState();
    setSeenonBoard();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    Text(
                      onboardingContents[index].title,
                      style: kTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    Container(
                      height: sizeV * 50,
                      child: Image.asset(
                        onboardingContents[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: sizeV * 5,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: kBodyText1,
                        children: const [
                          TextSpan(text: 'WE CAN '),
                          TextSpan(
                            text: 'HELP YOU ',
                            style: TextStyle(color: PrimaryColor),
                          ),
                          TextSpan(text: 'TO PROTECT '),
                          TextSpan(
                            text: 'YOUR KIDS ',
                            style: TextStyle(color: PrimaryColor),
                          ),
                          TextSpan(text: 'FROM DANGER '),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    currentPage == onboardingContents.length - 1
                        ? MyTextButton(
                            buttonName: 'Get Started',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            bgColor: PrimaryColor,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OnBoardNavBtn(
                                name: 'Skip',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                              ),
                              Row(
                                children: List.generate(
                                  onboardingContents.length,
                                  (index) => dotIndicator(index),
                                ),
                              ),
                              OnBoardNavBtn(
                                name: 'Next',
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                },
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
    );
  }
}
