// events_screen.dart

import 'package:flutter/material.dart';
import 'package:school_management_app/constants/constants.dart';
import 'package:school_management_app/screens/students/event_screen/data/event_data.dart';
import 'package:school_management_app/screens/students/event_screen/model/event_model.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  static const routeName = 'EventScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
        centerTitle: true,
      ),
      backgroundColor: kOtherColor,
      body: ListView.builder(
        itemCount: upcomingEvents.length,
        itemBuilder: (context, index) {
          final event = upcomingEvents[index];
          return EventCard(event: event);
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding / 2),
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: kTextLightColor,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.title,
            style: const TextStyle(
              color: kTextBlackColor,
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
          kHalfSizedBox,
          Text(
            'Date: ${event.date.toLocal()}',
            style: const TextStyle(
              color: kTextBlackColor,
              fontSize: 14.0,
            ),
          ),
          Text(
            'Location: ${event.location}',
            style: const TextStyle(
              color: kTextBlackColor,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
