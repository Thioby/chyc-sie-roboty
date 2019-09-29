import 'package:chyc_sie_roboty/domain/data/course.dart';
import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:chyc_sie_roboty/presentation/course_detail/course_detail_result.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseDetailPage extends StatefulWidget {
  final Course course;

  CourseDetailPage(this.course);

  @override
  _CourseDetailPageState createState() => _CourseDetailPageState(course);
}

class _CourseDetailPageState extends State<CourseDetailPage> {

  final Course course;

  _CourseDetailPageState(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            child: _buildColumn(),
          ),
        ),
      ),
    );
  }

  Widget _buildColumn() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      IconButton(
        alignment: Alignment.centerLeft,
        icon: Icon(Icons.arrow_back),
        onPressed:() => Navigator.pop(context, CourseDetailResult.apply),
      ),
      SizedBox(height: 21),
      Text(
        course.createdBy,
        style: TextStyle(fontSize: 12, color: AppColors.azure),
      ),
      SizedBox(height: 9),
      Text(
        course.name,
        style: TextStyle(fontSize: 22, color: AppColors.darkBlueGrey),
      ),
      SizedBox(height: 7),
      Text(
        course.courseLocalization,
        style: TextStyle(fontSize: 14, color: AppColors.lightBlueGrey),
      ),
      SizedBox(height: 22),
      SizedBox(height: 1, child: const DecoratedBox(
        decoration: const BoxDecoration(
            color: AppColors.paleGrey57
        ),
      ),),
      SizedBox(height: 23),
      Text(
        course.description,
        style: TextStyle(fontSize: 14, color: AppColors.twilight, height: 1.5),
      ),
      SizedBox(height: 14),
      SizedBox(height: 1, child: const DecoratedBox(
        decoration: const BoxDecoration(
            color: AppColors.paleGrey57
        ),
      ),),
    ],
  );

}
