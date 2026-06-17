import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/places/place_bloc.dart';
import '../../logic/blocs/places/place_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 12),

            BlocBuilder<PlacesBloc, PlacesState>(
              builder: (context, state) {
                if (state is PlacesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is PlacesSuccess) {
                  return SizedBox(
                    height: 250,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.places.length,
                      itemBuilder: (context, index) {
                        final place = state.places[index];

                        return Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 188,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),

                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(place.image),
                            ),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.6),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Text(
                                  place.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                ),

                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.6),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),

                                    const SizedBox(width: 4),

                                    Text(
                                      place.rate,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
