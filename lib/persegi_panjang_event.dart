part of 'persegi_panjang_bloc.dart';


@immutable
abstract class PersegiPanjangEvent {}

class PanjangChanged extends PersegiPanjangEvent {
  final String panjang;
  PanjangChanged(this.panjang);
}

class LebarChanged extends PersegiPanjangEvent {
  final String lebar;
  LebarChanged(this.lebar);
}

class HitungLuas extends PersegiPanjangEvent {}

class HitungKeliling extends PersegiPanjangEvent {}

class Reset extends PersegiPanjangEvent {}
