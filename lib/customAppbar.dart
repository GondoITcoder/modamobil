import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
 final List<Widget> kTabs;
  final String title;
 final double _prefferedHeight = 90.0;

  CustomAppbar({Key key, this.kTabs, this.title}) : super(key: key);
   @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
          centerTitle: true,
          title: Text(title,style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
            tabs: kTabs,
          ),
        );
  }

  @override

  Size get preferredSize =>Size.fromHeight(_prefferedHeight);

}

