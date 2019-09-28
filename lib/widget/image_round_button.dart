import 'package:flutter/material.dart';

class RoundImageButton extends StatelessWidget {
  final Widget image;
  final Function onTap;

  const RoundImageButton({Key key, this.image, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: GestureDetector(
          child: image,
          onTap: onTap,
        ),
      );
}
