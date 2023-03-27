import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mfcapp/models/event.dart';

class EventProvider with ChangeNotifier {
  List<Events> _events = [];
  bool _loading = true;

  List<Events> get events => [..._events];
  bool get isLoading => _loading;

  void setEvents(Events event) {
    _events.add(event);

    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchEvents() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://5e98afff5eabe7001681c474.mockapi.io/api/v1/routines'));
      if (response.statusCode == 200) {
        for (var map in jsonDecode(response.body)) {
          var event = Events.fromMap(map);
          setEvents(event);

        }
        // print(_events);
        //  setEvents(Events.fromMap(jsonDecode(response.body)))
      }
    } catch (e) {
      print(e.toString());
    }
    setLoading(false);
  }
}
