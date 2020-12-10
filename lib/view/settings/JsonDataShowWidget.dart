import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/Teacher.dart';
import 'package:http/http.dart' as http;

class JsonDataShowWidget extends StatefulWidget {
  const JsonDataShowWidget({
    Key key,
  }) : super(key: key);

  @override
  _JsonDataShowWidgetState createState() => _JsonDataShowWidgetState();
}

class _JsonDataShowWidgetState extends State<JsonDataShowWidget> {
  Future<Teacher> futureTeacherData;

  @override
  void initState() {
    super.initState();
    futureTeacherData = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Teacher>(
        future: futureTeacherData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(snapshot.data?.name?.toString() ?? "")),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(snapshot.data?.phone ?? "")),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(snapshot.data?.email ?? "")),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<Teacher> fetchAlbum() async {
  final response = await http.get('http://10.0.2.2:9090/e-journal/teachers/4');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // var decodedJson = json.decode(utf8.decode(response.bodyBytes));
    log(json.decode(utf8.decode(response.bodyBytes)).toString());
    return Teacher.fromJson(json.decode(utf8.decode(response.bodyBytes)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// Future<String> readResponse(http.Response response) {


  // final completer = Completer<String>();
  // final contents = StringBuffer();
  // response.transform(utf8.decoder).listen((data) {
  //   contents.write(data);
  // }, onDone: () => completer.complete(contents.toString()));
  // return completer.future;
// }
