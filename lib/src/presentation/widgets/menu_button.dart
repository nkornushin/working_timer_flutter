import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenHeight(34),
      left: 0,
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: ClipPath(
              clipper: CustomMenuClipper(),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(.56),
                      Colors.white.withOpacity(.22),
                    ],
                  ),
                ),
                width: getProportionateScreenWidth(52),
                height: getProportionateScreenHeight(79),
                child: Padding(
                  padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
                  child: const Icon(Icons.menu, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.transparent;

    final width = size.width;
    final height = size.height;

    Path path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(width + 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 0, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
