import 'package:flutter/material.dart';
import 'package:qr_scanner_app/presentation/widgets/custom_listview.dart';
class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(type: 'geo',);
  }
}
