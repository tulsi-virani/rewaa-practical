import 'package:flutter/material.dart';

import 'custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.ac_unit,
          color: CustomColors.blackColor,
        ),
        SizedBox(width: 8),
        Text(
          'CRUD OPERATIONS',
          style: TextStyle(
            color: CustomColors.blackColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
