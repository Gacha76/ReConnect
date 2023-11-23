import 'package:call_app/screen/call_screens/call_page.dart';
import 'package:flutter/material.dart';

class JoinCallPage extends StatefulWidget {
  const JoinCallPage({super.key});

  @override
  State<JoinCallPage> createState() => _JoinCallPageState();
}

class _JoinCallPageState extends State<JoinCallPage> {
  static const trimEdge = 20;
  final TextEditingController _callIdController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - trimEdge,
              child: TextFormField(
                controller: _callIdController,
                decoration: const InputDecoration(
                  hintText: "Please enter your call ID",
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width - trimEdge,
              child: TextFormField(
                controller: _userIdController,
                decoration: const InputDecoration(
                  hintText: "Please enter your user ID",
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width - trimEdge,
              child: TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  hintText: "Please enter your username",
                ),
              ),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _moveToCall();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text("Join the call"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _moveToCall() {
    if (_callIdController.text == '') {
      _showPopUp('call ID');
    } else if (_userIdController.text == '') {
      _showPopUp('user ID');
    } else if (_userNameController.text == '') {
      _showPopUp("username");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            callID: _callIdController.text,
            userID: _userIdController.text,
            username: _userNameController.text,
          ),
        ),
      );
    }
  }

  Future<void> _showPopUp(String attribute) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter all your details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Please enter your $attribute"),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
