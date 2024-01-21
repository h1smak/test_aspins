import 'package:flutter/material.dart';
import 'package:test_aspins/models/user.dart';
import 'package:test_aspins/widgets/toggle_button.dart';
import 'package:test_aspins/widgets/top_three.dart';
import 'package:test_aspins/widgets/users_list.dart';

class MainPage extends StatefulWidget {
  final List<User>? users;

  const MainPage({
    required this.users,
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<User> topThreeUsers;

  @override
  void initState() {
    super.initState();
    widget.users!.sort((a, b) => b.price.compareTo(a.price));
    topThreeUsers = widget.users!.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: ToggleButton(
              width: 250.0,
              height: 36.0,
              toggleBackgroundColor: const Color.fromARGB(255, 236, 234, 251),
              toggleBorderColor: (Colors.grey[350])!,
              toggleColor: (const Color.fromARGB(255, 116, 68, 198)),
              activeTextColor: Colors.white,
              inactiveTextColor: Colors.black,
              leftDescription: 'Эта неделя',
              rightDescription: 'Всё время',
              onLeftToggleActive: () {},
              onRightToggleActive: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: TopThree(
                    image: topThreeUsers[2].avatar,
                    name: topThreeUsers[2].name,
                    price: topThreeUsers[2].price,
                    place: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: TopThree(
                    image: topThreeUsers[0].avatar,
                    name: topThreeUsers[0].name,
                    price: topThreeUsers[0].price,
                    place: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TopThree(
                    image: topThreeUsers[1].avatar,
                    name: topThreeUsers[1].name,
                    price: topThreeUsers[1].price,
                    place: 2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: UsersList(users: widget.users!)),
        ],
      );
    });
  }
}
