import 'package:flutter/material.dart';

class HomeNavButtons extends StatefulWidget {
  const HomeNavButtons({super.key});
  @override
  HomeNavButtonsState createState() => HomeNavButtonsState();
}

class HomeNavButtonsState extends State<HomeNavButtons> {
  int _selectedIndex = 0;
  double _underlinePosition = 0.0;
  double _underlineWidth = 0.0;

  final List<String> _tabs = [
    "All",
    "Updates",
    "Events",
    "Training",
    "Extra 1",
    "Extra 2",
    "Extra 3",
  ];

  final List<GlobalKey> _buttonKeys = List.generate(
    8,
    (index) => GlobalKey(),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateUnderlineProperties();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 244, 242, 242),
            width: 12,
          ),
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(_tabs.length, (index) {
                    return _buildTabButton(index);
                  }),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: _underlinePosition,
                child: Container(
                  height: 2,
                  width: _underlineWidth,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 0),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      key: _buttonKeys[index],
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
            _updateUnderlineProperties();
          });
        },
        child: Text(
          _tabs[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _selectedIndex == index ? Colors.blue : Colors.grey[500],
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
    );
  }

  void _updateUnderlineProperties() {
    final RenderBox? renderBox = _buttonKeys[_selectedIndex]
        .currentContext
        ?.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      final double buttonWidth = renderBox.size.width;
      final double buttonOffset = renderBox.localToGlobal(Offset.zero).dx;

      setState(() {
        _underlineWidth = buttonWidth;
        _underlinePosition = buttonOffset;
      });
    }
  }
}
