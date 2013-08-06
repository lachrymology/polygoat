case class B[F,T](c: B[F, T] => (F => T)) extends (B[F, T] => (F => T)) {
    def apply(b: B[F, T]) = c(b);
}

def Y[F, T] = (f: (F => T) => F => T) =>
  B[F, T](x => f(x(x)(_)))(B(x => f(x(x)(_))))

val factorial = Y[Int, Int](f => i => if (i <= 0) 1 else f(i - 1) * i)

trait JavaSeqExpansion [T] {
  def iterator:java.util.Iterator[T]

  def foreach(fn: T => Unit) = {
    val it = iterator
    
    while (it.hasNext) {
      fn(it.next)
    }
  }
}

/* Curried */
def buildr(p1:String)(p2:String)(p3:String)(p4:String)(p5:String)(p6:String) = {
  println(p1)
  println(p2)
  println(p3)
  println(p4)
  println(p5)
  println(p6)
}

var l = "6.0.0" :: "TENA" :: "mw" :: "tenamw" :: "6.0.0" :: "f9-gcc40" :: Nil

buildr(l(0))(l(1))(l(2))(l(3))(l(4))(l(5))

/* Partial function */
def consr(p1:String,p2:String,p3:String,p4:String,p5:String,p6:String) = {
  println(p1)
  println(p2)
  println(p3)
  println(p4)
  println(p5)
  println(p6)
}

var p = consr(_:String, _:String, _:String,_:String,_:String,_:String)
p("1", "2", "3", "4", "5", "6")

var p = consr("test", "me", _:String,_:String,_:String,null)
p("1", "2", "3")

/* Partial constructor */
var part = new java.util.ArrayList[String](_:Int)
val l = part(10)


/* Applying a list as args to a function */


trait Foo {
  def go[T](x:String):T
}

class FooImplRpc extends IFoo with Foo {
  def go[String](x:String):String = {
    fn = 
  }
}

object Dispatch extends Foo {
  def go[Function1[String]](x:String) = 
}

object Registry {
  val fooer = new Fooer()
}

public interface IFoo
{
  public String go( String x);
}

public class Fooer implements IFoo 
{
  public String go( String x) {
    return "Baz";
  }
}

package fogus {
  object PWD {
    val pwd = new java.io.File(".")

    def /(s:String) = {
      pwd.getCanonicalPath + s
    }
  }
}

