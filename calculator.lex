package Example;

import java_cup.runtime.Symbol;
%%
%cup
%%
";" { return new Symbol(sym.SEMI); }
"+" { return new Symbol(sym.PLUS); }
[\t] { /* ignorar espacios en blanco. */ }
. { System.err.println("Illegal character: "+yytext()); }