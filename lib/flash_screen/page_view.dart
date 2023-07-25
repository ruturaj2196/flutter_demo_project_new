import 'package:flutter/material.dart';
import 'package:flutter_practice/flutter_habit/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewPages extends StatefulWidget {
  const ViewPages({super.key});

  @override
  State<ViewPages> createState() => _ViewPagesState();
}

class _ViewPagesState extends State<ViewPages> {
  bool onLastPage = false;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            PageOne(),
            PageTwo(),
            PageThree(),
          ],
        ),
        Align(
          alignment: const Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    controller.jumpToPage(2);
                  });
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                // effect: const WormEffect(
                //   dotHeight: 16,
                //   dotWidth: 16,
                //   activeDotColor: Colors.white,
                // ),
                // effect: ExpandingDotsEffect(
                //     dotColor: Colors.white,
                //activeDotColor: Colors.red,
                //),
                effect: const JumpingDotEffect(
                  verticalOffset: 20,
                  activeDotColor: Colors.white,
                ),
              ),
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const HomePage(),
                            ),
                          );
                        });
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 192, 187),
      child: const Center(
        child: Text(
          'Page1',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 130, 199, 254),
      child: const Center(
        child: Text(
          'Page2',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 238, 143, 255),
      child: const Center(
        child: Text(
          'Page3',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
