import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';

class AdminTeacherScreen extends StatelessWidget {
  const AdminTeacherScreen({super.key});

  static const routeName = 'AdminTeacherScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Techer Section'),
        centerTitle: true,
      ),
      backgroundColor: kOtherColor,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                HomeCard(
                  onPress: () {
                  },
                  title: 'View All Teacher',
                ),
                HomeCard(
                  onPress: () {},
                  title: 'Add a new Teacher',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.onPress, required this.title});

  final VoidCallback onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding / 2),
        height: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
