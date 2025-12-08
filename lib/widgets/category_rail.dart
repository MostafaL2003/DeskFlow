import 'package:flutter/material.dart';

class CategoryRail extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryRail({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<Map<String, dynamic>> categories = const [
    {"name": "All", "icon": Icons.apps, "color": Colors.black},
    {"name": "electronics", "icon": Icons.laptop_mac, "color": Colors.blue},
    {"name": "jewelery", "icon": Icons.diamond, "color": Colors.purple},
    {"name": "men's clothing", "icon": Icons.male, "color": Colors.orange},
    {"name": "women's clothing", "icon": Icons.female, "color": Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
              final isSelected = selectedCategory == cat['name'];

              return GestureDetector(
                onTap: () => onCategorySelected(cat['name']),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          border: Border.all(
                            color:
                                isSelected
                                    ? cat['color']
                                    : Colors.grey.shade300,
                            width: isSelected ? 3 : 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: cat['color'].withOpacity(0.1),
                          child: Icon(
                            cat['icon'],
                            color: cat['color'],
                            size: 28,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cat['name'].toString().toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
