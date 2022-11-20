import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../Constants/custom_colors.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPop(context),
      child: GestureDetector(
        onTap: () => _uidFocusNode.unfocus(),
        child: Scaffold(
          backgroundColor: CustomColors.whiteColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.ac_unit,
                    size: 100,
                  ),
                  Center(
                    child: FutureBuilder(
                      future: _initializeFirebase(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                            'Error initializing Firebase',
                            style: TextStyle(color: CustomColors.whiteColor),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return LoginForm(focusNode: _uidFocusNode);
                        }
                        return CircularProgressIndicator(
                          color: CustomColors.blackColor,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _willPop(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
    return false;
  }
}
