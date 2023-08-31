import 'package:flutter/material.dart';

class HeightCard extends StatefulWidget {
  const HeightCard({
    super.key,
    required this.changeHeight,
  });

  final void Function(int height) changeHeight;

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  var height = 150;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Height',
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
                      widget.changeHeight(height -= 1);
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_left_rounded,
                    size: 48,
                  ),
                ),
                Text(
                  height.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'cm',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.changeHeight(height += 1);
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
              value: height.toDouble(),
              min: 1,
              max: 250,
              onChanged: (double newValue) {
                setState(() {
                  widget.changeHeight(height = newValue.round());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
