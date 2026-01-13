import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:kanatesting1/persegi_panjang_bloc.dart';



part 'persegi_panjang_event.dart';
part 'persegi_panjang_state.dart';

class PersegiPanjangBloc
    extends Bloc<PersegiPanjangEvent, PersegiPanjangState> {
  PersegiPanjangBloc() : super(const PersegiPanjangState()) {
    on<PanjangChanged>((event, emit) {
      emit(state.copyWith(panjang: double.tryParse(event.panjang) ?? 0));
    });

    on<LebarChanged>((event, emit) {
      emit(state.copyWith(lebar: double.tryParse(event.lebar) ?? 0));
    });

    on<HitungLuas>((event, emit) {
      emit(state.copyWith(hasil: state.panjang * state.lebar));
    });

    on<HitungKeliling>((event, emit) {
      emit(state.copyWith(hasil: 2 * (state.panjang + state.lebar)));
    });

    on<Reset>((event, emit) {
      emit(const PersegiPanjangState());
    });
  }
}