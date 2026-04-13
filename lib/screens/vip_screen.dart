import 'package:flutter/material.dart';
import '../utils/constants.dart';

class VipScreen extends StatelessWidget {
  const VipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.diamond, color: AppColors.gold, size: 28),
                  SizedBox(width: 8),
                  Text(
                    'Katyayani VIP Club',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Crown image placeholder
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: const Icon(
                  Icons.workspace_premium,
                  size: 80,
                  color: AppColors.gold,
                ),
              ),
              const SizedBox(height: 12),

              // Bronze badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.bronze,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Bronze',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // User name
              const Text(
                'vaibhaw',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 24),

              // Stats Cards
              Row(
                children: [
                  Expanded(child: _buildStatCard(
                    icon: Icons.monetization_on,
                    iconColor: AppColors.gold,
                    value: '25',
                    label: 'Krishi Coins',
                    onTap: () {},
                  )),
                  const SizedBox(width: 12),
                  Expanded(child: _buildStatCard(
                    icon: Icons.currency_rupee,
                    iconColor: AppColors.gold,
                    value: '3201',
                    label: 'Orders in last 90 days',
                    onTap: () {},
                  )),
                ],
              ),
              const SizedBox(height: 28),

              // Tier Progress
              _buildTierProgress(),
              const SizedBox(height: 24),

              // Info text card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Your membership is based on how much you spent in the last 90 days.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 28),

              // Benefits Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: AppColors.gold, size: 20),
                  SizedBox(width: 6),
                  Text(
                    'Benefits',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.star, color: AppColors.gold, size: 20),
                ],
              ),
              const SizedBox(height: 16),

              // Benefits card with current tier highlighted
              _buildBenefitsCard(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: iconColor, size: 28),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.white.withOpacity(0.7),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildTierProgress() {
    final tiers = [
      _TierData('Bronze', null, AppColors.bronze, true),
      _TierData('Silver', '₹10000', AppColors.silver, false),
      _TierData('Gold', '₹100000', AppColors.gold, false),
      _TierData('Platinum', '₹400000', AppColors.platinum, false),
      _TierData('Diamond', '₹700000', AppColors.diamond, false),
    ];

    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(tiers.length * 2 - 1, (index) {
          if (index.isOdd) {
            // Connector line between tiers
            final prevActive = tiers[index ~/ 2].isActive;
            return Expanded(
              child: Container(
                height: 3,
                color: prevActive
                    ? AppColors.bronze
                    : Colors.white.withOpacity(0.3),
              ),
            );
          }
          final tier = tiers[index ~/ 2];
          return _buildTierIcon(tier);
        }),
      ),
    );
  }

  static Widget _buildTierIcon(_TierData tier) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 44,
          decoration: BoxDecoration(
            color: tier.isActive
                ? tier.color
                : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(
              Icons.hexagon,
              color: tier.isActive ? AppColors.white : tier.color,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          tier.name,
          style: TextStyle(
            fontSize: 10,
            fontWeight: tier.isActive ? FontWeight.bold : FontWeight.normal,
            color: tier.isActive
                ? AppColors.white
                : Colors.white.withOpacity(0.6),
          ),
        ),
        if (tier.amount != null)
          Text(
            tier.amount!,
            style: TextStyle(
              fontSize: 9,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
      ],
    );
  }

  static Widget _buildBenefitsCard() {
    final benefitTiers = ['Bronze', 'Silver', 'Gold', 'Platinum', 'Diamond'];
    const currentTier = 'Bronze';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // Tier selector chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: benefitTiers.map((tier) {
                final isSelected = tier == currentTier;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.teal.withOpacity(0.3)
                          : Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: isSelected
                          ? Border.all(color: Colors.tealAccent, width: 1.5)
                          : null,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          tier,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? Colors.tealAccent
                                : Colors.white.withOpacity(0.7),
                          ),
                        ),
                        if (isSelected) ...[
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.tealAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'You are here',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: Colors.tealAccent,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),

          // Benefits list for current tier
          _buildBenefitRow(Icons.local_shipping, 'Free delivery on orders'),
          const SizedBox(height: 12),
          _buildBenefitRow(Icons.percent, 'Extra discount on products'),
          const SizedBox(height: 12),
          _buildBenefitRow(Icons.support_agent, 'Priority customer support'),
          const SizedBox(height: 12),
          _buildBenefitRow(
              Icons.monetization_on, '2x Krishi Coins on every order'),
        ],
      ),
    );
  }

  static Widget _buildBenefitRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.gold, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
      ],
    );
  }
}

class _TierData {
  final String name;
  final String? amount;
  final Color color;
  final bool isActive;

  const _TierData(this.name, this.amount, this.color, this.isActive);
}
