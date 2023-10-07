import 'package:flutter/material.dart';

class BookedMeeting extends StatefulWidget {
  const BookedMeeting({Key? key, required this.title, this.onTap})
      : super(key: key);

  final String title;
  final void Function()? onTap;

  @override
  BookedMeetingState createState() => BookedMeetingState();
}

class BookedMeetingState extends State<BookedMeeting>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _borderAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _borderAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      onTapDown: (details) {
        _controller.forward(); // play the animation
      },
      onTapUp: (details) {
        _controller.reverse(); // reverse the animation
      },
      child: Stack(
        children: [
          // ListTile
          ListTile(
            leading: const Icon(
              Icons.mail,
              size: 35,
            ),
            title: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          // AnimatedBuilder with bottom border
          Positioned(
            left: 20,
            right: 20,
            bottom: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double totalWidth = MediaQuery.of(context).size.width - 40;
                double animatedWidth = totalWidth * _borderAnimation.value;
                double leftOffset = (totalWidth - animatedWidth) / 2;
                return Container(
                  height: 1.0,
                  width: animatedWidth,
                  color: Colors.grey,
                  margin: EdgeInsets.only(left: leftOffset, right: leftOffset),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
