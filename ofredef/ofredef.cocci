//
// add missing of_node_put
//
// Copyright: 2012 - LIP6/INRIA
// Licensed under GPLv2 or any later version.
// URL: http://coccinelle.lip6.fr/
// URL: https://github.com/coccinelle
// Author: Julia Lawall <Julia.Lawall@lip6.fr>
//

@r@
expression e,e1,e2;
position p1,p2;
@@

e@p1 = \(of_find_node_by_type\|of_find_node_by_name\)(...)
... when != of_node_put(e)
    when != true e == NULL
    when != e2 = e
e@p2 = e1

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if p1[0].line != p2[0].line:
  cocci.print_main("",p1)
  cocci.print_secs("",p2)