package Example;

import java_cup.runtime.Symbol;

%%

%{
    private int braceCounter = 0;
%}


%class JsonLexer
%cup
%state STRING_STATE
%%

"," {
    return new Symbol(sym.COMMA);
}

[\{] {
    return new Symbol(sym.LBRACE);
}

[\}] {
    return new Symbol(sym.RBRACE);
}

":" {
    return new Symbol(sym.COLON);
}

[true] {
    return new Symbol(sym.BOOL_CONST);
}

[false] {
    return new Symbol(sym.BOOL_CONST);
}

"[" {
    return new Symbol(sym.LBRACKET);
}

"]" {
    return new Symbol(sym.RBRACKET);
}


[\t] { /* ignorar espacios en blanco. */ }
. { System.err.println("Illegal character: "+yytext()); }

[\n\f\r\t\x0B] {}