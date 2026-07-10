import 'package:flutter/material.dart';

class CateWidget extends StatefulWidget {
  const CateWidget({super.key});

  @override
  State<CateWidget> createState() => _CateWidgetState();
}

class _CateWidgetState extends State<CateWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> cate = ["Location", "Hotels", "Foods", "Adventure"];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: cate.length,
        itemBuilder: (context, index) {
          return InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 110,
              height: 41,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: selectedIndex == index
                    ? Colors.blue.shade100
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  cate[index],
                  style: TextStyle(
                    color: selectedIndex == index
                        ? Colors.blue
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
