import 'package:flutter/material.dart';

class BangunDatar extends StatelessWidget {
  const BangunDatar({super.key});

  @override
  Widget build(BuildContext context) {
    // Definisi palet warna biru yang nyaman di mata
    const Color primaryBlue = Color.fromARGB(
      255,
      77,
      124,
      196,
    ); // Biru profesional yang bersih
    const Color softBlue = Color(
      0xFFE9F2FF,
    ); // Biru sangat muda untuk background
    const Color textDark = Color(0xFF172B4D); // Abu-abu sangat gelap untuk teks

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Kalkulator Persegi Panjang",
          style: TextStyle(
            color: textDark,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // SEKSI INPUT DATA
              const Text(
                "Input Dimensi",
                style: TextStyle(
                  color: textDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildCleanInput("Panjang", Icons.straighten_outlined),
              const SizedBox(height: 12),
              _buildCleanInput("Lebar", Icons.square_foot_outlined),

              const SizedBox(height: 28),

              // TOMBOL AKSI (Menggunakan Expanded untuk layout rapi)
              Row(
                children: [
                  Expanded(
                    child: _buildElegantButton(
                      "Luas",
                      primaryBlue,
                      Colors.white,
                      Icons.area_chart_outlined,
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: _buildElegantButton(
                      "Keliling",
                      softBlue,
                      primaryBlue,
                      Icons.architecture_outlined,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // CARD HASIL YANG ELEGAN
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: softBlue,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text(
                      "HASIL AKHIR",
                      style: TextStyle(
                        color: primaryBlue.withOpacity(0.7),
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "0.0",
                      style: TextStyle(
                        color: textDark,
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // TOMBOL RESET MINIMALIS
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: primaryBlue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Reset Semua Data",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: primaryBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper untuk Input Field yang Clean
  Widget _buildCleanInput(String label, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Icon(icon, color: const Color(0xFF0052CC), size: 22),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  // Widget Helper untuk Button yang Elegant
  Widget _buildElegantButton(String label, Color bg, Color fg, IconData icon) {
    return SizedBox(
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 20),
        label: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
