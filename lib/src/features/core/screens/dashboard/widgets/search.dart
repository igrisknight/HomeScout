import 'package:flutter/material.dart';
import 'package:homescout/src/constants/text_string.dart';


class DashBoardSearchBox extends StatelessWidget {
  const DashBoardSearchBox({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(width: 4)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hDashBoardSearch,
            style: txtTheme.headlineMedium
                ?.apply(color: Colors.grey.withOpacity(0.5)),
          ),
          Icon(Icons.mic)
        ],
      ),
    );
  }
}