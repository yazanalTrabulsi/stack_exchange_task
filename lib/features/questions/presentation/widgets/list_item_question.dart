import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_exchange_task/core/themes/colors_theme.dart';

Widget listItemQuestion(BuildContext context, item, int index) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: InkWell(
      onTap: () async {
        if (kDebugMode) {
          print('my index $index');
        }
      },
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      // Set the selected item when the card is tapped
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: ThemeColor.shadow,
            blurRadius: 50,
            offset: Offset(0, 5),
          )
        ]),
        child: Card(
          color: ThemeColor.white,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: ListTile(
            dense: false,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            title: Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                item.title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.primary),
              ),
            ),
            subtitle: Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: Text(
                  item.link,
                  style: const TextStyle(fontSize: 18, color: ThemeColor.pink),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
