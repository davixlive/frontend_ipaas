import 'package:flutter/material.dart';

String dropdownValue = 'GO';
final repoController = TextEditingController();
final branchController = TextEditingController();

class FormNewApplication extends StatefulWidget {
  const FormNewApplication({Key? key}) : super(key: key);

  @override
  State<FormNewApplication> createState() => _FormNewApplicationState();
}

class _FormNewApplicationState extends State<FormNewApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //crossAxisAlignment: CrossAxisAlignment.start,
        body: Column(
      children: [
        ListTile(
          title: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter application repo',
            ),
            controller: repoController,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.loop_rounded),
          title: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter github branch',
            ),
            controller: branchController,
          ),
        ),
        ListTile(
            title: DropdownButton<String>(
          value: dropdownValue,
          //icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          //style: const TextStyle(color: Colors.deepPurple),
          /*underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),*/
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['GO', 'JAVA', 'PHP']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )),
        TextButton(
            onPressed: () {
              setState(() {
                print(repoController.text.toString());
                print(branchController.text.toString());
                print(dropdownValue);
              });
            },
            child: const Text('Submit')),
      ],
    ));
  }
}
