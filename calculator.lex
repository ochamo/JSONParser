package Example;

import java_cup.runtime.Symbol;

%%

%{
    private int braceCounter = 0;
%}



%cup
%state STR_STATE
%%

"," {
    return new Symbol(sym.COMMA);
}

[0-9]+ {
    return new Symbol(sym.INT_CONST);
}

[\"] {
    yybegin(STR_STATE);
}


<STR_STATE>[a-zA-Z0-9]+ {
        System.out.println("hola");
}

<STR_STATE>[\"] {
    yybegin(YYINITIAL);
    return new Symbol(sym.STR_CONST);
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


[\t\n] { /* ignorar espacios en blanco. */ }
. { System.err.println("Illegal character: "+yytext()); }

[\n\f\r\t\x0B] {}