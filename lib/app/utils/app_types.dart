enum ActionType { create, read, update, delete }

enum EventType {
  groupEvent('Kegiatan Kelompok'),
  coopEvent('Kegiatan Koperasi');

  static EventType fromJson(String? value) {
    switch (value) {
      case 'debit':
        return EventType.groupEvent;
      case 'credit':
      default:
        return EventType.coopEvent;
    }
  }

  final String displayName;
  const EventType(String this.displayName);
}
