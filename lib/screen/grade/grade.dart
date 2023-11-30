import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_project/services/globals.dart';
import 'package:my_first_project/app_styles.dart';

class GradeList extends StatefulWidget {
  @override
  _GradeListState createState() => _GradeListState();
}

class _GradeListState extends State<GradeList> {
  final apiUrl = baseURL + 'grades';
  late Future<List<Grade>> grades;

  @override
  void initState() {
    super.initState();
    grades = fetchGrades();
  }

  Future<List<Grade>> fetchGrades() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Grade.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load grades');
    }
  }

  Future<void> _refreshGrades() async {
    setState(() {
      grades = fetchGrades();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade'),
        backgroundColor: PrimaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshGrades,
        child: FutureBuilder<List<Grade>>(
          future: grades,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Grade> grades = snapshot.data!;

              // Create a horizontal scrollable table
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: grades.length,
                itemBuilder: (context, index) {
                  Grade grade = grades[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: DataTable(
                        columnSpacing: 8.0,
                        columns: [
                          DataColumn(
                            label: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Pelajaran',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Nilai',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Membaca',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${grade.membaca}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Menulis',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${grade.menulis}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Menghitung',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${grade.menghitung}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Mengeja',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${grade.mengeja}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class Grade {
  final int membaca;
  final int menulis;
  final int menghitung;
  final int mengeja;

  Grade({
    required this.membaca,
    required this.menulis,
    required this.menghitung,
    required this.mengeja,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      membaca: json['membaca'],
      menulis: json['menulis'],
      menghitung: json['menghitung'],
      mengeja: json['mengeja'],
    );
  }
}
