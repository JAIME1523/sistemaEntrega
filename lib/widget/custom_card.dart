import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.widget,
    this.height = 170,
    required this.onTap,
  });

  final Widget widget;
  final Function onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          height: height,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(4, 6),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(colors: [
                Color(0xff6989F5),
                Color(0xff906ef5),
              ])),
          child: Row(
            children: [
              Expanded(child: widget),
              SizedBox(
                width: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(FontAwesomeIcons.arrowRight),
                    Text('Info')
                  ],
                ),
              )
            ],
          )),
    );
  }
}
