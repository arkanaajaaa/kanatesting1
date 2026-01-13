part of 'persegi_panjang_bloc.dart';

class PersegiPanjangState {
  final double panjang;
  final double lebar;
  final double hasil;

  const PersegiPanjangState({this.panjang = 0, this.lebar = 0, this.hasil = 0});

  PersegiPanjangState copyWith({
    double? panjang,
    double? lebar,
    double? hasil,
  }) {
    return PersegiPanjangState(
      panjang: panjang ?? this.panjang,
      lebar: lebar ?? this.lebar,
      hasil: hasil ?? this.hasil,
    );
  }
}
