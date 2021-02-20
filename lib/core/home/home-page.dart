import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'category-widgets/category-list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white.withOpacity(0.2),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          right: -93,
                          top: 0,
                          child: SvgPicture.asset(
                            "assets/pokebola_transparent.svg",
                            color: Color(0xFF303943).withOpacity(0.05),
                            width: 249,
                            height: 249,
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 117, left: 26, right: 26),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 50),
                                    child: Text(
                                      "What Pokemon\nare you looking for?",
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF303943),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  SearchWidget(),
                                  SizedBox(
                                    height: 42,
                                  ),
                                  CategoryList(),
                                ],
                              ),
                            )),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Color(0xFF303943).withOpacity(0.05),
          filled: true,
          border: InputBorder.none,
          prefixIcon: Container(
            margin: EdgeInsets.only(left: 15),
            height: 45,
            width: 45,
            child: Center(
              child: Icon(
                Icons.search,
                color: Color(0xFF303943),
              ),
            ),
          ),
          hintText: 'Search Pokemon, Move, Ability etc',
          hintStyle: TextStyle(
              color: Color(0xFF303943).withOpacity(0.4),
              fontSize: 18,
              fontWeight: FontWeight.w900),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.transparent,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Color(0xFF303943).withOpacity(0.4),
              )),
        ),
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
