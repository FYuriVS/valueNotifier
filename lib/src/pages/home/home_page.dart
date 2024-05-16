import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:value_notifier/src/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counter = Counter();

  @override
  void initState() {
    super.initState();
    // counter.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Você clicou no botão"),
            ValueListenableBuilder<int>(
                valueListenable: counter,
                builder: (context, value, child) {
                  return Text(
                    value > 1 && value != 0
                        ? '${value.toString()} vezes'
                        : '${value.toString()} vez',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
