import 'package:adsk_forge_flutter/classes/lateralMenuDrawer.dart';
import 'package:adsk_forge_flutter/components/componentsLibrary.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  _AccountViewState createState() => _AccountViewState();
}

class Business {
  String name;

  Business({
    this.name = '',
  });
}

class _AccountViewState extends State<AccountView> {
  // Business list
  List<Business>? businessList;
  // = [
  //   Business(name: 'Business 1'),
  //   Business(name: 'Business 2')
  // ];

  Business? selectedBusiness;
  @override
  Widget build(BuildContext context) {
    if (selectedBusiness == null) {
      selectedBusiness = businessList?[0];
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      drawer: LateralMenuDrawer(),
      body: Center(
        child: Column(
          children: [
            // * Account settings
            Padding(
              padding: EdgeInsets.only(
                top: 25,
              ),
              child: Text(
                'Account Name',
                textScaleFactor: 3,
              ),
            ),
            Text(
              'Account Email',
              textScaleFactor: 1.5,
            ),
            ActionButtonComponent(
              width: 500,
              verticalPadding: 25,
              horizontalPadding: 25,
              labelText: 'Change password',
              borderRadius: 10,
              height: 50,
              onPressedCallback: () {},
              onLongPressedCallback: () {},
            ),
            Divider(),
            // * Business settings
            Text(
              'Business',
              textScaleFactor: 3,
            ),
            if (businessList != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      'Selected business:',
                      textScaleFactor: 1.5,
                    ),
                  ),
                  DropdownButton(
                    value: selectedBusiness,
                    onChanged: (newValue) {
                      selectedBusiness = newValue as Business;
                      setState(() {});
                    },
                    items:
                        businessList?.map<DropdownMenuItem<Business>>((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value.name,
                          textScaleFactor: 1.25,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              )
            else
              Text(
                'No businesses',
                textScaleFactor: 1.5,
              ),
            if (businessList != null)
              ActionButtonComponent(
                width: 500,
                topPadding: 25,
                horizontalPadding: 25,
                labelText: 'Manage business',
                borderRadius: 10,
                height: 50,
                onPressedCallback: () {},
                onLongPressedCallback: () {},
              ),
            ActionButtonComponent(
              width: 500,
              topPadding: 25,
              horizontalPadding: 25,
              labelText: 'Add business',
              borderRadius: 10,
              height: 50,
              borderColor: Colors.green,
              highlightColor: Colors.green.shade900,
              hoverColor: Colors.green,
              onPressedCallback: () {},
              onLongPressedCallback: () {},
            ),
          ],
        ),
      ),
    ));
  }
}
