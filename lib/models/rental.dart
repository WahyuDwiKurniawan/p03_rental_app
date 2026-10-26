import 'car.dart';
import 'customer.dart';
import 'rental_exception.dart';
import 'rental_status.dart';

class Rental {
  final String id;
  final Customer customer;
  final Car car;
  final int durationDays;
  final double totalPrice;

  RentalStatus _status = RentalStatus.active;
  RentalStatus get status => _status;

  Rental({
    required this.id,
    required this.customer,
    required this.car,
    required this.durationDays,
  }) : totalPrice = car.dailyRate * durationDays {
    if (id.trim().isEmpty) {
      throw RentalException('ID rental tidak boleh kosong.');
    }
    if (durationDays <= 0) {
      throw RentalException('Durasi rental harus lebih dari 0 hari.');
    }
    if (!car.isAvailable) {
      throw RentalException('Mobil sedang disewa dan tidak tersedia.');
    }
    setCarAvailability(car, false);
  }

  void complete() {
    if (_status != RentalStatus.active) {
      throw RentalException('Hanya rental aktif yang dapat diselesaikan.');
    }
    _status = RentalStatus.completed;
    setCarAvailability(car, true);
  }

  void cancel() {
    if (_status != RentalStatus.active) {
      throw RentalException('Hanya rental aktif yang dapat dibatalkan.');
    }
    _status = RentalStatus.cancelled;
    setCarAvailability(car, true);
  }
}