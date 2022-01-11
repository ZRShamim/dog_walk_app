import 'package:dog_walk_app/models/doginfodata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilteredOption extends StatelessWidget {
  const FilteredOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(searchOption.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Chip(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              label: Row(
                children: [
                  Text(
                    searchOption[index],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    'assets/svg_icons/x.svg',
                    width: 18,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}