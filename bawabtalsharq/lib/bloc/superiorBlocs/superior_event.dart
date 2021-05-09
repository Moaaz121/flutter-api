abstract class SuperiorEvent {}

class DoSuperiorEvent extends SuperiorEvent {}

class ResetState extends SuperiorEvent {}

class SuperiorPressEvent extends SuperiorEvent {
  int index;
  SuperiorPressEvent(this.index);
}
