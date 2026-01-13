import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanatesting1/persegi_panjang_bloc.dart';

// === MODERN PRODUCT PALETTE ===
const Color kPrimary = Color(0xFF0F2A44);
const Color kAccent = Color(0xFF38BDF8);
const Color kSurface = Color(0xFFF1F5F9);
const Color kCard = Color(0xFFFFFFFF);
const Color kTextDark = Color(0xFF0F172A);
const Color kTextSoft = Color(0xFF64748B);

class InputCard extends StatelessWidget {
  final TextEditingController panjangController;
  final TextEditingController lebarController;
  final Function(String) onPanjangChanged;
  final Function(String) onLebarChanged;

  const InputCard({
    super.key,
    required this.panjangController,
    required this.lebarController,
    required this.onPanjangChanged,
    required this.onLebarChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 110,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 18, offset: const Offset(0, 10)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("DIMENSI", style: TextStyle(fontSize: 12, letterSpacing: 1, color: kTextSoft)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: "Panjang",
                    icon: Icons.straighten,
                    controller: panjangController,
                    onChanged: onPanjangChanged,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    label: "Lebar",
                    icon: Icons.square_foot,
                    controller: lebarController,
                    onChanged: onLebarChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      style: const TextStyle(fontWeight: FontWeight.w600, color: kTextDark),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: kAccent),
        filled: true,
        fillColor: kSurface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: kAccent),
        ),
      ),
      onChanged: onChanged,
    );
  }
}

class ActionButtons extends StatelessWidget {
  final VoidCallback onLuasPressed;
  final VoidCallback onKelilingPressed;

  const ActionButtons({super.key, required this.onLuasPressed, required this.onKelilingPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 28),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, -6)),
          ],
        ),
        child: Row(
          children: [
            Expanded(child: _buildButton("Hitung Luas", Icons.area_chart, kPrimary, onLuasPressed)),
            const SizedBox(width: 14),
            Expanded(child: _buildButton("Hitung Keliling", Icons.architecture, kAccent, onKelilingPressed)),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, IconData icon, Color bg, VoidCallback onPressed) {
    return SizedBox(
      height: 54,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      top: 90,
      child: BlocBuilder<PersegiPanjangBloc, PersegiPanjangState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [kPrimary, Color(0xFF1E3A8A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                const Text("HASIL", style: TextStyle(letterSpacing: 1, fontSize: 12, color: Colors.white70)),
                const SizedBox(height: 12),
                Text(
                  state.hasil
                      .toStringAsFixed(2)
                      .replaceAll(RegExp(r"([.]*0)(?!.*\d)"), ""),
                  style: const TextStyle(fontSize: 46, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
