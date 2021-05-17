abstract class CurrencyEvent {}

class GetCurrencyData extends CurrencyEvent {
  GetCurrencyData();
}

class ResetState extends CurrencyEvent {}
