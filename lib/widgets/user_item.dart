import 'dart:math';

import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.index,
    required this.image,
    required this.name,
    required this.price,
    required this.isPro,
  });

  final int index;
  final String? image;
  final String name;
  final double price;
  final bool isPro;

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
      children: [
        Text(
          index.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1819),
          ),
        ),
        const SizedBox(width: 10),
        Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: getRandomColor(),
              child: image != null
                  ? ClipOval(
                      child: Image.network(
                        image!,
                        width: 50,
                        height: 50,
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
            if (isPro)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 253, 117, 79),
                          Color.fromARGB(255, 247, 196, 101)
                        ],
                      ),
                    ),
                    child: const Text("Pro",
                        style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1819),
                        ))),
              ),
          ],
        ),
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1819),
          ),
        ),
        Expanded(
          child: Text(
            price.toString() + '\$',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFFA26FFF),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
