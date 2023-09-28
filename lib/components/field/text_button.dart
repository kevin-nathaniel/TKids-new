import 'package:flutter/material.dart';
import 'package:my_first_project/app_styles.dart';
import 'package:my_first_project/size_configs.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.onPressed,
    required this.btnName,
    required this.bgColor,
  }) : super(key: key);
  final String btnName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 15.5,
        width: SizeConfig.blockSizeV! * 100,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            btnName,
            style: kBodyText1,
          ),
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
          ),
        ),
      ),
    );
  }
}
