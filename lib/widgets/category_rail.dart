import 'package:flutter/material.dart';

class CategoryRail extends StatelessWidget {
  const CategoryRail({super.key});

  final List<Map<String, dynamic>> categories = const [
    {"name": "All", "icon": Icons.apps, "color": Colors.black},
    {"name": "Tech", "icon": Icons.laptop_mac, "color": Colors.blue},
    {"name": "Jewelry", "icon": Icons.diamond, "color": Colors.purple},
    {"name": "Men", "icon": Icons.male, "color": Colors.orange},
    {"name": "Women", "icon": Icons.female, "color": Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Browse Categories",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 15),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: cat['color'], width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: cat['color'].withOpacity(0.1),
                        child: Icon(cat['icon'], color: cat['color'], size: 28),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      cat['name'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
