// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/SliderProvider.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Slider build');
    final SliderProv = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: Column(
        children: [
          const Text('Slider'),
          Consumer(
            builder: (context, SliderProvider sliderProv, child) {
              return Text(
                sliderProv.sliderValue.toString(),
                style: const TextStyle(fontSize: 30),
              );
            },
          ),
          Consumer(
            builder: (context, SliderProvider sliderProv, child) {
              return Slider(
                value: SliderProv.sliderValue,
                min: 0,
                max: 1,
                divisions: 100,
                label: SliderProv.sliderValue.toString(),
                onChanged: (double value) {
                  SliderProv.sliderValue = value;
                },
              );
            },
          ),
          Consumer(
            builder: (context, SliderProvider sliderProv, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    color: Colors.amber.withOpacity(SliderProv.sliderValue),
                    child: const Text("0"),
                  )),
                  Expanded(
                      child: Container(
                    height: 50,
                    color: const Color.fromARGB(255, 7, 255, 143)
                        .withOpacity(SliderProv.sliderValue),
                    child: const Text("0"),
                  )),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
