import 'package:flutter/material.dart';
import 'package:opp/design/colors.dart';
import 'package:opp/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
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
                        // Firebas
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ProfilePage()));
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
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
                    MyTextField(
                      readOnly: true,
                      hintText: 'Btech CSE',
                      icon: Icons.account_balance_rounded,
                    ),
                  ],
                )),
              ),
            ],
          ),
          bottomSheet: Container(
            height: 60,
            color: const Color(0xFFf5f5f8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  child: const Text("Update Profile",
                      style: TextStyle(color: Colors.white)),
                  height: 60,
                  color: buttonGreen,
                  minWidth: double.infinity,
                  onPressed: () {}),
            ),
          )),
    );
  }
}
