import 'package:call_app/constants/enum.dart';
import 'package:call_app/constants/routes.dart';
import 'package:call_app/screen/call_screens/join_call_page.dart';
//import 'package:call_app/screen/firebase_chat_screens/firebase_chat_list_page.dart';
import 'package:call_app/screen/firebase_chat_screens/firebase_user_list_page.dart';
import 'package:call_app/screen/firebase_chat_screens/firebase_user_search_page.dart';
import 'package:call_app/service/firebase_firestore_service.dart';
import 'package:call_app/screen/profile_screens/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _MainAppState();
}

class _MainAppState extends State<StudentHomePage> {
  final _auth = FirebaseAuth.instance;
  int _selectedIndex = 0;
  final _pages = [
    const FirebaseUserListPage(),
    const Text('page-2'), //FirebaseChatListPage(),
    const JoinCallPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 23),
        actions: [
          PopupMenuButton<StudentMenuAction>(
            iconColor: Colors.white,
            onSelected: (value) async {
              switch (value) {
                case StudentMenuAction.logout:
                  signout();
                case StudentMenuAction.search:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const FirebaseUsersSearchPage(),
                    ),
                  );
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem<StudentMenuAction>(
                  value: StudentMenuAction.logout,
                  child: Text("Logout"),
                ),
                const PopupMenuItem<StudentMenuAction>(
                  value: StudentMenuAction.search,
                  child: Text("Search"),
                ),
              ];
            },
          )
        ],
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.connect_without_contact),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void signout() async {
    try {
      await FirebaseFirestoreService.updateUserData(
        {
          'lastActive': DateTime.now(),
          'isOnline': false,
        },
      );
      await _auth.signOut();
      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          loginRoute,
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      //TODO: Implement popup for each error
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.code);
      }
    }
  }
}
