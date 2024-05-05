import 'package:flutter/material.dart';
import 'package:spacex/core/resources/assets.dart';
import 'package:spacex/features/home/data/models/launches/launches_model.dart';

class LaunchDetailsScreen extends StatelessWidget {
  final Launches launchItem;

  const LaunchDetailsScreen({Key? key, required this.launchItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launch Details'),
      ),
      body: Stack(
        children: [
          Image.asset(
            Assets.backgroundImage,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  launchItem.name ?? 'Unknown Launch',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Launch Date:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  launchItem.dateLocal ?? 'Unknown',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Details:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  launchItem.details ?? 'No details available.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Rocket:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  launchItem.rocket ?? 'Unknown',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Launchpad:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  launchItem.launchpad ?? 'Unknown',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                // Add more details as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
