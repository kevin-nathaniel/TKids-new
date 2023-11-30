import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_project/services/globals.dart';
import 'package:my_first_project/app_styles.dart';

class ActivityList extends StatefulWidget {
  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  final apiUrl = baseURL + 'activities'; // Gantilah dengan URL API yang sesuai
  List<Activity> activities = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> activitiesData = json.decode(response.body)['data'];

      setState(() {
        activities =
            activitiesData.map((data) => Activity.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _refreshData() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity List'),
        backgroundColor: PrimaryColor,
      ),
      body: activities.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refreshData,
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        title: Text(
                          activity.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              thickness:
                                  2, // Ganti dengan ketebalan yang diinginkan
                            ), // Jarak antara judul dan deskripsi
                            Text(
                              activity.desc,
                              textAlign: TextAlign.justify,
                            ), // Garis tipis
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class Activity {
  final String title;
  final String desc;

  Activity({
    required this.title,
    required this.desc,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      title: json['title'],
      desc: json['desc'],
    );
  }
}
