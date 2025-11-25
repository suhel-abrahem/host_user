import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'provider_page_event.dart';
part 'provider_page_state.dart';

class ProviderPageBloc extends Bloc<ProviderPageEvent, ProviderPageState> {
  ProviderPageBloc() : super(ProviderPageInitial()) {
    on<ProviderPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
