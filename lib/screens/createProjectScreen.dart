import 'package:flutter/material.dart';
import 'package:local_database/models/project_model.dart';
import 'package:local_database/models/project_model.dart';
import 'package:local_database/services/database_helper.dart';

class CreateProjectScreen extends StatelessWidget {
  final Project? note;
  const CreateProjectScreen({Key? key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    if (note != null) {
      titleController.text = note!.title;
      descriptionController.text = note!.description;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? 'Add a project' : 'Edit project'),
        leadingWidth: 90,
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                const Text(
                  'Create New Project',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: titleController,
                  decoration:
                      InputDecoration.collapsed(hintText: 'Project Name'),
                ),
                TextField(
                  onTap: () {},
                  readOnly: true,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'Template 1 (general)',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ),
                TextField(
                  onTap: () {},
                  readOnly: true,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'Form 1 (general)',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ),
                const TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'Search for Address'),
                ),
                const TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'Street Address'),
                ),
                const TextField(
                  decoration: InputDecoration.collapsed(hintText: 'City'),
                ),
                const TextField(
                  decoration: InputDecoration.collapsed(hintText: 'State'),
                ),
                const TextField(
                  decoration: InputDecoration.collapsed(hintText: 'Zipcode'),
                ),
                const TextField(
                  decoration: InputDecoration.collapsed(hintText: 'Country'),
                ),
                SizedBox(
                  height: 70,
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Add Note Here',
                    ),
                  ),
                ),
                const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "PHOTOS",
                      style: TextStyle(color: Colors.teal),
                    )),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 200,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add Project Photos"),
                        SizedBox(width: 30),
                        Icon(Icons.camera_alt)
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Notes",
                  ),
                ),
                const TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)))),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () async {
                          final title = titleController.value.text;
                          final description = descriptionController.value.text;

                          if (title.isEmpty || description.isEmpty) {
                            return;
                          }

                          final Project model = Project(
                              title: title,
                              description: description,
                              id: note?.id);
                          if (note == null) {
                            await DatabaseHelper.addNote(model);
                          } else {
                            await DatabaseHelper.updateNote(model);
                          }

                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 0.75,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    )))),
                        child: Text(
                          note == null ? 'Save' : 'Edit',
                          style: const TextStyle(fontSize: 20),
                        )),
                  ),
                )
              ]
                  .map((widget) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: widget,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
