import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCream,
      body: Column(
        children: [
          // App bar matching Zoho style
          Container(
            color: AppColors.white,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 16,
              right: 16,
              bottom: 12,
            ),
            child: Row(
              children: [
                const Icon(Icons.menu, color: AppColors.textDark, size: 26),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Katyayani',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.account_balance_wallet_outlined,
                          color: AppColors.primaryGreen, size: 18),
                      SizedBox(width: 4),
                      Text(
                        '₹0',
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.notifications_outlined,
                    color: AppColors.textDark, size: 26),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.borderGrey),

          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderGrey),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: AppColors.grey, size: 22),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Search products...',
                      style: TextStyle(color: AppColors.textMuted, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Catalog content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildCategoryGrid(),
                  const SizedBox(height: 24),
                  const Text(
                    'Catalogues',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Chemicals',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ..._chemicalCatalogues
                      .map((name) => _buildCatalogueCard(name))
                      .toList(),
                  const SizedBox(height: 12),
                  const Text(
                    'Bio',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ..._bioCatalogues
                      .map((name) => _buildCatalogueCard(name))
                      .toList(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const List<Map<String, dynamic>> _categories = [
    {'label': 'Pesticide', 'icon': Icons.bug_report_outlined, 'color': Color(0xFFEF5350)},
    {'label': 'Fertilizer', 'icon': Icons.grass, 'color': Color(0xFF42A5F5)},
    {'label': 'Fungicide', 'icon': Icons.eco_outlined, 'color': Color(0xFFAB47BC)},
    {'label': 'Herbicide', 'icon': Icons.spa_outlined, 'color': Color(0xFFFF7043)},
    {'label': 'Combos', 'icon': Icons.inventory_2_outlined, 'color': Color(0xFF26A69A)},
  ];

  static const List<String> _chemicalCatalogues = [
    'Chemical Insecticides Catalogue',
    'Chemical Fungicide Catalogue',
    'Herbicide Catalogue',
    'PGR Catalogue',
    'NPK Fertilizer Catalogue',
    'Other Fertilizers Catalogue',
    'Seed Treatment Catalogue',
  ];

  static const List<String> _bioCatalogues = [
    'Bio Product Catalogue',
  ];

  Widget _buildCategoryGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final cat = _categories[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderGrey),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: (cat['color'] as Color).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  cat['icon'] as IconData,
                  color: cat['color'] as Color,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                cat['label'] as String,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCatalogueCard(String name) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.menu_book_outlined,
                color: AppColors.primaryGreen.withOpacity(0.6), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.visibility_outlined),
            color: AppColors.primaryGreen,
            iconSize: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.download_rounded),
            color: AppColors.orange,
            iconSize: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
