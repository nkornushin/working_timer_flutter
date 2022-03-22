import 'package:flutter/material.dart';
import 'package:working_timer_flutter/src/size_config.dart';

class NavigationDrawerItem extends StatelessWidget {
  const NavigationDrawerItem({Key? key, required this.title, required this.icon, required this.selected, required this.onPressed}) : super(key: key);

  final String title;
  final IconData icon;
  final Function() onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(8), bottom: getProportionateScreenHeight(13)),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: getProportionateScreenHeight(40),
          child: Container(
            decoration: BoxDecoration(
              color: selected ? Colors.white.withOpacity(.7) : Colors.transparent,
              borderRadius: selected
                  ? BorderRadius.only(
                      topRight: Radius.circular(getProportionateScreenWidth(20)),
                      bottomRight: Radius.circular(getProportionateScreenWidth(20)),
                    )
                  : BorderRadius.zero,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(19),
                ),
                Icon(
                  icon,
                  color: const Color(0xFF1F553E),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(19),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    color: const Color(0xFF1F553E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
