import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(
      {Key? key,
      required this.id,
      required this.message,
      required this.AvatarUrl})
      : super(key: key);
  final String AvatarUrl;
  final String id;
  final String message;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Commits"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            maxRadius: 40,
                            minRadius: 10,
                            backgroundImage: NetworkImage(widget.AvatarUrl),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${widget.id}",
                                style: TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis),
                            Container(
                              child: Text("${widget.message}",
                                  style: TextStyle(fontSize: 15),
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        )
                      ],
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
