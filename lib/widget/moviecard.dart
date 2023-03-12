import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:moviesapi/Controller/genrecontroller.dart';
import 'package:moviesapi/Models/Genres.dart';
import 'package:moviesapi/services/loadimage.dart';
import 'package:moviesapi/services/services.dart';

class MovieCard extends StatefulWidget {
  const MovieCard(
      {super.key,
      required this.title,
      required this.description,
      required this.imagePath,
      required this.rating,
      required this.rel_year,
      required this.genresList});

  final String description;
  final List<int> genresList;
  final String imagePath;
  final double rating;
  final String rel_year;
  final String title;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  late IconData bookmark = Icons.bookmark_add_outlined;
  late String imageUrl;
  late String year = widget.rel_year.split('-')[0];

  @override
  void initState() {
    super.initState();
    imageUrl = loadImage(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    final genreScreenController = Get.find<GenreController>();
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 200,
      width: double.maxFinite,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 170,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 170,
                    width: 180,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          width: 170,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                overflow: widget.title.length > 45
                                    ? TextOverflow.ellipsis
                                    : TextOverflow.visible),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          year,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          // child: FutureBuilder(
                          //   builder: (context, snapshot) {
                          //     if (snapshot.connectionState !=
                          //         ConnectionState.done) {
                          //       return Center(
                          //           child: CircularProgressIndicator(
                          //         color: Colors.orange,
                          //       ));
                          //     }
                          //     if (snapshot.hasError) {
                          //       return Text(
                          //         ' this is error ${snapshot.error}',
                          //         style: TextStyle(
                          //             fontSize: 20, color: Colors.green),
                          //       );
                          //     }
                          //     if (!snapshot.hasData) {
                          //       return const Center(
                          //           child: Text("get() returns null!",
                          //               style: TextStyle(
                          //                   fontSize: 20,
                          //                   color: Colors.green)));
                          //     }

                          //return
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.genresList.length,
                              itemBuilder: ((context, index) {
                                int indexof = 0;
                                for (int i = 0;
                                    i <
                                        genreScreenController
                                            .genrecontroller!.genres!.length;
                                    //snapshot.data!.genres!.length;
                                    i++) {
                                  if (widget.genresList[index] ==
                                          genreScreenController
                                              .genrecontroller!.genres![i].id
                                      // snapshot.data!.genres![i].id
                                      ) {
                                    indexof = i;
                                  }
                                }
                                return Container(
                                  padding: index == 0
                                      ? EdgeInsets.only(right: 5)
                                      : EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    //snapshot.data!.genres![indexof].name
                                    genreScreenController
                                        .genrecontroller!.genres![indexof].name
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              })),
                          //;
                          //   },
                          //   future: BaseClient(page: 0).getGenres(),
                          // ),
                        )
                      ]),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 180,
            child: Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_rate,
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    widget.rating.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 120,
            child: IconButton(
              onPressed: () {
                if (bookmark == Icons.bookmark_add_outlined) {
                  setState(() {
                    bookmark = Icons.bookmark_added_outlined;
                  });
                } else {
                  setState(() {
                    bookmark = Icons.bookmark_add_outlined;
                  });
                }
              },
              icon: Icon(bookmark),
              iconSize: 27,
              color: Colors.orange,
            ),
          ),
          Positioned(
              left: 10,
              top: 0,
              child: Container(
                height: 200,
                width: 150,
                child: Image.network(imageUrl, fit: BoxFit.fill),
              ))
        ],
      ),
    );
  }
}
