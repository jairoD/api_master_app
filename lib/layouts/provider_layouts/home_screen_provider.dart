/* import 'package:api_master_app/data/services/task_service.dart';
import 'package:api_master_app/layouts/provider_layouts/details_screen_provider.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends StatefulWidget {
  const HomeScreenProvider({super.key});

  @override
  State<HomeScreenProvider> createState() => _HomeScreenProviderState();
}

class _HomeScreenProviderState extends State<HomeScreenProvider> {
  var taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: taskService.listAllTask(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) => ListTile(
                      trailing: IconButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsScreenProvider(
                                    task: snapshot.data![index]),
                              )),
                          icon: Icon(Icons.arrow_right_outlined)),
                      title: Text(
                        snapshot.data?[index].title ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                ),
              ),
            );
          } else {
            return Center(
              child: Text('NO DATA'),
            );
          }
        },
      ),
    );
  }
}
 */

import 'package:api_master_app/data/providers/task_provider.dart';
import 'package:api_master_app/layouts/provider_layouts/details_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<TaskProvider>(
          builder: (context, value, child) => ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: value.task.length,
            itemBuilder: (context, index) => ListTile(
                trailing: IconButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreenProvider(task: value.task[index]),
                        )),
                    icon: const Icon(Icons.arrow_right_outlined)),
                title: Text(
                  value.task[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )),
          ),
        ),
      ),
    );
  }
}
