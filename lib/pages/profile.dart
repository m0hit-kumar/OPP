import 'package:flutter/material.dart';
import 'package:opp/widgets/custom_textfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                const Text(
                  "Profile",
                  style: TextStyle(
                      color: Color(0xFF130A33),
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFf5f5f8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.logout_rounded,
                        size: 20, color: Colors.red),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
                  ),
                ),
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(radius: 40),
                  ),
                  Text(
                    "11192521",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  MyTextField(
                    hintText: 'mohit@gmail.com',
                    icon: Icons.email,
                  ),
                  MyTextField(
                    readOnly: true,
                    hintText: '9876543210',
                    icon: Icons.phone,
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
