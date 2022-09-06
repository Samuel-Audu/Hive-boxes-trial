import 'package:flutter/material.dart';
import 'package:hive_boxes/boxes.dart';
import 'package:hive_flutter/adapters.dart';

class ReferralPage2 extends StatefulWidget {
  final String title;

  const ReferralPage2({Key? key, required this.title}) : super(key: key);

  @override
  State<ReferralPage2> createState() => _ReferralPage2State();
}

class _ReferralPage2State extends State<ReferralPage2> {
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
                        Box2.getReferrals2().add(person);
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
            final referrals = box.values.toList().cast<String>();

            return ListView.builder(
                itemCount: referrals.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.list),
                    title: Text(referrals[index].toString()),
                    onTap: () {
                      box.deleteAt(index);
                    },
                  );
                });
          },
          valueListenable: Box2.getReferrals2().listenable()),
    );
  }
}
