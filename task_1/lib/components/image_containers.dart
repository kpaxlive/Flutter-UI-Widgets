import 'package:flutter/material.dart';

class ImageContainers extends StatefulWidget {
  const ImageContainers({super.key});

  @override
  State<ImageContainers> createState() => _ImageContainersState();
}

class _ImageContainersState extends State<ImageContainers> {
  bool isLiked = false;
  bool isDisliked = false;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          alignment: Alignment.topCenter,
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        isLiked = true;
                        isDisliked = false;
                      });
                    },
                    child: SizedBox(
                      height: 250,
                      child: Image.asset("assets/images/photo.jpeg"),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                isLiked
                                    ? Icons.thumb_up_alt_rounded
                                    : Icons.thumb_up_alt_outlined,
                                color: isLiked
                                    ? Colors.blue.shade600
                                    : Colors.black,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                  if (isLiked == true) {
                                    isDisliked = false;
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 13),
                            IconButton(
                              icon: Icon(
                                isDisliked
                                    ? Icons.thumb_down_alt_rounded
                                    : Icons.thumb_down_alt_outlined,
                                color: isDisliked
                                    ? Colors.red.shade900
                                    : Colors.black,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  isDisliked = !isDisliked;
                                  if (isDisliked) {
                                    isLiked = false;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_outlined,
                            color: isFavorite ? Colors.pink : Colors.black,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
