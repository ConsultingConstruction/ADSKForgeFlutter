import 'package:adsk_forge_flutter/classes/lateralMenuDrawer.dart';

import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

class HubsView extends StatefulWidget {
  const HubsView({Key? key}) : super(key: key);

  @override
  _HubsViewState createState() => _HubsViewState();
}

class _HubsViewState extends State<HubsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hubs'),
        ),
        drawer: LateralMenuDrawer(),
      ),
    );
  }
}
