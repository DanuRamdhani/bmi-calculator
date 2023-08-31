import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/height.dart';
import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/weight.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputPageState();
}

class _InputPageState extends State<InputScreen> {
  int _height = 150;
  int _weight = 60;
  String? _gender;
  var kategori = '';
  var hasil = '';

  Color? kColor;

  void calculate() {
    final heightInMeter = _height / 100;

    final heightPangkatDua = heightInMeter * heightInMeter;
    final equal = _weight / heightPangkatDua;
    hasil = equal.toStringAsFixed(2);

    if (_gender == 'male') {
      if (equal < 18.5) {
        kategori = 'Berat badan kurang ideal';
        kColor = Colors.grey;
      } else if (equal < 23) {
        kategori = 'Berat badan normal dan ideal';
        kColor = Colors.green;
      } else if (equal < 30) {
        kategori = 'Kelebihan berat badan';
        kColor = Colors.orange;
      } else if (equal >= 30) {
        kategori = 'Obesitas';
        kColor = Colors.red;
      }
    }
    if (_gender == 'female') {
      if (equal < 17) {
        kategori = 'Berat badan kurang ideal';
        kColor = Colors.grey;
      } else if (equal < 23) {
        kategori = 'Berat badan normal dan ideal';
        kColor = Colors.green;
      } else if (equal < 27) {
        kategori = 'Kelebihan berat badan';
        kColor = Colors.orange;
      } else if (equal >= 27) {
        kategori = 'Obesitas';
        kColor = Colors.red;
      }
    }
  }

  void _calculate() {
    if (_gender == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please choose your gender'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    calculate();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            ResultScreen(hasil: hasil, kategori: kategori, kColor: kColor!),
      ),
    );

    print(_gender);
    print('height : $_height');
    print('weight : $_weight');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Wrap(
                      children: [
                        Text(
                          '• IMT ideal pria\n < 18,5 = berat badan kurang ideal.\n 18,5 - 22,9 = berat badan normal.\n 23 - 29,9 = kelebihan berat badan.\n > 30 = obesitas.\n',
                        ),
                        Text(
                          '• IMT ideal wanita\n < 17 = berat badan kurang ideal.\n 17 - 23 = berat badan normal.\n 23 - 27 = kelebihan berat badan.\n > 27 = obesitas.',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GenderCard(
              changeGender: (gender) {
                _gender = gender;
              },
            ),
            HeightCard(
              changeHeight: (height) {
                _height = height;
              },
            ),
            WeightCard(
              changeWeight: (weight) {
                _weight = weight;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: _calculate,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 70),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onBackground,
          shape: const BeveledRectangleBorder(),
        ),
        child: const Text(
          'Calculate',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
