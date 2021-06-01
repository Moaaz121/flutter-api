abstract class SupplierProfileEvent {}

class DoSupplierProfileEvent extends SupplierProfileEvent {
  String id;
  DoSupplierProfileEvent(this.id);
}

class ResetState extends SupplierProfileEvent {}
