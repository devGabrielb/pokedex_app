import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/core/pokedex/controller/pokedex-controller.dart';
import 'package:pokedex_app/core/pokedex/widgets/list-pokedex/pokedex-item.dart';
import 'package:pokedex_app/core/pokedex/widgets/list-pokedex/pokedex-list.dart';
import 'package:pokedex_app/locator.dart';

import 'package:pokedex_app/utils/poke_icons.dart';

class PokedexPage extends StatefulWidget {
  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage>
    with SingleTickerProviderStateMixin {
  PokedexController controller;

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  final double _fabHeight = 56.0;

  @override
  void initState() {
    super.initState();
    controller = locator.get<PokedexController>();
    controller.getPokedex();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });

    _animationIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _buttonColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.00, 1.00, curve: Curves.linear)));

    _translateButton = Tween(begin: _fabHeight, end: -14.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.75, curve: _curve)));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buttonAdd() {
    return Container(
      child: FloatingActionButton(
        heroTag: "add",
        onPressed: () {},
        tooltip: "add",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buttonEdit() {
    return Container(
      child: FloatingActionButton(
        heroTag: "edit",
        onPressed: () {},
        tooltip: "Edit",
        child: Icon(Icons.edit),
      ),
    );
  }

  Widget _buttonDelete() {
    return Container(
      child: FloatingActionButton(
        heroTag: "delete",
        onPressed: () {},
        tooltip: "delete",
        child: Icon(Icons.delete),
      ),
    );
  }

  Widget _buttonToggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: "principal",
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: "Toggle",
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationIcon,
        ),
      ),
    );
  }

  void animate() {
    if (!isOpened)
      _animationController.forward();
    else
      _animationController.reverse();
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 3.0, 0.0),
            child: _buttonAdd(),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 2.0, 0.0),
            child: _buttonEdit(),
          ),
          Transform(
            transform:
                Matrix4.translationValues(0.0, _translateButton.value, 0.0),
            child: _buttonDelete(),
          ),
          _buttonToggle()
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: this.controller.isLoading,
        builder: (context, value, child) {
          return !value
              ? NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        elevation: 0,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                        backgroundColor: Colors.white.withOpacity(0.2),
                        expandedHeight: 200.0,
                        floating: true,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text(
                            "Podedex",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF303943),
                            ),
                          ),
                        ),
                      )
                    ];
                  },
                  body: Container(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    color: Colors.white.withOpacity(0.2),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Expanded(child: PokedexList()),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
