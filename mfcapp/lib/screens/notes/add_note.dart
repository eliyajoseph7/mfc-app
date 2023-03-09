import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  bool _showSave = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Notes'),
        backgroundColor: Colors.white,
        actions: [
          _showSave ?
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 16),
            child: Text('Save', style: TextStyle(color: Colors.amber[700], fontSize: 18, fontWeight: FontWeight.w600),),
          ) : Container(),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat.Hm().format(DateTime.now()).toString(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(bottom: 11, top: 11, right: 15),
                    ),
                  ),
                  TextFormField(
                    maxLines: null,
                    minLines: 20,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Note something',
                    ),
                    onChanged: (value) {
                      setState(() {
                        if(value.isNotEmpty) {
                         _showSave = true;
                        } else {
                        _showSave = false;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
