import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

// ---------------------------------------------------------------------------
// Dummy data
// ---------------------------------------------------------------------------

class _Product {
  final String name;
  final String category;
  final String priceLabel;

  const _Product({
    required this.name,
    required this.category,
    required this.priceLabel,
  });
}

const List<_Product> _recommendedProducts = [
  _Product(
    name: 'CYPERMETHRIN 5% + ALLETHRIN 3.6%',
    category: 'pesticide',
    priceLabel: '₹0 onwards',
  ),
  _Product(
    name: 'NEEM OIL + KARANJ OIL + CASTOR OIL',
    category: 'pesticide',
    priceLabel: '₹0 onwards',
  ),
  _Product(
    name: 'Katyayani NPK 19:19:19 Fertilizer',
    category: 'fertilizer',
    priceLabel: '₹0 onwards',
  ),
  _Product(
    name: 'Katyayani Humic Acid 98% Granules',
    category: 'bio product',
    priceLabel: '₹0 onwards',
  ),
  _Product(
    name: 'Katyayani Carbendazim 50% WP',
    category: 'fungicide',
    priceLabel: '₹0 onwards',
  ),
  _Product(
    name: 'Katyayani Imidacloprid 17.8% SL',
    category: 'pesticide',
    priceLabel: '₹0 onwards',
  ),
];

final List<Map<String, dynamic>> _banners = [
  {
    'title': 'Bulk Order Bonus',
    'subtitle': 'Get 5% extra coins on orders above ₹5',
    'cta': 'Order Now',
  },
  {
    'title': 'Partner Exclusive Deals',
    'subtitle': 'Flat 10% off on all fertilizers this week',
    'cta': 'Shop Now',
  },
  {
    'title': 'New Arrivals',
    'subtitle': 'Check out latest bio products range',
    'cta': 'Explore',
  },
];

// ---------------------------------------------------------------------------
// Home Screen
// ---------------------------------------------------------------------------

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _bannerController = PageController();
  int _currentBanner = 0;
  Timer? _bannerTimer;

  @override
  void initState() {
    super.initState();
    _bannerTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final next = (_currentBanner + 1) % _banners.length;
      _bannerController.animateToPage(
        next,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerController.dispose();
    super.dispose();
  }

  // -----------------------------------------------------------------------
  // App Bar - Zoho style
  // -----------------------------------------------------------------------
  Widget _buildAppBar() {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      child: Row(
        children: [
          // Hamburger menu
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.menu, color: AppColors.textDark, size: 26),
          ),
          const SizedBox(width: 16),
          // Katyayani logo/text
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
                letterSpacing: 0.5,
              ),
            ),
          ),
          const Spacer(),
          // Wallet
          GestureDetector(
            onTap: () {},
            child: Container(
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
          ),
          const SizedBox(width: 12),
          // Notification bell
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.notifications_outlined,
                color: AppColors.textDark, size: 26),
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------
  // Banner Carousel - Zoho style
  // -----------------------------------------------------------------------
  Widget _buildBannerCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: _bannerController,
            onPageChanged: (i) => setState(() => _currentBanner = i),
            itemCount: _banners.length,
            itemBuilder: (context, index) {
              final banner = _banners[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner_bg.png'),
                    fit: BoxFit.cover,
                    opacity: 0.3,
                  ),
                ),
                child: Stack(
                  children: [
                    // Right arrow
                    Positioned(
                      right: 12,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.25),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.chevron_right,
                              color: AppColors.white, size: 20),
                        ),
                      ),
                    ),
                    // Left arrow
                    Positioned(
                      left: 12,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.25),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.chevron_left,
                              color: AppColors.white, size: 20),
                        ),
                      ),
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 60, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner['title'] as String,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            banner['subtitle'] as String,
                            style: TextStyle(
                              color: AppColors.white.withOpacity(0.85),
                              fontSize: 13,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  banner['cta'] as String,
                                  style: const TextStyle(
                                    color: AppColors.primaryGreen,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.chevron_right,
                                    color: AppColors.primaryGreen, size: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _currentBanner == i ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentBanner == i
                    ? AppColors.primaryGreen
                    : AppColors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // -----------------------------------------------------------------------
  // Order Transit Cards - Zoho style
  // -----------------------------------------------------------------------
  Widget _buildOrderTransitCard({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGrey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBgColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconBgColor, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.grey, size: 22),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------
  // Recommended Products Section
  // -----------------------------------------------------------------------
  Widget _buildSectionHeader(String title, {VoidCallback? onViewAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.trending_up, color: AppColors.primaryGreen, size: 20),
          const SizedBox(width: 6),
          Text(title, style: AppTextStyles.heading),
          const Spacer(),
          if (onViewAll != null)
            GestureDetector(
              onTap: onViewAll,
              child: const Text(
                'View All',
                style: TextStyle(
                  color: AppColors.primaryGreen,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProductCard(_Product product) {
    Color categoryColor;
    switch (product.category.toLowerCase()) {
      case 'pesticide':
        categoryColor = AppColors.primaryGreen;
        break;
      case 'fertilizer':
        categoryColor = const Color(0xFF1565C0);
        break;
      case 'fungicide':
        categoryColor = const Color(0xFF7B1FA2);
        break;
      case 'bio product':
        categoryColor = const Color(0xFF00897B);
        break;
      default:
        categoryColor = AppColors.primaryGreen;
    }

    return Container(
      width: 165,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGrey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image area
          Container(
            height: 130,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Stack(
              children: [
                const Center(
                  child: Icon(Icons.image_outlined, size: 48, color: AppColors.grey),
                ),
                // Category tag
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      product.category,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  product.priceLabel,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                // Get Quote + Share icons
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderGrey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.request_quote_outlined,
                                color: AppColors.primaryGreen, size: 14),
                            SizedBox(width: 4),
                            Text(
                              'Get Quote',
                              style: TextStyle(
                                color: AppColors.primaryGreen,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderGrey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.share_outlined,
                          color: AppColors.grey, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _recommendedProducts.length,
        itemBuilder: (context, index) =>
            _buildProductCard(_recommendedProducts[index]),
      ),
    );
  }

  // -----------------------------------------------------------------------
  // Welcome / Coin Balance Card
  // -----------------------------------------------------------------------
  Widget _buildWelcomeCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B6B2A), Color(0xFF2E7D32)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.85),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  '+916299207689',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Coin Balance',
                style: TextStyle(
                  color: AppColors.white.withOpacity(0.85),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                '₹0',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------
  // Build
  // -----------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCream,
      body: Column(
        children: [
          _buildAppBar(),
          // Thin divider line
          Container(height: 1, color: AppColors.borderGrey),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  _buildBannerCarousel(),

                  const SizedBox(height: 14),

                  // Order transit cards
                  _buildOrderTransitCard(
                    icon: Icons.local_shipping_outlined,
                    iconBgColor: AppColors.transitIconGreen,
                    title: '5 orders in transit',
                    subtitle: 'Track your shipments',
                  ),
                  _buildOrderTransitCard(
                    icon: Icons.delivery_dining_outlined,
                    iconBgColor: AppColors.primaryGreen,
                    title: '15 orders in transit',
                    subtitle: 'Track your orders',
                  ),

                  const SizedBox(height: 20),

                  // Recommended Products
                  _buildSectionHeader('Recommended Products',
                      onViewAll: () {}),
                  const SizedBox(height: 12),
                  _buildProductList(),

                  const SizedBox(height: 20),

                  // Welcome card
                  _buildWelcomeCard(),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
