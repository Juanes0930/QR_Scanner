import 'package:flutter/material.dart';
import 'package:qr_scanner_app/infraestructure/models/scan_model.dart';

import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  //final Uri url = Uri.parse(scan.value);

  if (scan.type == 'http') {
    //open site
    if (!await canLaunchUrl(Uri.parse(scan.value))) {
      await launchUrl(Uri.parse(scan.value));
    } else {
      throw ('could not launch');
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
