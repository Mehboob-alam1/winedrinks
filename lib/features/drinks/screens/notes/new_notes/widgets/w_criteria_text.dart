import 'package:flutter/material.dart';

import '../../../../../../utlis/constants/WSizes.dart';

class WCriteriaText extends StatelessWidget {
  const WCriteriaText({
    super.key, required this.criteria, required this.criteriaValue,
  });
  final String criteria;
  final String criteriaValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: WSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(criteria,style: Theme.of(context).textTheme.labelLarge),
          Text(criteriaValue,style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
