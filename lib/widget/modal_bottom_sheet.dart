import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  final double height;
  final double topCircular;
  final double width;
  final String title;
  final Widget content;
  const ModalBottomSheet({
    Key? key,
    required this.content,
    required this.title,
    this.height = 160,
    this.topCircular = 10,
    this.width = double.infinity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        // color: ThemeColorsDark.options,
        color: const Color.fromARGB(255, 77, 77, 77),
        borderRadius: BorderRadius.vertical(top: Radius.circular(topCircular)),
      ),
      width: width,
      height: height,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                content,
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16),
            height: 64,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 77, 77, 77),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  height: 4,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
