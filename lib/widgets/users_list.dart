import 'package:flutter/material.dart';
import 'package:test_aspins/models/user.dart';
import 'package:test_aspins/widgets/user_item.dart';

class UsersList extends StatelessWidget {
  final List<User> users;

  UsersList({required this.users, super.key}) {
    users.sort((a, b) => b.price.compareTo(a.price));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: users.length - 3,
      itemBuilder: (BuildContext context, int index) {
        User user = users[index + 3];
        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserItem(index: index + 4, image: user.avatar, name: user.name, price: user.price, isPro: user.isPro,)
            ],
          ),
        );
      },
    );
  }
}
