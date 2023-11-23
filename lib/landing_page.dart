import 'package:call_app/call_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController callIdController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                controller: callIdController,
                decoration: const InputDecoration(
                  hintText: "Please enter call ID",
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                controller: userIdController,
                decoration: const InputDecoration(
                  hintText: "Please enter your user ID",
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                controller: userNameController,
                decoration: const InputDecoration(
                  hintText: "Please enter your username",
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallPage(
                      callID: callIdController.text,
                      userID: userIdController.text,
                      username: userNameController.text,
                    ),
                  ),
                );
              },
              child: const Text("Join the call"),
            ),
          ],
        ),
      ),
    );
  }
}
