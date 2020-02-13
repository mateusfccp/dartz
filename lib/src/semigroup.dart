// ignore_for_file: unnecessary_new

part of dartz;

/// A structure with an associative append method.
/// 
/// A [Semigroup<A>] has only two requirements:
/// - It has to have an [append] method that combines two `A`.
/// - This method has to be associative, i.e. `append(append(a, b), c) == append(a, append(b, c))`.
/// 
/// For example, a [Semigroup] on [int] could be like:
/// ```dart
/// class IntSemigroup extends Semigroup<int> {
///   @override
///   int append(int a1, int a2) => a1 + a2;
/// }
///
/// var s = IntSemigroup();
/// s.append(10, 5); // 15
/// s.append(1, s.append(2, 3)) == s.append(s.append(1, 2), 3); // true
/// ```
/// 
/// For trivial cases, you may create an anonymous semigroup quickly with the [semigroup] function:
/// ```dart
/// var s = semigroup<int>((a, b) => a + b);
/// ```
/// 
/// If you need a curried [append], refer to [appendC].
/// 
/// ## In-depth references
/// - [nLab on Semigroup](https://ncatlab.org/nlab/show/semigroup)
/// - [Typeclassopedia](https://wiki.haskell.org/Typeclassopedia#Semigroup)
/// 
abstract class Semigroup<A> {
  /// Combines two elements into one.
  /// 
  /// This method is required to be associative, i.e. `append(append(a, b), c) == append(a, append(b, c))`.
  A append(A a1, A a2);

  /// Combines two elements into one (curryed).
  Endo<A> appendC(A a1) => (A a2) => append(a1, a2);
}

class _AnonymousSemigroup<A> extends Semigroup<A> {
  final Function2<A, A, A> _append;

  _AnonymousSemigroup(this._append);

  @override A append(A a1, A a2) => _append(a1, a2);
}

/// Creates an anonymous [Semigroup] on `A` by providing the [append] method.
Semigroup<A> semigroup<A>(A append(A a1, A a2)) => new _AnonymousSemigroup(append);

/// A [Semigroup] which [append] always return the first element.
final Semigroup FirstSemigroup = semigroup((a1, a2) => a1);

/// Creates a [Semigroup] on `A` which [append] always return the first element.
Semigroup<A> firstSemigroup<A>() => semigroup((a1, a2) => a1);

/// A [Semigroup] which [append] always return the second element.
final Semigroup SecondSemigroup = semigroup((a1, a2) => a2);

/// Creates a [Semigroup] on `A` which [append] always return the second element.
Semigroup<A> secondSemigroup<A>() => semigroup((a1, a2) => a2);


