import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double waveDeep = size.height * 0.1;
    path.lineTo(0, size.height * .85);
    var firstControlPoint = Offset(size.width * .25, size.height + waveDeep);
    var firstEndPoint = Offset(size.width * .5, size.height * .75);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width * .75, size.height * .5);
    var secondEndPoint = Offset(size.width, size.height * .75);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    // path.lineTo(0, size.height * 0.85);
    // var firstControlPoint = Offset(size.width * .25, size.height);
    // var firstEndPoint = Offset(size.width * .5, size.height * .75);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstEndPoint.dx, firstEndPoint.dy);
    // var secondControlPoint = Offset(size.width * .75, size.height * .5);
    // var secondEndPoint = Offset(size.width, size.height * .75);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondEndPoint.dx, secondEndPoint.dy);
    // path.lineTo(size.width, 0);
    // path.close();
    // return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
