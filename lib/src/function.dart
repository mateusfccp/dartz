// ignore_for_file: unnecessary_new

part of dartz;

/// A function with no parameters that returns A.
typedef A Function0 <A>                                                            ();

/// A function with one parameter A that returns B.
typedef B Function1 <A, B>                                                         (A a);

/// A function with two parameters A and B that returns C.
typedef C Function2 <A, B, C>                                                      (A a, B b);

/// A function with three parameters A to C that returns D.
typedef D Function3 <A, B, C, D>                                                   (A a, B b, C c);

/// A function with four parameters A to D that returns E.
typedef E Function4 <A, B, C, D, E>                                                (A a, B b, C c, D d);

/// A function with five parameters A to E that returns F.
typedef F Function5 <A, B, C, D, E, F>                                             (A a, B b, C c, D d, E e);

/// A function with six parameters A to F that returns G.
typedef G Function6 <A, B, C, D, E, F, G>                                          (A a, B b, C c, D d, E e, F f);

/// A function with seven parameters A to G that returns H.
typedef H Function7 <A, B, C, D, E, F, G, H>                                       (A a, B b, C c, D d, E e, F f, G g);

/// A function with eight parameters A to H that returns I.
typedef I Function8 <A, B, C, D, E, F, G, H, I>                                    (A a, B b, C c, D d, E e, F f, G g, H h);

/// A function with nine parameters A to I that returns J.
typedef J Function9 <A, B, C, D, E, F, G, H, I, J>                                 (A a, B b, C c, D d, E e, F f, G g, H h, I i);

/// A function with ten parameters A to J that returns K.
typedef K Function10<A, B, C, D, E, F, G, H, I, J, K>                              (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j);

/// A function with eleven parameters A to K that returns L.
typedef L Function11<A, B, C, D, E, F, G, H, I, J, K, L>                           (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k);

/// A function with twelve parameters A to L that returns M.
typedef M Function12<A, B, C, D, E, F, G, H, I, J, K, L, M>                        (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l);

/// A function with thirteen parameters A to M that returns N.
typedef N Function13<A, B, C, D, E, F, G, H, I, J, K, L, M, N>                     (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m);

/// A function with fourteen parameters A to N that returns O.
typedef O Function14<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>                  (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n);

/// A function with fifteen parameters A to O that returns P.
typedef P Function15<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>               (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o);

/// A function with sixteen parameters A to P that returns Q.
typedef Q Function16<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>            (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p);

/// A function with seventeen parameters A to Q that returns R.
typedef R Function17<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>         (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p, Q q);

/// A function with eighteen parameters A to R that returns S.
typedef S Function18<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>      (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p, Q q, R r);

/// A function with nineteen parameters A to S that returns T.
typedef T Function19<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>   (A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p, Q q, R r, S s);

/// A function with twenty parameters A to T that returns U.
typedef U Function20<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U>(A a, B b, C c, D d, E e, F f, G g, H h, I i, J j, K k, L l, M m, N n, O o, P p, Q q, R r, S s, T t);

/// Curries a function with two parameters.
Function1<A, Function1<B, C>> curry2<A, B, C>(Function2<A, B, C> fun) => (a) => (b) => fun(a, b);

/// Curries a function with three parameters.
Function1<A, Function1<B, Function1<C, D>>> curry3<A, B, C, D>(Function3<A, B, C, D> fun) => (a) => (b) => (c) => fun(a, b, c);

/// Curries a function with four parameters.
Function1<A, Function1<B, Function1<C, Function1<D, E>>>> curry4<A, B, C, D, E>(Function4<A, B, C, D, E> fun) => (a) => (b) => (c) => (d) => fun(a, b, c, d);

/// Curries a function with five parameters.
Function1<A, Function1<B, Function1<C, Function1<D, Function1<E, F>>>>> curry5<A, B, C, D, E, F>(Function5<A, B, C, D, E, F> fun) => (a) => (b) => (c) => (d) => (e) => fun(a, b, c, d, e);

/// Curries a function with six parameters.
Function1<A, Function1<B, Function1<C, Function1<D, Function1<E, Function1<F, G>>>>>> curry6<A, B, C, D, E, F, G>(Function6<A, B, C, D, E, F, G> fun) => (a) => (b) => (c) => (d) => (e) => (f) => fun(a, b, c, d, e, f);

/// Uncurries two functions into a function with two parameters.
Function2<A, B, C> uncurry2<A, B, C>(Function1<A, Function1<B, C>> fun) => (a, b) => fun(a)(b);

/// Uncurries three functions into a function with three parameters.
Function3<A, B, C, D> uncurry3<A, B, C, D>(Function1<A, Function1<B, Function1<C, D>>> fun) => (a, b, c) => fun(a)(b)(c);

/// Uncurries four functions into a function with four parameters.
Function4<A, B, C, D, E> uncurry4<A, B, C, D, E>(Function1<A, Function1<B, Function1<C, Function1<D, E>>>> fun) => (a, b, c, d) => fun(a)(b)(c)(d);

/// Uncurries five functions into a function with five parameters.
Function5<A, B, C, D, E, F> uncurry5<A, B, C, D, E, F>(Function1<A, Function1<B, Function1<C, Function1<D, Function1<E, F>>>>> fun) => (a, b, c, d, e) => fun(a)(b)(c)(d)(e);

/// Uncurries six functions into a function with six parameters.
Function6<A, B, C, D, E, F, G> uncurry6<A, B, C, D, E, F, G>(Function1<A, Function1<B, Function1<C, Function1<D, Function1<E, Function1<F, G>>>>>> fun) => (a, b, c, d, e, f) => fun(a)(b)(c)(d)(e)(f);

/// Turns a function that receives two parameters A and B into a function that receives one [Tuple2<A, B>].
Function1<Tuple2<A, B>, C> tuplize2<A, B, C>(Function2<A, B, C> fun) => (Tuple2<A, B> t2) => fun(t2.value1, t2.value2);

/// Turns a function that receives three parameters A to C into a function that receives one [Tuple3<A, B, C>].
Function1<Tuple3<A, B, C>, D> tuplize3<A, B, C, D>(Function3<A, B, C, D> fun) => (Tuple3<A, B, C> t3) => fun(t3.value1, t3.value2, t3.value3);

/// Turns a function that receives four parameters A to D into a function that receives one [Tuple4<A, B, C, D>].
Function1<Tuple4<A, B, C, D>, E> tuplize4<A, B, C, D, E>(Function4<A, B, C, D, E> fun) => (Tuple4<A, B, C, D> t4) => fun(t4.value1, t4.value2, t4.value3, t4.value4);

/// Invert the parameters order of a function with two parameters.
///
/// Example:
///
/// ```dart
/// Function2<String, String, String> concat = (a, b) => a + b;
/// Function2<String, String, String> rev = flip(concat);
///
/// assert(concat("Hello, ", "world!") == rev("world!", "Hello, "));
/// ```
Function2<B, A, C> flip<A, B, C>(Function2<A, B, C> f) => (b, a) => f(a, b);

/// Compose two functions with one parameter into one.
///
/// The return type of [g] must be the input parameter of [f].
///
/// Example:
///
/// ```dart
/// Function1<int, int> next = (a) => a + 1;
/// Function1<int, double> halve = (a) => a / 2;
/// Function1<int, double> halveNext = composeF(halve, next);
///
/// assert(halveNext(9) == 5);
/// ```
Function1<A, C> composeF<A, B, C>(Function1<B, C> f, Function1<A, B> g) => (a) => f(g(a));

/// Makes a constant function.
///
/// A constant function is a function that will receive any input of type [A],
/// and will return [b] disregarding its input parameter.
///
/// For example, if you want to map all elements of an [IList] to a specific
/// value, you can do:
///
/// ```dart
/// // Generate a list of integers from 0 to 4
/// final list = IList.generate(5, id);
///
/// // Maps all elements of [list] to `0`
/// list.map(constF(0));
/// ```
Function1<A, B> constF<A, B>(B b) => (A a) => b;

class Function0TraversableMonad extends Traversable<Function0> with Applicative<Function0>, Monad<Function0>, TraversableMonad<Function0> {
  @override Function0 pure<A>(A a) => () => a;
  @override Function0 bind<A, B>(covariant Function0<A> fa, covariant Function1<A, Function0<B>> f) => () => f(fa())();
  @override B foldMap<A, B>(Monoid<B> bMonoid, covariant Function0<A> fa, B f(A a)) => f(fa());
}

final Function0TraversableMonad Function0TrM = new Function0TraversableMonad();
TraversableMonad<Function0<A>> function0TrM<A>() => cast(Function0TrM);
