// import 'package:opp/design/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const CategoryCard(
      {Key? key,
      required this.url,
      required this.title,
      required this.subtitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              url,
              fit: BoxFit.scaleDown,
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFf5f5f8),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Color(0xFF130A33),
                        fontSize: 12,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFFf5f5f8),
              blurRadius: 12.0,
            ),
          ],
          color: Color(0xFFFfffff),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
