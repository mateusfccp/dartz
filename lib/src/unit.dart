// ignore_for_file: unnecessary_new
// ignore_for_file: unnecessary_const

part of dartz;

/// A single-value type.
/// 
/// The [Unit] is a singleton type. This means that every instance of the [Unit] will be, a reference to the same value.
/// 
/// As Dart won't guarantee this, [Unit] can't be instantiated, and the properly way to use [Unit] is to return the variable
/// [unit], defined on the library:
/// 
/// ```dart
/// Unit doSomething(...) {
///   // Do many things...
///   return unit;
/// }
/// ```
/// 
/// The [String] representation of [Unit] is `()`.
/// 
/// If you need the monoidal [Unit], check [UnitMonoid].
/// 
/// ## Additional details
/// 
/// Conceptually, [Unit] is, to some extent, equivalent to Dart's `void`. For example, `void` is a singleton, and it's used
/// when we don't really care about a method's returning value or generic type.  However, `void` is not a real type and has a
/// lot of inconsistencies. Also, it lacks its monoidal properties, and can't be used on type compositions.
/// 
/// To solve these problems, the [Unit] and [UnitMonoid] types are provided here.
class Unit {
  const Unit._internal();
  @override String toString() => "()";
}

const Unit unit = const Unit._internal();

/// The monoidal class of [Unit].
/// 
/// Both the [zero] and [append] methods, obviously, can only return [unit].
/// 
/// The variable [UnitMi] may be used instead for practical reasons.
class UnitMonoid extends Monoid<Unit> {
  @override Unit zero() => unit;

  @override Unit append(Unit u1, Unit u2) => unit;
}

/// The [UnitMonoid] value.
final Monoid<Unit> UnitMi = new UnitMonoid();
