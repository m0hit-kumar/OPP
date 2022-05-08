import 'package:flutter/material.dart';
import 'package:opp/floating_stat.dart';
import 'package:opp/pages/placement_offers.dart';
import 'package:opp/pages/placment_page.dart';
import 'package:opp/pages/profile.dart';
import 'package:opp/widgets/cards.dart';
// import 'package:opp/design/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                const Text(
                  "Categories",
                  style: TextStyle(
                      color: Color(0xFF130A33),
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.account_circle, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: const Color(0xFFf5f5f8),
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(17),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    CategoryCard(
                      subtitle: '200+',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlacmentPage2(),
                          ),
                        );
                      },
                      title: 'Placement',
                      url: 'assets/images/jobs.png',
                    ),
                    CategoryCard(
                      subtitle: '200+',
                      onTap: () {},
                      title: 'Practice',
                      url: 'assets/images/practice.png',
                    ),
                    CategoryCard(
                      subtitle: '200+',
                      onTap: () {},
                      title: 'Companies Visited',
                      url: 'assets/images/companies-visited.png',
                    ),
                    CategoryCard(
                      subtitle: '200+',
                      onTap: () {},
                      title: 'Consultation',
                      url: 'assets/images/consultation.png',
                    ),
                    CategoryCard(
                      subtitle: '200+',
                      onTap: () {},
                      title: 'Resume Builder',
                      url: 'assets/images/resume-builder.png',
                    ),
                  ],
                ),
              ),
            ),
        Container(
          alignment: Alignment.bottomCenter,
          // margin: EdgeInsets.all(8),
          child: FloatingStat(),
        )
          ])),
    );
  }
}
