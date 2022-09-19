import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/pages/movies.dart';

class Detail extends StatefulWidget {
  final Movie curr;
  const Detail({super.key, required this.curr});
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.curr.title),
          bottom: const TabBar(tabs: [
            Tab(text: "Detail"),
            Tab(text: "Comments"),
          ]),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.curr.poster,
                        width: 200,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                        widget.curr.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Padding(padding: EdgeInsets.all(3)),
                      Text(
                        widget.curr.rating.toString() + "/5.0",
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Text(
                    widget.curr.synopsis,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextField(
                    controller: commentController,
                    decoration:
                        const InputDecoration(hintText: "Input Comment"),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      widget.curr.comments.add(commentController.text);
                      print(widget.curr.comments);
                    },
                    child: const Icon(Icons.send)),
                Expanded(
                  child: ListView.builder(
                      itemCount: widget.curr.comments.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 600,
                              margin: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text(
                                widget.curr.comments[index],
                                textAlign: TextAlign.start,
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
