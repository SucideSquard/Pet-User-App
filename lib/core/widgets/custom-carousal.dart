import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:user_app/core/widgets/rounded-image.dart';

/// A widget to display a carousel of images.
class CarouselImage extends StatelessWidget {
  final List<String> imgList;
  final double carouselHeight;
  final double carouselViewportFraction;
  final double? width;

  /// Creates a carousel of images with the specified [imgList], [carouselHeight],
  /// [width], and [carouselViewportFraction].
  const CarouselImage({
    Key? key,
    required this.imgList,
    required this.carouselHeight,
    this.width,
    required this.carouselViewportFraction,
    required int height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imgList.map(
        (url) {
          return Builder(
            builder: (BuildContext context) => Container(
              margin: const EdgeInsets.all(10),
              child: RoundedImage(
                height: carouselHeight,
                img: url,
              ),
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: carouselViewportFraction,
        height: carouselHeight,
        enableInfiniteScroll: false,
      ),
    );
  }
}
