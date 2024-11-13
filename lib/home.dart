//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'dart:async';

import 'package:flutter/material.dart';

import 'house.dart';

class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  PageController _pageController = PageController(initialPage: 0);
  //creating object of page controller to manage page transations
  int _currentPage = 0; // Track the current page index
  List<Widget> pages = [Chat(), Status(), Call()];
  void navNext() {
    if (_currentPage == pages.length - 1) {
      // Navigate to Home page if the current page is the last one
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => house()),
      );
    } else {
      // Otherwise, go to the next page
      setState(() {
        _currentPage++;
      });

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }


  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the auto-scrolling functionality
    // _startAutoScroll();
  }

  // Method to start auto-scrolling pages
  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.redAccent,
      //   title: Center(child: Text("BLOOD DONATION ",style: TextStyle(color: Colors.brown),textDirection: TextDirection. rtl,)),
      //   leading: Image.asset("assets/images/CARING.png", width: 60, height: 40),actions: [
      //   IconButton(onPressed: (){
      //
      //   }, icon:Icon(Icons.settings) )
      // ],
      // ),
      body: Stack(
        children: [
          PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page; // Update the current page index
                });
              },
              children: pages),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (){  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => house()),
                  );


                  },
                  child: Text("Skip"),
                ),
                ElevatedButton(
                  onPressed: navNext,


                  child: Text("Next"),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,




















              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.blue
                        : Colors.grey, // Highlight current page
                  ),
                );
              }),
            ),
          ),
        ],
      ),

    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController controller;
  List<Widget> pages = [Chat(), Status(), Call()];
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Whasapp"),
            bottom: TabBar(
              indicator: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: controller,
              tabs: [
                Tab(
                  icon: Icon(Icons.chat),
                  text: "Chat",
                ),
                Tab(
                  icon: Icon(Icons.signal_wifi_statusbar_4_bar),
                  text: "Status",
                ),
                Tab(
                  icon: Icon(Icons.call),
                  text: "Call",
                )
              ],
            ),
          ),
          body: TabBarView(
            controller: controller,
            children: pages,
          ),
        ));
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          height: 9000,
          width: 1200,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/login.png",
                    height: 400,
                    width: 400,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      selectionColor: Colors.redAccent,
                      "GIVE THE GIFT OF LIFE DONATE BLOOD",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          decorationColor: Colors.redAccent,
                          decorationStyle: TextDecorationStyle.wavy,
                          decorationThickness: 2.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
      child: Container(
        height: 9000,
        width: 1200,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/abz.jpg",
                  height: 500,
                  width: 500,
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    selectionColor: Colors.redAccent,
                    "Your little effort can give others second chance to live life.",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        decorationColor: Colors.redAccent,
                        decorationStyle: TextDecorationStyle.wavy,
                        decorationThickness: 2.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
























      backgroundColor: Colors.green,
    );
  }
}

class Call extends StatelessWidget {
  const Call({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Expanded(
      child: Container(
        height: 9000,
        width: 1200,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 500,
                  width: 500,
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    selectionColor: Colors.redAccent,
                    "Be a Life Guard. Give blood to save life.",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        decorationColor: Colors.redAccent,
                        decorationStyle: TextDecorationStyle.wavy,
                        decorationThickness: 2.0),
                  ),
                ),
              ),
            )
          ],
        ),

      ),
    ),















      backgroundColor: Colors.blue,
    );
  }
}
