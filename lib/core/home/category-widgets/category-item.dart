import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String route;
  final List<Color> colors;
  const CategoryItem({Key key, this.title = "", this.route = "", this.colors})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          if (this.route.isNotEmpty) Navigator.pushNamed(context, this.route);
        },
        child: Container(
          width: 155,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [this.colors[0], this.colors[1]],
              )),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: -15,
                child: SvgPicture.asset(
                  "assets/pokebola_transparent.svg",
                  color: Colors.white.withOpacity(0.2),
                  width: 80,
                  height: 80,
                ),
              ),
              Positioned(
                top: -50,
                left: -55,
                child: SvgPicture.asset(
                  "assets/pokebola_transparent.svg",
                  color: Colors.white.withOpacity(0.2),
                  width: 80,
                  height: 80,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(this.title,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
