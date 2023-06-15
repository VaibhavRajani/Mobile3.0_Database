import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../services/database_helper.dart';
import '../widgets/projectCard.dart';
import '../screens/createProjectScreen.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: TextField(
                style: const TextStyle(
                  fontSize: 15,
                  height: 2,
                  textBaseline: TextBaseline.alphabetic,
                ),
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: "Search for Account",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateProjectScreen(
                        note: null, // Pass your project object here if needed
                      ),
                    ),
                  );

                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0))),
                child: const Text("Create New Project"),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Project>?>(
                future: DatabaseHelper.getAllNotes(),
                builder: (context, AsyncSnapshot<List<Project>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                        itemBuilder: (context, index) => ProjectCard(
                          note: snapshot.data![index],
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateProjectScreen(
                                  note: snapshot.data![index],
                                ),
                              ),
                            );
                            setState(() {});
                          },
                          onLongPress: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Are you sure you want to delete this note?'),
                                  actions: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                      ),
                                      onPressed: () async {
                                        await DatabaseHelper.deleteNote(
                                            snapshot.data![index]);
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: const Text('Yes'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('No'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        itemCount: snapshot.data!.length,
                      );
                    }
                    return const Center(
                      child: Text('No notes yet'),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
