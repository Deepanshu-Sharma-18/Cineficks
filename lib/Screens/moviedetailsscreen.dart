import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapi/Models/moviecast.dart';
import 'package:moviesapi/services/loadimage.dart';
import 'package:moviesapi/services/services.dart';
import 'package:moviesapi/widget/datetime.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late String imageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late IconData bookmark = Icons.bookmark_add_outlined;
    late String? companyIcon = null;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: FutureBuilder(
            future: BaseClient(page: widget.id).getMovieDetail(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.orange,
                ));
              }
              if (snapshot.hasError) {
                return Text(
                  ' this is error ${snapshot.error}',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                    child: Text("get() returns null!",
                        style: TextStyle(fontSize: 20, color: Colors.green)));
              }

              imageUrl = loadImage(snapshot.data!.posterPath!);
              companyIcon =
                  loadImage(snapshot.data!.productionCompanies![0].logoPath!);

              return CustomScrollView(slivers: [
                SliverAppBar(
                  pinned: true,
                  collapsedHeight: 80,
                  expandedHeight: 600,
                  backgroundColor: Colors.orange,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      imageUrl,
                      width: double.maxFinite,
                      fit: BoxFit.fill,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0),
                    child: Container(
                      height: 30,
                      //padding: EdgeInsets.symmetric(horizontal: 5),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                          color: Colors.black),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          snapshot.data!.title.toString(),
                          style: GoogleFonts.alegreya(
                            color: Colors.orange,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      IconButton(
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
                        iconSize: 30,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color.fromARGB(255, 56, 63, 60)),
                            child: Center(
                              child: Text(
                                getTimeString(snapshot.data!.runtime!),
                                style: GoogleFonts.notoSansOgham(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color.fromARGB(255, 56, 63, 60)),
                            child: Center(
                              child: Text(
                                snapshot.data!.releaseDate
                                    .toString()
                                    .split('-')[0],
                                style: GoogleFonts.notoSansOgham(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Visibility(
                            visible: snapshot.data!.adult!,
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color.fromARGB(255, 56, 63, 60)),
                              child: Center(
                                child: Text(
                                  '18+',
                                  style: GoogleFonts.notoSansOgham(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3.0),
                                  child: Icon(
                                    Icons.star_rate,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Center(
                                  child: Text(
                                    snapshot.data!.voteAverage!
                                        .floorToDouble()
                                        .toString(),
                                    style: GoogleFonts.notoSansOgham(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 30,
                      width: double.maxFinite,
                      child: ListView.builder(
                        //shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data!.genres!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.orange, width: 2)),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Center(
                              child: Text(
                                snapshot.data!.genres![index].name!.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      snapshot.data!.overview.toString(),
                      style: GoogleFonts.notoSansOgham(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Watch On',
                      style: GoogleFonts.notoSansOgham(
                        color: Colors.orange,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Container(
                  width: double.maxFinite,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: FutureBuilder(
                    future: BaseClient(page: widget.id).getWatch(),
                    builder: (context, snapWatch) {
                      if (snapWatch.connectionState != ConnectionState.done) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: Colors.orange,
                        ));
                      }
                      if (snapWatch.hasError) {
                        return Text(
                          ' this is error ${snapWatch.error}',
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        );
                      }
                      if (!snapWatch.hasData) {
                        return const Center(
                            child: Text("get() returns null!",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green)));
                      }

                      if ((snapWatch.data!.results!.resultsIn?.flatrate
                                      ?.length !=
                                  0 &&
                              snapWatch.data!.results!.resultsIn?.flatrate
                                      ?.length !=
                                  null) ||
                          (snapWatch.data!.results!.us?.flatrate?.length != 0 &&
                              snapWatch.data!.results!.us?.flatrate?.length !=
                                  null)) {
                        return snapWatch.data!.results!.resultsIn?.flatrate
                                    ?.length !=
                                null
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: ScrollPhysics(),
                                itemCount: snapWatch
                                    .data!.results!.resultsIn!.flatrate!.length,
                                itemBuilder: ((context, index) {
                                  String? watchUrl = null;

                                  if (snapWatch.data!.results?.resultsIn
                                          ?.flatrate?[index].logoPath !=
                                      null) {
                                    watchUrl = loadImage(snapWatch
                                        .data!
                                        .results!
                                        .resultsIn!
                                        .flatrate![index]
                                        .logoPath!);
                                  }

                                  return Container(
                                    width: 90,
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  watchUrl == null
                                                      ? "https://www.shutterstock.com/image-vector/male-avatar-profile-picture-vector-600w-149083895.jpgCastUrl"
                                                      : watchUrl,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          snapWatch
                                                      .data!
                                                      .results
                                                      ?.resultsIn
                                                      ?.flatrate?[index]
                                                      .providerName !=
                                                  null
                                              ? snapWatch
                                                  .data!
                                                  .results!
                                                  .resultsIn!
                                                  .flatrate![index]
                                                  .providerName!
                                              : 'Not available',
                                          style: GoogleFonts.notoSansOgham(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }))
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: ScrollPhysics(),
                                itemCount: snapWatch
                                    .data!.results!.us!.flatrate!.length,
                                itemBuilder: ((context, index) {
                                  String? watchUrl = null;

                                  if (snapWatch.data!.results?.us
                                          ?.flatrate?[index].logoPath !=
                                      null) {
                                    watchUrl = loadImage(snapWatch
                                        .data!
                                        .results!
                                        .us!
                                        .flatrate![index]
                                        .logoPath!);
                                  }

                                  return Container(
                                    width: 90,
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  watchUrl == null
                                                      ? "https://www.shutterstock.com/image-vector/male-avatar-profile-picture-vector-600w-149083895.jpgCastUrl"
                                                      : watchUrl,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          snapWatch
                                                      .data!
                                                      .results
                                                      ?.us
                                                      ?.flatrate?[index]
                                                      .providerName !=
                                                  null
                                              ? snapWatch
                                                  .data!
                                                  .results!
                                                  .us!
                                                  .flatrate![index]
                                                  .providerName!
                                              : 'Not available',
                                          style: GoogleFonts.notoSansOgham(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }));
                      }
                      return Expanded(
                          child: Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Text(
                          'Not Available',
                          style: GoogleFonts.notoSansOgham(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ));
                    },
                  ),
                )),
                SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color.fromARGB(255, 56, 63, 60)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data!.budget!.toString(),
                                  style: GoogleFonts.notoSansOgham(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Budget',
                                  style: GoogleFonts.notoSansOgham(
                                    color: Colors.orange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color.fromARGB(255, 56, 63, 60)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data!.revenue!.toString(),
                                  style: GoogleFonts.notoSansOgham(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Revenue',
                                  style: GoogleFonts.notoSansOgham(
                                    color: Colors.orange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Cast',
                      style: GoogleFonts.notoSansOgham(
                        color: Colors.orange,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                SliverToBoxAdapter(
                    child: Container(
                  width: double.maxFinite,
                  height: 200,
                  child: FutureBuilder(
                    future: BaseClient(page: widget.id).getMovieCast(),
                    builder: (context, snapcast) {
                      if (snapcast.connectionState != ConnectionState.done) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: Colors.orange,
                        ));
                      }
                      if (snapcast.hasError) {
                        return Text(
                          ' this is error ${snapcast.error}',
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        );
                      }
                      if (!snapcast.hasData) {
                        return const Center(
                            child: Text("get() returns null!",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green)));
                      }

                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          itemCount: snapcast.data!.cast!.length,
                          itemBuilder: ((context, index) {
                            String? castUrl = null;

                            if (snapcast.data!.cast?[index].profilePath !=
                                null) {
                              castUrl = loadImage(
                                  snapcast.data!.cast![index].profilePath!);
                            }

                            return Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                          castUrl == null
                                              ? "https://www.shutterstock.com/image-vector/male-avatar-profile-picture-vector-600w-149083895.jpgCastUrl"
                                              : castUrl,
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapcast.data!.cast?[index].name != null
                                        ? snapcast.data!.cast![index].name!
                                        : 'Not available',
                                    style: GoogleFonts.notoSansOgham(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    snapcast.data!.cast![index].character !=
                                            null
                                        ? snapcast.data!.cast![index].character!
                                        : 'Not available',
                                    style: GoogleFonts.notoSansOgham(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }));
                    },
                  ),
                )),
                SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Similar Movies',
                      style: GoogleFonts.notoSansOgham(
                        color: Colors.orange,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 10),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    child: FutureBuilder(
                        future: BaseClient(page: widget.id).getSimilarMovies(),
                        builder: (context, snapsimilar) {
                          if (snapsimilar.connectionState !=
                              ConnectionState.done) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Colors.orange,
                            ));
                          }
                          if (snapsimilar.hasError) {
                            return Text(
                              ' this is error ${snapsimilar.error}',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.green),
                            );
                          }
                          if (!snapsimilar.hasData) {
                            return const Center(
                                child: Text("get() returns null!",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green)));
                          }

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: ScrollPhysics(),
                            itemCount: snapsimilar.data!.results!.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.all(15),
                                child: ListView.builder(
                                    itemCount:
                                        snapsimilar.data!.results!.length,
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(MovieDetailsScreen(
                                              id: snapsimilar
                                                  .data!.results![index].id!));
                                        },
                                        child: Container(
                                          width: 150,
                                          margin: EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  loadImage(snapsimilar
                                                      .data!
                                                      .results![index]
                                                      .posterPath!),
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }),
                          );
                        }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Production',
                      style: GoogleFonts.notoSansOgham(
                        color: Colors.orange,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                companyIcon == null
                                    ? "https://img.freepik.com/free-vector/question-mark-sign-brush-stroke-trash-style-typography-vector_53876-140880.jpg?w=740&t=st=1674923228~exp=1674923828~hmac=ecf6ca1973206b00c8095f03e29c4d0b58ddaac769d8af137e91007ce6610534"
                                    : companyIcon!,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            snapshot.data!.productionCompanies![0].name!,
                            style: GoogleFonts.notoSansOgham(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 40,
                )),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Reviews',
                      style: GoogleFonts.notoSansOgham(
                        color: Colors.orange,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 20,
                )),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    height: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 33, 33, 33),
                    ),
                    child: FutureBuilder(
                      future: BaseClient(page: widget.id).getReviews(),
                      builder: (context, snapreview) {
                        if (snapreview.connectionState !=
                            ConnectionState.done) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: Colors.orange,
                          ));
                        }
                        if (snapreview.hasError) {
                          return Text(
                            ' this is error ${snapreview.error}',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          );
                        }
                        if (!snapreview.hasData) {
                          return const Center(
                              child: Text("get() returns null!",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green)));
                        }

                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            itemCount: snapreview.data!.results!.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        snapreview
                                            .data!.results![index].author!,
                                        style: GoogleFonts.lato(
                                          color: Colors.orange,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapreview.data!.results?[index]
                                                  .content !=
                                              null
                                          ? snapreview
                                              .data!.results![index].content!
                                          : 'Not available',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }));
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 120),
                ),
              ]);
            }),
      ),
    );
  }
}
