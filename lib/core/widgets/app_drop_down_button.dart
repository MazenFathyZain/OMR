import 'package:flutter/material.dart';
import 'package:omr/core/theming/colors.dart';

class AppDropDwonButton extends StatelessWidget {
  final dynamic value;
  final String? lable;
  final List? items;
  final void Function(dynamic)? onChanged;
  final dynamic dropdownMenuItemValue;

  const AppDropDwonButton({
    super.key,
    this.value,
    this.lable,
    this.items,
    this.onChanged,
    this.dropdownMenuItemValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(lable!),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          decoration: BoxDecoration(
            color: ColorsManager.lightestGray,
            border: Border.all(color: ColorsManager.lighterGray),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: DropdownButton(
            value: value!,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.transparent, // Remove underline
            ),
            onChanged: onChanged,
            dropdownColor: Colors.grey[100],
            items: items!.map<DropdownMenuItem>((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
