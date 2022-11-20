import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practicaldemo/task1/Constants/custom_colors.dart';
import 'package:practicaldemo/task1/screens/login_screen.dart';
import 'package:practicaldemo/task2/UI/view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPop(context),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'A simple To do List with Crud operation(Insert , update , delete, etc..).. with Firebase integration..',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Container(
                width: 150,
                color: CustomColors.greyColor,
                child: TextButton(
                  child: const Text(
                    'Task: 1',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                )),
            const SizedBox(height: 50),
            const Text(
              'API Calling Task. You can use Any free API to do this task…( ex. News API..https://newsapi.org/)Focus on designing part as well.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Container(
                width: 150,
                color: CustomColors.greyColor,
                child: TextButton(
                  child: const Text(
                    'Task: 2',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewsScreen(),
                    ));
                  },
                )),
          ],
        ),
      ),
    );
  }

  Future<bool> _willPop(BuildContext context) async {
    SystemNavigator.pop();
    return false;
  }
}
