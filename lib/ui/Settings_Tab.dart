import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<String> items = ['English', 'Arabic'];
  String SelectedValue = 'English';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 20,),
          DropdownButton2(
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: SelectedValue,
            onChanged: (value) {
              setState(() {
                SelectedValue = value as String;
              });
            },
            iconEnabledColor: Colors.green,
            buttonDecoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
              ),
          ),
            buttonHeight: 50,
            buttonWidth: 300,
            buttonPadding: EdgeInsets.all(8),
          )
        ],
      ),
    );
  }
}
