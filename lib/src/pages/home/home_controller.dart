import 'package:flutter/material.dart';

// Utilizando changeNotifier
// class HomeController extends ChangeNotifier {
//   var counter = 0;

//   void increment() {
//     counter++;
//     notifyListeners();
//   }
// }

// Utilizando valueNotifier
// class HomeController {
//   var counter$ = ValueNotifier(0);

//   int get counter => counter$.value;

//   void increment() {
//     counter$.value++;
//   }
// }

// Utilizando um padrão de valueNotifier
class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  increment() => value++;
  decrement() => value--;
}
