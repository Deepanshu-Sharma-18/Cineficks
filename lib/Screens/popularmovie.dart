import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapi/Controller/popularcontroller.dart';
import 'package:moviesapi/Screens/moviedetailsscreen.dart';
import 'package:moviesapi/services/services.dart';
import 'package:moviesapi/widget/moviecard.dart';

class PopularMovie extends StatefulWidget {
  const PopularMovie({super.key});

  @override
  State<PopularMovie> createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  var popularScreenController = Get.find<PopularController>();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.black),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 22, 22, 22),
        body: Container(
          height: double.maxFinite,
          padding: EdgeInsets.all(0.1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'POPULAR',
                      style: GoogleFonts.dellaRespira(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Obx(
                  (() => popularScreenController.isDataLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: popularScreenController
                              .popularcontroller!.results!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (() => Get.to(MovieDetailsScreen(
                                    id: popularScreenController
                                        .popularcontroller!.results![index].id!,
                                  ))),
                              child: MovieCard(
                                title: popularScreenController
                                    .popularcontroller!.results![index].title!,
                                description: popularScreenController
                                    .popularcontroller!
                                    .results![index]
                                    .overview!,
                                imagePath: popularScreenController
                                    .popularcontroller!
                                    .results![index]
                                    .posterPath!,
                                rating: popularScreenController
                                    .popularcontroller!
                                    .results![index]
                                    .voteAverage!,
                                rel_year: popularScreenController
                                    .popularcontroller!
                                    .results![index]
                                    .releaseDate
                                    .toString(),
                                genresList: popularScreenController
                                    .popularcontroller!
                                    .results![index]
                                    .genreIds!,
                              ),
                            );
                          },
                        )),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      (() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              popularScreenController.currpage > 1
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          popularScreenController.currpage--;
                                          popularScreenController
                                              .popualardata();
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_left_outlined,
                                            size: 30,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            'Previous',
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      width: 60,
                                    ),
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                '${popularScreenController.currpage}',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              popularScreenController.currpage <
                                      popularScreenController.totpage.value
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          popularScreenController.currpage++;
                                          popularScreenController
                                              .popualardata();
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            ' Next',
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.arrow_right_outlined,
                                            size: 30,
                                            color: Colors.orange,
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      width: 60,
                                    ),
                            ],
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
