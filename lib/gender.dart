import 'package:flutter/material.dart';

class GenderCard extends StatefulWidget {
  const GenderCard({
    super.key,
    required this.changeGender,
  });

  final void Function(String gender) changeGender;

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  Color? colorMale;
  Color? colorFemale;
  String pickGender = '';

  @override
  Widget build(BuildContext context) {
    if (pickGender == 'male') {
      colorMale = Theme.of(context).colorScheme.primary;
      colorFemale = null;
    } else if (pickGender == 'female') {
      colorFemale = Theme.of(context).colorScheme.primary;
      colorMale = null;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.changeGender(pickGender = 'male');
              });
            },
            child: Card(
              color: colorMale,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.male_rounded,
                      size: 80,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.changeGender(pickGender = 'female');
              });
            },
            child: Card(
              color: colorFemale,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.female_rounded,
                      size: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
