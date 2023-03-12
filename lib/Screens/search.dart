import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapi/Screens/moviedetailsscreen.dart';
import 'package:moviesapi/services/services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 50, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      controller: searchController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 18),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(15),
                            child: Icon(Icons.search_rounded),
                            width: 18,
                          )),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.orange),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (searchController.text != '') {
                            visibility = true;
                          } else {
                            visibility = false;
                          }
                          FocusManager.instance.primaryFocus?.unfocus();
                        });
                      },
                      color: Colors.white,
                      icon: Icon(Icons.search_sharp),
                      iconSize: 40,
                    ),
                  )
                ],
              ),
              visibility == true
                  ? Container(
                      height: 600,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 5, right: 5, top: 30),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 41, 41, 41),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          )),
                      child: FutureBuilder(
                          future: BaseClient(page: 1)
                              .getSearch(searchController.text),
                          builder: (context, snapcast) {
                            if (snapcast.connectionState !=
                                ConnectionState.done) {
                              return Center(
                                  child: CircularProgressIndicator(
                                color: Colors.orange,
                              ));
                            }
                            if (snapcast.hasError) {
                              return Text(
                                ' this is error ${snapcast.error}',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green),
                              );
                            }

                            return snapcast.data!.results?.length != null
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: ScrollPhysics(),
                                    itemCount: snapcast.data!.results!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              MovieDetailsScreen(
                                                  id: snapcast.data!
                                                      .results![index].id!),
                                              curve: Curves.easeIn,
                                              duration:
                                                  Duration(milliseconds: 800));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapcast.data!.results?[index]
                                                            .title !=
                                                        null
                                                    ? snapcast.data!
                                                        .results![index].title!
                                                    : 'Not available',
                                                style:
                                                    GoogleFonts.notoSansOgham(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.white,
                                                thickness: 0.2,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                : Text(
                                    'No Results',
                                    style: GoogleFonts.notoSansOgham(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                          }),
                    )
                  : SizedBox(
                      height: 0,
                    ),
            ]),
          )),
    );
  }
}
