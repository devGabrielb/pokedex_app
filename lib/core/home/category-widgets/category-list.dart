import 'package:flutter/material.dart';

import 'category-item.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: CategoryItem(
                  route: "/pokedex",
                  title: "Pokedex",
                  colors: [Color(0xFF46A487), Color(0xFF46D7AB)],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: CategoryItem(
                  title: "Abilities",
                  colors: [Color(0xFF64A9FA), Color(0xFF6DC1FD)],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: CategoryItem(
                  title: "Locations",
                  colors: [Color(0xFF7C538C), Color(0xFF9F5BBA)],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: CategoryItem(
                  title: "Moves",
                  colors: [Color(0xFFF7786B), Color(0xFFFA6555)],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: CategoryItem(
                  title: "Items",
                  colors: [Color(0xFFFFCE4B), Color(0xFFF6C747)],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: CategoryItem(
                  title: "Type Charts",
                  colors: [Color(0xFFB1736C), Color(0xFFCA8179)],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
