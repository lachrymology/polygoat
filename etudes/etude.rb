# "".mentions "".isa :something
# "" lead to ""
# "" cites ""

class Thing
  def initialize()
    @isa = :Thing
  end

  def isa(classification)
    @isa = classification
    return self
  end

  def to_s
    "#@isa"
  end
end

a(:Philosopher).isa(:Person)
a(:Musician).isa(:Person)
a(:Friend).isa(:Person)
a(:Musician).isa(:Person)
a(:Magazine).isa(:Media)
a(:Book).isa(:Media)

reading("Nodame Cantabile").at('2008.09.12').found("Edward Elgar").isa(:Musician)

reading("Einstein: His Life and Universe").at('2008.09.15').found("Ersnt Mach").isa(:Philosopher)
reading("Einstein: His Life and Universe").at('2008.09.15').found("Baruch Spinoza").isa(:Philosopher)

browsing("http://en.wikipedia.org/wiki/Ernst_Mach").at('2008.09.15').found("Vienna Cicle").isa(:Group)
browsing("http://en.wikipedia.org/wiki/Edward_elgar").at('2008.09.15').found("Enigma Variations").isa(:Group)

reading("Apparat Singles Collection v1").found("The Encyclopedia of Science Fiction")
reading("Apparat Singles Collection v1").found("Doc Savage")
reading("Apparat Singles Collection v1").found("J.G. Ballard").created("Crash")
reading("Apparat Singles Collection v1").found("Alfred Bester").created("The Stars My Destination")
reading("Apparat Singles Collection v1").found("Tom Waits").created("The Mule Variations")

aether.found("Michael Moorcock").isa(:Author)

$("Rob Friesel").isa(:Friend).recommends("House of Leaves")
$("http://www.houseofleaves.com").refers_to("House of Leaves")
$("Rob Friesel").recommends("Perdido Street Station")
$("Warren Ellis").created("Apparat Singles Collection v1")
$("Weird Tales").isa(:Magazine).recommends("The Brief History of the Dead")
$("Matt Bachtell").isa(:Friend).recommends("H.P. Lovecraft").isa(:Author)
$("RESTful Web Services").cites("Architectural Styles and the Design of Network-based Software Architectures").by("Roy Thomas Fielding")

$("RESTful Web Services").attach {"isbn" => "0596529260"}

$("Sword of Shannara").steals("Lord of the Rings")
$("Neil Stephenson").influences("Rob Friesel")
$("Symphony No. 1").by("Johannes Brahms").resembles("Symphony No. 9").by("Ludwig van Beethoven")
