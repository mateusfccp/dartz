// ignore_for_file: unnecessary_new

part of dartz;

/// An abstraction over types that can be [map]ped over.
///
/// An implementation of a [Functor] must have a [map] function, which maps its "internal value".
/// For example, a [List] of `A` has a [map] function that takes a function from `A` to `B` and returns
/// a [List] of `B`.
///
/// ```dart
/// // As the [map] function passed receives a String and returns a int,
/// // the List<String> is mapped to a List<int>.
/// ['one', 'two', 'three'].map((element) => element.length); // [3, 3, 5]
/// ```
///
/// Examples of [Functor]s are [IList] and [Option].
///
/// For a OO-friendly version of [Functor], refer to [FunctorOps].
///
/// ## In-depth references
/// - [nLab on Functor](https://ncatlab.org/nlab/show/functor)
/// - [nLab on Endofunctor](https://ncatlab.org/nlab/show/endofunctor)
/// - [Typeclassopedia](https://wiki.haskell.org/Typeclassopedia#Functor)
abstract class Functor<F> {
  /// Returns a new [F] by applying [f] to [fa].
  ///
  /// Example:
  /// ```dart
  /// final future =
  ///     Future.delayed(const Duration(seconds: 5))
  ///           .then<int>((_) => 100);
  ///
  /// final mappedFuture = await FutureM.map(future, (int a) => a ~/ 10);
  /// assert(mappedFuture == 10);
  /// ```
  F map<A, B>(F fa, B f(A a));

  /// Injects [b] to the left of the [A] value of [fa] as a tuple.
  ///
  /// Example:
  /// ```dart
  /// final future =
  ///  Future.delayed(const Duration(seconds: 5))
  ///        .then<int>((_) => 100);
  ///
  /// final mappedFuture = await FutureM.strengthL(future, 'B');
  /// assert(mappedFuture == Tuple2('B', 100));
  /// ```
  F strengthL<A, B>(F fa, B b) => map(fa, (a) => tuple2(b, a));

  /// Injects [b] to the right of the [A] value of [fa] as a tuple.
  ///
  /// Example:
  /// ```dart
  /// final future =
  ///  Future.delayed(const Duration(seconds: 5))
  ///        .then<int>((_) => 100);
  ///
  /// final mappedFuture = await FutureM.strengthR(future, 'B');
  /// assert(mappedFuture == Tuple2(100, 'B'));
  /// ```
  F strengthR<A, B>(F fa, B b) => map(fa, (a) => tuple2(a, b));

  Functor<F> /** Functor<F<G<_>>> **/ composeF(Functor G) =>
      new ComposedFunctor(this, G);
}

// Compose Functor<F<_>> with Functor<G<_>>, yielding Functor<F<G<_>>> sum⨁types
class ComposedFunctor<F, G> extends Functor<F> {
  final Functor<F> _F;
  final Functor<G> _G;

  ComposedFunctor(this._F, this._G);

  @override
  F map<A, B>(F fga, B f(A _)) => _F.map(fga, (G ga) => _G.map(ga, f));
}

/// A OO-friendly abstraction for [Functor].
///
/// For more details, please, refer to [Functor].
abstract class FunctorOps<F, A> {
  /// Returns a new [F] by applying [f] to this [Functor].
  ///
  /// Example:
  /// ```dart
  /// final someTen = Some(10);
  /// final doubled = someTen.map((x) => x * 2);
  ///
  /// assert(doubled == Some(20));
  /// ```
  F map<B>(B f(A a));

  /// Injects [b] to the left of the [A] value of this [Functor] as a tuple.
  ///
  /// Example:
  /// ```dart
  /// final someTen = Some(10);
  /// final strong = someTen.strengthL('B');
  ///
  /// print(strong == Some(Tuple2('B', 10)));
  /// ```
  F strengthL<B>(B b); // => map((a) => tuple2(b, a));

  /// Injects [b] to the right of the [A] value of this [Functor] as a tuple.
  ///
  /// Example:
  /// ```dart
  /// final someTen = Some(10);
  /// final strong = someTen.strengthR('B');
  ///
  /// print(strong == Some(Tuple2(10, 'B')));
  /// ```
  F strengthR<B>(B b); // => map((a) => tuple2(a, b));
}
