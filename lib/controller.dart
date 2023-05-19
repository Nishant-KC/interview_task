import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:task/model.dart';



class CommitController extends GetxController {
  List<Commit> commits = [];

  Future<void> fetchCommits() async {
    final response = await http.get(Uri.parse('https://api.github.com/repos/flutter/flutter/commits'));
    if (response.statusCode == 200) {
      final commitsJson = json.decode(response.body);
      commits = commitsJson.map((commitJson) => Commit.fromJson(commitJson)).toList();
    } else {
      throw Exception('Failed to fetch commits');
    }
  }
}
