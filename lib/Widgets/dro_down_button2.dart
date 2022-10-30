import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Screens/gategory_page.dart';

// ignore: must_be_immutable
class DropDownButton2Widget extends StatefulWidget {
  const DropDownButton2Widget({super.key});

  @override
  State<DropDownButton2Widget> createState() => _DropDownButton2WidgetState();
}

class _DropDownButton2WidgetState extends State<DropDownButton2Widget> {
  final List<String> items = [
    'All',
    'jewelery',
    'men\'s clothing',
    'electronics',
    'women\'s clothing',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      hint: const Text(
        'Categories',
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      value: selectedValue,
      onChanged: ((value) {
        setState(() {
          selectedValue = value as String;
          Navigator.popAndPushNamed(context, CategoryPaga.id,
              arguments: selectedValue!);
        });
      }),
    ));
  }
}
