import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------- Top green header section ----------
            _buildHeader(),

            const SizedBox(height: 16),

            // ---------- User info card ----------
            _buildUserCard(),

            const SizedBox(height: 20),

            // ---------- Progress section ----------
            _buildProgressSection(),

            const SizedBox(height: 20),

            // ---------- Menu items ----------
            _buildMenuItem(Icons.menu_book, 'Address Book'),
            _buildMenuItem(Icons.shopping_bag_outlined, 'Orders'),
            _buildMenuItem(Icons.shopping_cart_outlined, 'Cart'),
            _buildMenuItem(
              Icons.verified_user_outlined,
              'Request Pesticide Certificate',
              trailing: const Icon(Icons.lock_outline, color: AppColors.grey, size: 20),
            ),
            _buildMenuItem(Icons.account_balance_wallet_outlined, 'My Wallet'),
            _buildMenuItem(Icons.monetization_on_outlined, 'My Coins'),
            _buildMenuItem(Icons.card_giftcard, 'Refer and Earn'),

            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryGreen,
        child: const Icon(Icons.menu, color: AppColors.white),
      ),
    );
  }

  // ===================== Header =====================
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.primaryGreen,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          child: Column(
            children: [
              // Avatar + phone icon row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 32, color: AppColors.white),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.phone, color: AppColors.white, size: 22),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Complete your profile to access exclusive app features!',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.primaryGreen,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Complete Now',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===================== User Card =====================
  Widget _buildUserCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryGreen, AppColors.darkGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            // Edit icon top-right
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.edit, color: AppColors.white, size: 20),
              ),
            ),

            // Coin badge bottom-right
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.monetization_on, color: AppColors.gold, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '25',
                    style: AppTextStyles.subheading.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),

            // User details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VAIBHAW VISHAL',
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                _buildInfoRow(Icons.phone_android, '8720055676'),
                const SizedBox(height: 4),
                _buildInfoRow(Icons.assignment, '23JYOPS2031C1Z1'),
                const SizedBox(height: 4),
                _buildInfoRow(Icons.location_on_outlined, 'shshjzhs hshshsns'),
                const SizedBox(height: 4),
                _buildInfoRow(Icons.flag_outlined, 'India'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 16),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: AppTextStyles.body.copyWith(color: Colors.white70, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // ===================== Progress =====================
  Widget _buildProgressSection() {
    const double progress = 0.4615;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress', style: AppTextStyles.subheading),
              Text(
                '46.15 %',
                style: AppTextStyles.subheading.copyWith(color: AppColors.primaryGreen),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: AppColors.lightGrey,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryGreen),
            ),
          ),
        ],
      ),
    );
  }

  // ===================== Menu Item =====================
  Widget _buildMenuItem(IconData icon, String title, {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                children: [
                  Icon(icon, color: AppColors.primaryGreen, size: 24),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(title, style: AppTextStyles.body.copyWith(fontSize: 15)),
                  ),
                  trailing ??
                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.grey,
                        size: 22,
                      ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 0.5, color: Color(0xFFE0E0E0)),
        ],
      ),
    );
  }
}
