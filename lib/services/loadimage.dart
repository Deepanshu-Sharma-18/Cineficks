import 'package:flutter/cupertino.dart';

final url = "https://image.tmdb.org/t/p/w500";
String loadImage(String imagePath) {
  final imageUrl = url + imagePath;
  return imageUrl;
}
