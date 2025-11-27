import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  final VoidCallback callback;
  
  const TemperatureScreen({super.key, required this.callback});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final textController = TextEditingController();
  String inputText = '';
  int? get degree => int.tryParse(inputText);
  double? get fahrenheit => degree == null ? null : (degree! * 9 / 5) + 32;
  String get fahrenheitText => fahrenheit == null ? '' : fahrenheit.toString();

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter Degree Temperature in Interger',
    hintStyle: const TextStyle(color: Colors.white),
  );

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                IconButton(
                  onPressed: widget.callback, 
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: const Icon(
                    Icons.thermostat_outlined,
                    size: 120,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              controller: textController,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              onChanged: (value) => setState(() {
                inputText = value;
              }),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(fahrenheitText),
            ),
          ],
        ),
      ),
    );
  }
}
