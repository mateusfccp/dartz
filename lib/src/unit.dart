// ignore_for_file: unnecessary_new
// ignore_for_file: unnecessary_const

part of dartz;

/// A single-value type that carries no information.
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
/// Conceptually, [Unit] is, to some extent, equivalent to Dart's [void]. For example, [void] is a singleton, and it's used
/// when we don't really care about a method's returning value or generic type.  However, [void] is not really a type, and thus has
/// some inconsistencies, like:
///
/// - Although we can declare a variable as [void], the variable can only be assigned through a [void] function.
/// - [void] expressions can't be used.
/// - Returning values in a regular [void] method result in a `Error: Can't return a value from a void function.`, while [void] expression methods can return any value;
/// - Even if the compiler states that we can't return a value from a [void] function, it won't complain if we return [void] functions, [null] and [dynamic];
/// - Even being able to return any value from [void] expression  methods, the returned value can't be used;
/// 
/// ## In-depth references
/// - [nLab on Unit type](https://ncatlab.org/nlab/show/unit+type)
/// - [nLab on Terminal Objects](https://ncatlab.org/nlab/show/terminal+object)
/// - [Category Theory for Programmers](https://bartoszmilewski.com/2015/01/07/products-and-coproducts/) (refer to "Terminal Object" section)
/// 
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
