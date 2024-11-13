import 'package:bloodmotivation/registration.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:hopeflow/dbhealper.dart';
// import 'package:hopeflow/user.dart';

import 'dbhelper.dart';
import 'doner.dart';

class house extends StatefulWidget {
  const house({super.key});

  @override
  State<house> createState() => _houseState();
}

class _houseState extends State<house> {
  Dbhealper dbhealper = Dbhealper();
  List<User> donorList = [];

  @override
  void initState() {
    super.initState();
    fetchDonors();
  }

  Future<void> fetchDonors() async {
    final List<User>? donors = await dbhealper.getAllUsers(); // Method to fetch all users
    setState(() {
      donorList = donors!;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/laptop.png",
      "assets/images/share.webp",
      "assets/images/poster.jpg",
      "assets/images/camp.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Text(
            "BLOOD DONATION",
            style: TextStyle(color: Colors.brown),
            textDirection: TextDirection.rtl,
          ),
        ),
        leading: Image.asset("assets/images/CARING.png", width: 60, height: 40),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return Container(
                width: double.infinity,
                color: Colors.blue,
                child: Image.asset(
                  images[itemIndex],
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              height: 300,

              viewportFraction: 0.8,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade800,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 10,
            ),
            child: Text(
              "Register to Donate",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),

          // Donor List Section
          Expanded(
            child: donorList.isEmpty
                ? Center(child: Text("No donors found."))
                : ListView.builder(
              itemCount: donorList.length,
              itemBuilder: (context, index) {
                final donor = donorList[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ListTile(
                    title: Text(donor.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone: ${donor.ph}"),
                        Text("Age: ${donor.age}"),
                        Text("Blood Group: ${donor.blood}"),
                        Text("Gender: ${donor.gender}"),
                        Text("Last Donation: ${donor.donated}"),
                        Text("Weight: ${donor.weight}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.deepPurple.shade100,
    );
  }
}