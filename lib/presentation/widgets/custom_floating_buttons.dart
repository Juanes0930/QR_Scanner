import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});


  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus_outlined),
      onPressed: (){});
  }
}