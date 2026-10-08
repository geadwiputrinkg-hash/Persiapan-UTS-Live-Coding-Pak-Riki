import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: false,
        title: const Text('Profile'),
      ),
      body: const Center(child: ProfilCard()),
    );
  }
}

class ProfilCard extends StatelessWidget {
  const ProfilCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('images/gea.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.teal, width: 3),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Gea Dwi Putri',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'seorang pembelajar yang mau belajar',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.teal.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              children: [
                KontakInfoRow(icon: Icons.email, teks: 'gea@gmail.com'),
                SizedBox(height: 10),
                KontakInfoRow(icon: Icons.phone, teks: '089999999'),
                SizedBox(height: 10),
                KontakInfoRow(icon: Icons.location_on, teks: 'Bangka Belitung'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KontakInfoRow extends StatelessWidget {
  final IconData icon;
  final String teks;

  const KontakInfoRow({super.key, required this.icon, required this.teks});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.teal),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            teks,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
