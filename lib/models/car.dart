class Car {
  final String id;
  final String brand;
  final String model;
  final int year;
  final double dailyRate;
  
  bool _isAvailable = true;
  bool get isAvailable => _isAvailable;

  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.dailyRate,
  }) {
    if (id.trim().isEmpty) throw ArgumentError('ID mobil tidak boleh kosong.');
    if (dailyRate <= 0) throw ArgumentError('Tarif harian harus lebih dari 0.');
  }

  void _setAvailable(bool value) {
    _isAvailable = value;
  }
}

void setCarAvailability(Car car, bool status) {
  car._setAvailable(status);
}