// ignore_for_file: unnecessary_new

part of dartz;

/// A semigroup with an identity method.
/// 
/// A [Monoid<A>] has the same requirements as a [Semigroup<A>], plus a method [zero] that returns an `A`
/// that, when [append]ed with another `A x`, returns `x`.
/// 
/// For example, a [Monoid] on [int] could be like:
/// ```dart
/// class IntMonoid extends Monoid<int> {
///   @override
///   int append(int a1, int a2) => a1 * a2;
/// 
///   @override
///   ind zero() => 1;
/// }
///
/// var m = IntMonoid();
/// m.append(10, m.zero()); // 10
/// ```
///
/// For trivial cases, you may create an anonymous monoid quickly with the [monoid] function:
/// ```dart
/// var m = monoid<int>(() => 1, (a, b) => a * b);
/// ```
/// 
/// ## In-depth references
/// - [nLab on Monoid](https://ncatlab.org/nlab/show/monoid)
/// - [nLab on Monoidal Category](https://ncatlab.org/nlab/show/monoidal+category)
/// - [Typeclassopedia](https://wiki.haskell.org/Typeclassopedia#Monoid)
abstract class Monoid<A> extends Semigroup<A> {
  A zero();
}

class _AnonymousMonoid<A> extends Monoid<A> {
  final Function0<A> _zero;
  final Function2<A, A, A> _append;

  _AnonymousMonoid(this._zero, this._append);

  @override A zero() => _zero();

  @override A append(A a1, A a2) => _append(a1, a2);
}

Monoid<A> monoid<A>(A zero(), A append(A t1, A t2)) => new _AnonymousMonoid(zero, append);
