import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_api/controller/task_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    Provider.of<TaskProvider>(context, listen: false).getTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) => taskProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text('${taskProvider.taskList[index].name}'),
                    subtitle: Column(
                      children: [
                        Text('${taskProvider.taskList[index].country}'),
                        Text('${taskProvider.taskList[index].stateProvince}'),
                        Text('${taskProvider.taskList[index].alphaTwoCode}'),
                        Text('${taskProvider.taskList[index].domains}'),
                        Text('${taskProvider.taskList[index].webPages}'),
                      ],
                    ),
                  ),
                ),
                itemCount: taskProvider.taskList.length,
              ),
      ),
    );
  }
}
