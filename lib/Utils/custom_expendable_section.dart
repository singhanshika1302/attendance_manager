import 'package:expandable_section/expandable_section.dart';
import 'package:flutter/material.dart';

class customExpandableSection extends StatefulWidget {
  final bool isExpand;
  final String displayText;
  final Widget mysection;
  const customExpandableSection(
      {super.key,
      required this.isExpand,
      required this.displayText,
      required this.mysection});

  @override
  State<customExpandableSection> createState() =>
      _customExpandableSectionState();
}

class _customExpandableSectionState extends State<customExpandableSection> {
  @override
  Widget build(BuildContext context) {
    bool localExpand = false;
    @override
    void initState() {
      super.initState();
      localExpand = widget.isExpand;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: localExpand
              ? const BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
              : BorderRadius.circular(10)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                localExpand = !localExpand;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.displayText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(localExpand
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),
          ExpandableSection(
            expand: localExpand,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 2),
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: widget.mysection),
            ),
          ),
        ],
      ),
    );
  }
}