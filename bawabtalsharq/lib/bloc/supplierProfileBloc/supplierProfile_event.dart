abstract class SupplierProfileEvent {}

class DoSupplierProfileEvent extends SupplierProfileEvent {
  int id;
  DoSupplierProfileEvent(this.id);
}

class ResetState extends SupplierProfileEvent {}
