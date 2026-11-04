import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/eco_logo.dart';
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _Header(onProfile: () => context.go('/login')),
              _Hero(onStart: () => context.go('/login')),
              const _About(),
              const _Features(),
              const _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
 
class _Header extends StatelessWidget {
  final VoidCallback onProfile;
  const _Header({required this.onProfile});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const EcoLogo(),
              const Spacer(),
              InkWell(
                onTap: onProfile,
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: AppTheme.softShadow,
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Selamat Datang di EcoHome',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          const Text(
            'Platform pengelolaan sampah organik rumah tangga yang membantu Anda berkontribusi untuk lingkungan.',
            style: TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
 
class _Hero extends StatelessWidget {
  final VoidCallback onStart;
  const _Hero({required this.onStart});
 
  Widget _bubble(IconData icon, double size, {double alpha = 0.18}) =>
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: alpha),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.white, size: size * 0.5),
      );
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.dark, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _bubble(Icons.eco_rounded, 120, alpha: 0.15),
                Positioned(
                  left: 20,
                  top: 10,
                  child: _bubble(Icons.recycling_rounded, 52),
                ),
                Positioned(
                  right: 20,
                  bottom: 10,
                  child: _bubble(Icons.compost_rounded, 56),
                ),
                Positioned(
                  right: 50,
                  top: 6,
                  child: _bubble(Icons.spa_rounded, 36),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Ubah Sampah Organik Menjadi Berkah',
            style: TextStyle(
              fontSize: 24,
              height: 1.25,
              fontWeight: FontWeight.w800,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Kelola sampah dapur Anda menjadi kompos dan manfaat bernilai untuk lingkungan sekitar.',
            style: TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: AppColors.white.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 22),
          CustomButton(label: 'Mulai Sekarang', onPressed: onStart, light: true),
        ],
      ),
    );
  }
}
 
class _About extends StatelessWidget {
  const _About();
 
  static const _points = [
    (Icons.school_outlined, 'Edukasi Pengolahan Sampah'),
    (Icons.groups_outlined, 'Pemberdayaan Masyarakat'),
    (Icons.autorenew_rounded, 'Ekonomi Sirkular'),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Apa Itu EcoHome?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          const Text(
            'EcoHome adalah platform pengelolaan sampah organik rumah tangga yang menghubungkan masyarakat dengan pengetahuan, produk, dan mitra pengolahan sampah.',
            style: TextStyle(
              fontSize: 13.5,
              height: 1.55,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          for (final p in _points)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(p.$1, color: AppColors.primary, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      p.$2,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
 
class _Features extends StatelessWidget {
  const _Features();
 
  static const _items = [
    (
      Icons.storefront_outlined,
      'Marketplace Produk Organik',
      'Temukan produk ramah lingkungan hasil olahan sampah organik.'
    ),
    (
      Icons.menu_book_outlined,
      'Panduan Kompos dan Maggot BSF',
      'Pelajari cara mengolah sampah dapur menjadi kompos dan pakan maggot.'
    ),
    (
      Icons.handshake_outlined,
      'Rekomendasi Mitra Pengolahan',
      'Dapatkan rekomendasi mitra yang siap membantu mengolah sampah Anda.'
    ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fitur EcoHome',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 14),
          for (final f in _items)
            Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: AppTheme.softShadow,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(f.$1, color: AppColors.primary),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          f.$2,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          f.$3,
                          style: const TextStyle(
                            fontSize: 12.5,
                            height: 1.5,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
 
class _Footer extends StatelessWidget {
  const _Footer();
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EcoLogo(light: true),
          const SizedBox(height: 14),
          const Text(
            'Dari Sampah Menjadi Manfaat',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'EcoHome membantu rumah tangga mengelola sampah organik secara bijak untuk lingkungan yang lebih lestari.',
            style: TextStyle(
              fontSize: 12.5,
              height: 1.55,
              color: AppColors.white.withValues(alpha: 0.75),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            '© 2026 EcoHome',
            style: TextStyle(
              fontSize: 11.5,
              color: AppColors.white.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}
 