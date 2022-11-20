import 'package:flutter/material.dart';
import 'package:practicaldemo/app.dart';

import '../Constants/app_bar_title.dart';
import '../Constants/custom_colors.dart';
import '../widgets/item_list.dart';
import 'add_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPop(context),
      child: Scaffold(
        backgroundColor: CustomColors.whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.whiteColor,
          title: AppBarTitle(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddScreen(),
              ),
            );
          },
          backgroundColor: CustomColors.blackColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: ItemList(),
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
