import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/helpers/utils.dart';
import 'package:qr_scanner_app/presentation/provider/scan_list_provider.dart';



class CustomListView extends StatelessWidget {
  
  final String type;
  const CustomListView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context); 
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) =>  Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.redAccent),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false).deleteScanById(scans[i].id);
        } ,
        child: ListTile(
          leading: Icon(
            type == 'http'
            ? Icons.web_asset_outlined
            : Icons.explore_sharp
            , color: Colors.white,),
          title: Text(scans[i].value),
          subtitle: Text(scans[i].id.toString()),
           trailing: const Icon(Icons.keyboard_arrow_right , color: Colors.white,),
           onTap: () => launchURL(context, scans[i]),
        ),
      ) );
  }
}