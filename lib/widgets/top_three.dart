import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopThree extends StatelessWidget {
  const TopThree({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.place,
  });

  final String? image;
  final String name;
  final double price;
  final int place;

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              height: 101,
              width: 72,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 43,
                      width: 43,
                      child: SvgPicture.asset(
                        'assets/badge.svg',
                        height: 43,
                        width: 43,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    height: 72,
                    width: 72,
                    child: CircleAvatar(
                      backgroundColor: getRandomColor(),
                      child: image != null
                          ? ClipOval(
                              child: Image.network(
                                image!,
                                width: 72,
                                height: 72,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Text(
                              name[0].toUpperCase(),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          place.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(name,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1819),
                )),
            Text(price.toString() + '\$',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFA26FFF),
                )),
          ],
        ),
      ],
    );
  }
}
