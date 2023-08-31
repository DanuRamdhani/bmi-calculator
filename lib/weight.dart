import 'package:flutter/material.dart';

class WeightCard extends StatefulWidget {
  const WeightCard({
    super.key,
    required this.changeWeight,
  });

  final void Function(int weight) changeWeight;

  @override
  State<WeightCard> createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  var weight = 60;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Weight',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.changeWeight(weight -= 1);
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_left_rounded,
                    size: 48,
                  ),
                ),
                Text(
                  weight.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'kg',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.changeWeight(weight += 1);
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_right_rounded,
                    size: 48,
                  ),
                ),
              ],
            ),
            Slider(
              value: weight.toDouble(),
              min: 1,
              max: 200,
              onChanged: (double newValue) {
                setState(() {
                  widget.changeWeight(weight = newValue.round());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
