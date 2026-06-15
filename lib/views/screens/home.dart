import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> places = [
      {
        "image": "assets/images/pic1.png",
        "title": "Alley Palace",
        "rate": "4.1",
      },
      {
        "image": "assets/images/pic2.png",
        "title": "Coeurdes Alpes",
        "rate": "4.5",
      },
    ];

    List<String> cate = ["Location", "Hotels", "Foods", "Adventure"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    Text(
                      "Aspen, USA",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "Aspen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(18),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Color.fromRGBO(243, 248, 254, 1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(width: 12),
                  Text(
                    "Find things to do",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
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
                        color:
                            selectedIndex == index
                                ? Colors.blue.shade100
                                : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          cate[index],
                          style: TextStyle(
                            color:
                                selectedIndex == index
                                    ? Colors.blue
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height:  12),

            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount: places.length,
                itemBuilder: (context, index) {
                 return  Container(
                   margin: EdgeInsets.all(15),
                    width: 188,
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(places[index]["image"]!),
                      ),
                    ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [

                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(59),
                           color: Colors.grey,
                         ),
                         child: Text(
                           places[index]["title"]!, style: TextStyle(
                           color: Colors.white,
                         ),
                         ),
                       ),
                       Row(
                         children: [
                           Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(59),
                               color: Colors.grey,
                             ),
                             child: Row(
                               children: [
                                 Icon(Icons.star, color: Colors.amber),
                                 Text(
                                   places[index]["rate"]!, style: TextStyle(
                                   color: Colors.white,
                                 ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
