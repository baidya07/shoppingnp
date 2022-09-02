import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';




class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.icon,required this.text});
  String icon;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({Key? key,
    this.items = const [],
    this.centerItemText,
    this.height = 62.0,
    this.iconSize = 22.0,
    this.backgroundColor,
    this.color,
    required this.selectedColor,
    this.onTabSelected,
  }) : super(key: key) {
    assert(items.length == 4 || items.length == 5);
  }
  final List<FABBottomAppBarItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color selectedColor;
  final ValueChanged<int>? onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  MediaQueryData? queryData;
  int _selectedIndex = 0;

 void _updateIndex(int index) {
   if(widget.onTabSelected!=null)
    widget.onTabSelected!(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    final items = List<Widget>.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
   required FABBottomAppBarItem item,
   required int index,
   required ValueChanged<int> onPressed,
  }) {
    final color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: Container(
        color: _selectedIndex == index ? widget.selectedColor.withOpacity(0.1) : widget.color,
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,

          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(item.icon, color: color,height: queryData!.size.height * 0.027,),
                // Image(
                //   image: AssetImage(item.icon),
                //   color: color,
                //   height: queryData.size.height * 0.035,
                //
                //   // item.icon,
                //   // size: queryData.size.height * 0.035,
                //   // color: color,
                // ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  item.text,
                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                ),
                //  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
