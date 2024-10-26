import 'package:flutter/material.dart';

class HomeNote extends StatelessWidget {
  final double iconSize;
  final double textSize;
  final double buttonFontSize;
  final double buttonPadding;

  const HomeNote({
    super.key,
    this.iconSize = 40.0,
    this.textSize = 20.0,
    this.buttonFontSize = 20.0,
    this.buttonPadding = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 244, 242, 242),
            spreadRadius: 10,
            blurRadius: 0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 118, 239, 201)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.access_alarms,
                    color: const Color.fromARGB(255, 79, 84, 82),
                    size: iconSize,
                  ),
                ),
                const SizedBox(width: 12.0),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Please Submit your timesheet: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: textSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'For Period 6/10-6/16',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: textSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 0.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 127, 181, 222),
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: buttonPadding * 2,
                vertical: buttonPadding,
              ),
              textStyle: TextStyle(fontSize: buttonFontSize),
            ),
            child: const Text('Open'),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: const Color.fromARGB(255, 145, 153, 162),
            onPressed: () {},
            iconSize: iconSize,
          ),
        ],
      ),
    );
  }
}
