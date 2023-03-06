import 'package:flutter/material.dart';

class RowInfo extends StatelessWidget {
  const RowInfo({super.key, 
    required this.title,
    required this.data,
  });
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('$title: ', style: const TextStyle(fontSize: 19),),
        Text(data,style: const TextStyle(fontSize: 19)),
        const Spacer(),
      ],
    );
  }
}