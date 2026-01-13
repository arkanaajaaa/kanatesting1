import 'package:kanatesting1/persegi_panjang_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import  'Bangun_Datar_Widget.dart';

class Bangundatar extends StatelessWidget {
  const Bangundatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersegiPanjangBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5), // Background abu-abu lembut
        appBar: AppBar(
          title: const Text(
            "Kalkulator Persegi Panjang",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: const _BangunDatarView(),
      ),
    );
  }
}

class _BangunDatarView extends StatefulWidget {
  const _BangunDatarView();

  @override
  State<_BangunDatarView> createState() => _BangunDatarViewState();
}

class _BangunDatarViewState extends State<_BangunDatarView> {
  // Controller untuk mengontrol input text
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();

  @override
  void dispose() {
    _panjangController.dispose();
    _lebarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil instance bloc untuk menambahkan event
    final bloc = context.read<PersegiPanjangBloc>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Komponen Input
            InputCard(
              panjangController: _panjangController,
              lebarController: _lebarController,
              onPanjangChanged: (val) => bloc.add(PanjangChanged(val)),
              onLebarChanged: (val) => bloc.add(LebarChanged(val)),
            ),
            const SizedBox(height: 24),

            // Komponen Tombol Aksi
            ActionButtons(
              onLuasPressed: () => bloc.add(HitungLuas()),
              onKelilingPressed: () => bloc.add(HitungKeliling()),
            ),
            const SizedBox(height: 32),

            // Komponen Hasil
            const ResultDisplay(),
            const SizedBox(height: 24),

            // Reset Button
            Center(
              child: TextButton.icon(
                onPressed: () {
                  bloc.add(Reset());
                  // Bersihkan text field saat reset
                  _panjangController.clear();
                  _lebarController.clear();
                },
                icon: const Icon(Icons.refresh, color: Colors.grey),
                label: const Text(
                  "Reset Data",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
