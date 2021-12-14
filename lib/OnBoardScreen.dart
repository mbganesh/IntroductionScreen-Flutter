import 'package:flutter/material.dart';
import 'package:intro_screen/HomeScreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: 'You Have Home Page',
                body: "Yes you really have a home page.",
                image: buildImage('assets/pic1.jpg'),
                decoration: getDecoration()),
            PageViewModel(
                title: 'You Have Tab Screen Page',
                body: "Yes you really have a Tab Screen page.",
                image: buildImage('assets/pic2.jpg'),
                decoration: getDecoration()),
            PageViewModel(
              title: 'You Have Dood Page',
              body: "Yes you really have a Dood page.",
              image: buildImage('assets/pic3.jpg'),
              decoration: getDecoration(),
            ),
            PageViewModel(
                title: 'You Have Home Page',
                body: "Yes you really have a home page.",
                image: buildImage('assets/pic1.jpg'),
                decoration: getDecoration(),
                footer: TextButton(
                    onPressed: () => gotoHome(context),
                    child: Text("Lets Start"))),
          ],
          done: Text("Launch Now"),
          onDone: () => gotoHome(context),
          showNextButton:
              true, // without showNextButton and *next* propertie i got error. :/
          next: Icon(Icons.arrow_forward),
// showing skip button
          showSkipButton: true,
          skip: Text("Skip"),
          onSkip: () => gotoHome(context),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print("Your in $index Screen."),
          isProgressTap:
              false, // isProgressTap is false you cant select bottom dot botton || default value is true.
          // freeze: true,    // freeze true means you cant left & right slide
          // globalBackgroundColor: Theme.of(context).primaryColor,
          animationDuration: 1000,

          skipFlex: 0,
          nextFlex: 0,
        ),
      );
}

void gotoHome(BuildContext context) => Navigator.of(context)
    .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));

Widget buildImage(String path) => Center(
      child: Image.asset(path),
    ); // just use arrow function { => }

DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xffbdbdbd),
    size: Size(10, 10),
    activeSize: Size(25, 15),
    activeColor: Colors.blue,
    activeShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)));

PageDecoration getDecoration() => PageDecoration(
    titleTextStyle: TextStyle(
        fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 18),
    descriptionPadding: EdgeInsets.all(5),
    imagePadding: EdgeInsets.all(5),
    pageColor: Colors.white);
