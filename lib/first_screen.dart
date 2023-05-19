import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/second_screen.dart';
import 'dart:convert';

import 'package:task/text_field.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

TextEditingController ownerController = TextEditingController();
TextEditingController repoController = TextEditingController();

void commit(String owner, repo) async {
  var headers = {
    'Accept': 'application/vnd.github+json',
    'Authorization': 'Bearer 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',
    'X-GitHub-Api-Version': '2022-11-28'
  };

  var request = http.Request('GET',
      Uri.parse('https://api.github.com/repos/tensorflow/tensorflow/commits'));
  request.bodyFields = {};
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());

  } else {
    print(response.reasonPhrase);
  }
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 250,
            ),
            MyTextFormField(
              hint: "Owner",
              controller: ownerController,
            ),
            SizedBox(
              height: 10,
            ),
            MyTextFormField(hint: "Repository", controller: repoController),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0))),
                onPressed: () async {
                  commit(
                      ownerController.text.trim(), repoController.text.trim());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                            id: "17151892",
                            message:
                                "Update forward compatibility\n horizon to 2023-05-19\nPiperOrigin-RevId: 533392766",
                            AvatarUrl:
                                "https://avatars.githubusercontent.com/u/17151892?v=4"),
                      ));
                },
                child: Container(
                    height: 50,
                    width: 150,
                    child: Center(
                        child: Text(
                      "Get Commits",
                      style: TextStyle(fontSize: 20),
                    )))),
          ],
        ),
      ),
    );
  }
}
