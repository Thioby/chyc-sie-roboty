import 'package:chyc_sie_roboty/presentation/filters/courses/courses_filters_page.dart';
import 'package:flutter/material.dart';

class SelectCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(categories()[index]),
          onTap: () {
            Navigator.pop(context, categories()[index]);
          },
        );
      }),
    );
  }
}
