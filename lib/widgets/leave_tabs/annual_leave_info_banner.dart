import 'package:flutter/material.dart';

class AnnualLeaveInfoBanner extends StatelessWidget {
  const AnnualLeaveInfoBanner({
    super.key,
    required this.year,
  });

  final int year;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 96,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 30, 128, 184),
                Color.fromARGB(226, 2, 194, 242)
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: const Color.fromARGB(65, 255, 255, 255),
                ),
                child: Image.asset(
                  'assets/icons/icon-doc-inactive.png',
                  color: const Color.fromARGB(153, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('Year $year',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/images/watermark_logo.png',
            height: 96,
          ),
        ),
      ],
    );
  }
}
