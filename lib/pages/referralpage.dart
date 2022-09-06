import 'package:flutter/material.dart';
import 'package:hive_boxes/boxes.dart';
import 'package:hive_flutter/adapters.dart';

class ReferralPage extends StatefulWidget {
  final String title;

  const ReferralPage({Key? key, required this.title}) : super(key: key);

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  late TextEditingController textFieldController;

  @override
  void initState() {
    super.initState();
    textFieldController = TextEditingController();
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (() {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('New Referral'),
                  content: TextField(
                    controller: textFieldController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      child: const Text('OK'),
                      onPressed: () {
                        final person = textFieldController.text;
                        Box1.getReferrals().add(person);
                        Navigator.pop(context);
                        textFieldController.clear();
                      },
                    ),
                  ],
                );
              });
        }),
      ),
      body: ValueListenableBuilder<Box<String>>(
          builder: (context, box, _) {
            final _referrals = box.values.toList().cast<String>();

            return ListView.builder(
                itemCount: _referrals.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.list),
                    title: Text(_referrals[index].toString()),
                    onTap: () {
                      box.deleteAt(index);
                    },
                  );
                });
          },
          valueListenable: Box1.getReferrals().listenable()),
    );
  }
}
