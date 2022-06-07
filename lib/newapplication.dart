import 'package:flutter/material.dart';

String dropdownValue = 'GO';
final repoController = TextEditingController();
final branchController = TextEditingController();
List<String> languages = ['GO', 'JAVA', 'PHP'];

class FormNewApplication extends StatefulWidget {
  const FormNewApplication({Key? key}) : super(key: key);

  @override
  State<FormNewApplication> createState() => _FormNewApplicationState();
}

class _FormNewApplicationState extends State<FormNewApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //crossAxisAlignment: C
      //rossAxisAlignment.start,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Title(
                color: Colors.red,
                child: const Text(
                  "New application",
                  textAlign: TextAlign.center,
                  textScaleFactor: 5,
                  style: TextStyle(color: Colors.red),
                  //color: Colors.red,
                )),
          ),
          ListTile(
              title: FractionallySizedBox(
            widthFactor: 0.5,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                hintText: 'Enter application repo',
              ),
              controller: repoController,
            ),
          )),
          ListTile(
              //leading: const Icon(Icons.loop_rounded),
              title: FractionallySizedBox(
            widthFactor: 0.5,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                labelText: 'Enter github branch',
              ),
              controller: branchController,
            ),
          )),
          ListTile(
              title: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    //icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items:
                        languages.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            //textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ))),
          OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
              ),
              onPressed: () {
                setState(() {
                  //need to ckeck string
                  print("Inviato");
                });
              },
              child: const Text('Submit',
                  textScaleFactor: 2, style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}
