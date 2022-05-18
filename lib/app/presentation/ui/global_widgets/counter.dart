
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final void Function(int) onChanged;
  final int initialValue;
  const Counter({
    Key? key,
    required this.onChanged,
    this.initialValue = 1,
  })  : assert(initialValue >= 1),
        super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 1;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  void _updateCounter(int counter) {
    if (counter >= 1) {
      _counter = counter;
      setState(() {});
      widget.onChanged(_counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.30,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          width: 0.1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => _updateCounter(_counter - 1),
            child: const Icon(Icons.remove),
          ),
          Text('$_counter'),
          InkWell(
            onTap: () => _updateCounter(_counter + 1),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
