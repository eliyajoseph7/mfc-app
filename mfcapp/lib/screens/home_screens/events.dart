import 'package:float_column/float_column.dart';
import 'package:flutter/material.dart';
import 'package:mfcapp/models/event.dart';
import 'package:mfcapp/providers/event.dart';
import 'package:provider/provider.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int present = 0;
  int perPage = 5;
  bool isLoadingMore = false;

  List<Events> items = [];

  @override
  void initState() {
    super.initState();
    updateList();
  }

  updateList() async {
    var event = Provider.of<EventProvider>(context, listen: false);
    await event.fetchEvents();

    setState(() {
      // print(object)
      items.addAll(event.events.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  _loadMore() async {
    await Future.delayed(
      const Duration(
        seconds: 0,
        milliseconds: 2000,
      ),
    );
    // ignore: use_build_context_synchronously
    var event = Provider.of<EventProvider>(context, listen: false);
    setState(() {
      if ((present + perPage) > event.events.length) {
        items.addAll(event.events.getRange(present, event.events.length));
      } else {
        items.addAll(event.events.getRange(present, present + perPage));
      }
      present = present + perPage;
      isLoadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<EventProvider>(context);
    return list.isLoading
        ? const Text('...loading')
        : Container(
          color: Colors.grey.shade100,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              
              itemBuilder: ((BuildContext context, index) {
                return (index == items.length)
                    ? isLoadingMore
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: CircularProgressIndicator(
                                    color: Colors.blueGrey.shade300,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.grey.shade300),
                                child: TextButton(
                                  child: const Text("Load More"),
                                  onPressed: () {
                                    setState(() {
                                      isLoadingMore = true;
                                    });
                                    _loadMore();
                                  },
                                ),
                              ),
                            ),
                          )
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                      child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 100, maxHeight: double.infinity
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: FloatColumn(
                                  children: [
                                    Floatable(
                                      float: FCFloat.start,
                                      maxWidthPercentage: 0.33,
                                      padding: const EdgeInsetsDirectional.only(end: 12),
                                      child: Container(
                                        // width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            image: NetworkImage(items[index].image)
                                          )
                                        ),
                                      ),
                                    ),
                                    WrappableText(
                                      padding: const EdgeInsets.only(left: 3),
                                      text: TextSpan(
                                        text: items[index].title,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    WrappableText(
                                      padding: const EdgeInsets.only(left: 3),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        text: items[index].description,
                                        style: const TextStyle(fontSize: 18, ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ),
                        ),
                      ),
                    );
              }),
              itemCount:
                  (present <= items.length) ? items.length + 1 : items.length,
            ),
        );
  }
}
