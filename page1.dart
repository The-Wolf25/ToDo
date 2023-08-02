import 'package:app3/screens/homescreen.dart';
import 'package:app3/screens/utils/myroutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  bool islastpg = false;
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: Container(
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => islastpg = index == 1);
            },
            children: [
              Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 80),
                      child: Container(
                        width: 480,
                        height: 420,
                        child: Image.asset('assets/images/batman2.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'To be a hero , you need to get few things done and be responsible.',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 1, 37, 2),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 140),
                      child: Container(
                        width: 400,
                        height: 350,
                        child: Image.asset('assets/images/tate.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'Get It Done helps to manage youre tasks.Time to escape the matrix!',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: (islastpg)
          ? TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  minimumSize: Size.fromHeight(60)),
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => home()));
                setState(() {});
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ))
          : Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                          onPressed: (() => controller.jumpToPage(1)),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 2,
                        effect: WormEffect(
                            activeDotColor: Colors.black,
                            dotColor: Colors.grey,
                            spacing: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                          onPressed: (() => controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInCirc)),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
