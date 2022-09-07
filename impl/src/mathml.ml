let mn lit = Xml.Element("mn", [], [Xml.PCData lit])

let mi id = Xml.Element("mi", [], [Xml.PCData id])

let mo str = Xml.Element("mo", [], [str])

let msub a k = Xml.Element("msub", [], [a; k])

let msup a k = Xml.Element("msup", [], [a; k])

let msubsup a k l =
  Xml.Element("msubsup", [], [a; k; l])

let mrow elems = Xml.Element("mrow", [], elems)
