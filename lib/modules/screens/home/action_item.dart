import 'package:flutter/material.dart';

class ActivityItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color color;

  const ActivityItem({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: widget.color.withOpacity(0.2),
          child: Icon(widget.icon, color: widget.color),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(widget.text)),
      ],
    );
  }
}
