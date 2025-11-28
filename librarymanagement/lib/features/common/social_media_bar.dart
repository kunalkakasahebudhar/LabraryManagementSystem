import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SocialIcon(
            assetPath: 'assets/svg_icons/google.svg',
            isSvg: true,
            onTap: () => _launchUrl('https://google.com'),
          ),
          const SizedBox(width: 20),
          _SocialIcon(
            assetPath: 'assets/svg_icons/youtube.png',
            isSvg: false,
            onTap: () => _launchUrl('https://youtube.com'),
          ),
          const SizedBox(width: 20),
          _SocialIcon(
            assetPath: 'assets/svg_icons/facebook.png',
            isSvg: false,
            onTap: () => _launchUrl('https://facebook.com'),
          ),
          const SizedBox(width: 20),
          _SocialIcon(
            assetPath: 'assets/svg_icons/instagram.png',
            isSvg: false,
            onTap: () => _launchUrl('https://instagram.com'),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch $uri');
    }
  }
}

class _SocialIcon extends StatelessWidget {
  final String assetPath;
  final bool isSvg;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.assetPath,
    required this.isSvg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: isSvg ? SvgPicture.asset(assetPath) : Image.asset(assetPath),
      ),
    );
  }
}
