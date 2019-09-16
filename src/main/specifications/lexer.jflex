/*Seccion de codigo de usuario*/

package main.specifications;


//import java_cup.runtime.*;
import java.io.Reader;
import main.specifications.Symbol;
import main.specifications.sym;


%% //inicio de opciones

%class Lexer
%public
%unicode
//%cup
%line
%column
%caseless
%type Symbol


%{
    StringBuffer string = new StringBuffer("");
    private Symbol symbol(sym type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(sym type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

%}


LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment} | {WhiteSpace}
TraditionalComment = "/*" [^*]~"*/" | "/*" "*" + "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent = ( [^*] | \*+ [^/*] )*
character = "'" {InputCharacter} "'"
return = "return" {Comment}* "("




Identifier = [:jletter:] [:jletterdigit:]*


/*Integer*/
Integer = "-"?[0-9]+
//DecIntegerLiteral = 0 | 0*[1-9][0-9]*
Double = "-"?[0-9]+ "." [0-9]+


%state STRING, STRING_COMP, COMPONENTSTATE


%%
/* keywords */
      <YYINITIAL> "true" { return symbol(sym.TRUE);}
      <YYINITIAL> "false" { return symbol(sym.FALSE);}
      <YYINITIAL> "var" { return symbol(sym.VAR); }
      <YYINITIAL> "pow" { return symbol(sym.POW); }
      <YYINITIAL> "{" { return symbol(sym.OPEN_CURLY_BRACKET); }
      <YYINITIAL> "}" { return symbol(sym.CLOSE_CURLY_BRACKET); }
      <YYINITIAL> "(" { return symbol(sym.OPEN_PARENTHESES); }
      <YYINITIAL> ")" { return symbol(sym.CLOSE_PARENTHESES); }
      <YYINITIAL> "[" { return symbol(sym.OPEN_SQUARE_BRACKET); }
      <YYINITIAL> "]" { return symbol(sym.CLOSE_SQUARE_BRACKET); }
      <YYINITIAL> "<" { return symbol(sym.LESS_THAN); }
      <YYINITIAL> ">" { return symbol(sym.GREATER_THAN); }
      <YYINITIAL> "=" { return symbol(sym.ASSIGN); }
      <YYINITIAL> "+" { return symbol(sym.PLUS); }
      <YYINITIAL> "-" { return symbol(sym.MINUS); }
      <YYINITIAL> "*" { return symbol(sym.TIMES); }
      <YYINITIAL> "/" { return symbol(sym.DIV); }
      <YYINITIAL> "==" { return symbol(sym.EQUAL); }
      <YYINITIAL> "!=" { return symbol(sym.NOT_EQUAL); }
      <YYINITIAL> "<=" { return symbol(sym.LESS_THAN_OR_EQUAL); }
      <YYINITIAL> ">=" { return symbol(sym.GREATER_THAN_OR_EQUAL); }
      <YYINITIAL> "&&" { return symbol(sym.AND); }
      <YYINITIAL> "||" { return symbol(sym.OR); }
      <YYINITIAL> "^" { return symbol(sym.XOR); }
      <YYINITIAL> "!" { return symbol(sym.NOT); }
      <YYINITIAL> "import" { return symbol(sym.IMPORT); }
      <YYINITIAL> "from" { return symbol(sym.FROM); }
      <YYINITIAL> "si" { return symbol(sym.IF); }
      <YYINITIAL> "sino" { return symbol(sym.ELSE); }
      <YYINITIAL> "return" { return symbol(sym.RETURN); }
      <YYINITIAL> "repetir" { return symbol(sym.REPEAT); }
      <YYINITIAL> "imprimir" { return symbol(sym.PRINT); }
      <YYINITIAL> "mientras" { return symbol(sym.WHILE); }
      <YYINITIAL> ";" { return symbol(sym.SEMI); }
      <YYINITIAL> "," { return symbol(sym.COMA); }
      <YYINITIAL> "render" { return symbol(sym.RENDER); }
      <YYINITIAL> "component" { return symbol(sym.COMPONENT); }

      //UFEX
      /*
      <YYINITIAL> "panel" { return symbol(sym.PANEL); }
      <YYINITIAL> "text" { return symbol(sym.TEXT); }
      <YYINITIAL> "textfield" { return symbol(sym.TEXTFIELD); }
      <YYINITIAL> "button" { return symbol(sym.BUTTON); }
      <YYINITIAL> "list" { return symbol(sym.LIST); }
      <YYINITIAL> "elements" { return symbol(sym.ELEMENTS); }
      <YYINITIAL> "item" { return symbol(sym.ITEM); }
      <YYINITIAL> "default" { return symbol(sym.DEFAULT); }
      <YYINITIAL> "spinner" { return symbol(sym.SPINNER); }
      <YYINITIAL> "max" { return symbol(sym.MAX); }
      <YYINITIAL> "min" { return symbol(sym.MIN); }
      <YYINITIAL> "image" { return symbol(sym.IMAGE); }
      <YYINITIAL> "id" { return symbol(sym.ID); }
      <YYINITIAL> "x" { return symbol(sym.X); }
      <YYINITIAL> "y" { return symbol(sym.Y); }
      <YYINITIAL> "height" { return symbol(sym.HEIGHT); }
      <YYINITIAL> "width" { return symbol(sym.WIDTH); }
      <YYINITIAL> "color" { return symbol(sym.COLOR); }
      <YYINITIAL> "border" { return symbol(sym.BORDER); }
      <YYINITIAL> "classname" { return symbol(sym.CLASS_NAME); }
*/



<YYINITIAL> {
{return} {string.setLength(0); yybegin(COMPONENTSTATE);}



/* identifiers */
{Identifier} { return symbol(sym.IDENTIFIER); }
/* literals */
{Integer}  { return symbol(sym.INTEGER);}
{Double}  {return symbol(sym.DOUBLE);}



\" { string.setLength(0); yybegin(STRING); }

/* comments */
{Comment} { /* ignore */ }
/* whitespace */
{WhiteSpace} { /* ignore */ }
}


<COMPONENTSTATE>{
      "panel" { return symbol(sym.PANEL); }
      "text" { return symbol(sym.TEXT); }
      "textfield" { return symbol(sym.TEXTFIELD); }
      "button" { return symbol(sym.BUTTON); }
      "list" { return symbol(sym.LIST); }
      "elements" { return symbol(sym.ELEMENTS); }
      "item" { return symbol(sym.ITEM); }
      "default" { return symbol(sym.DEFAULT); }
      "spinner" { return symbol(sym.SPINNER); }
      "max" { return symbol(sym.MAX); }
      "min" { return symbol(sym.MIN); }
      "image" { return symbol(sym.IMAGE); }
      "id" { return symbol(sym.ID); }
      "x" { return symbol(sym.X); }
      "y" { return symbol(sym.Y); }
      "height" { return symbol(sym.HEIGHT); }
      "width" { return symbol(sym.WIDTH); }
      "color" { return symbol(sym.COLOR); }
      "border" { return symbol(sym.BORDER); }
      "classname" { return symbol(sym.CLASS_NAME); }
      "{" { return symbol(sym.OPEN_CURLY_BRACKET); }
      "}" { return symbol(sym.CLOSE_CURLY_BRACKET); }
      "[" { return symbol(sym.OPEN_SQUARE_BRACKET); }
      "]" { return symbol(sym.CLOSE_SQUARE_BRACKET); }
      "<" { return symbol(sym.LESS_THAN); }
      ">" { return symbol(sym.GREATER_THAN); }
      "/" { return symbol(sym.SLASH); }
      "=" { return symbol(sym.ASSIGN); }
      {Identifier} { return symbol(sym.IDENTIFIER); }
      {Integer} {return symbol(sym.INTEGER);}
      \" { string.setLength(0); yybegin(STRING_COMP); }
      ")" { yybegin(YYINITIAL); return symbol(sym.CLOSE_PARENTHESES, string.toString());}
      /* comments */
      {Comment} { /* ignore */ }
      /* whitespace */
      {WhiteSpace} { /* ignore */ }




}



<STRING_COMP>{
\" { yybegin(COMPONENTSTATE);
return symbol(sym.STRING_LITERAL,
string.toString()); }
[^\n\r\"\\]+ { string.append( yytext() ); }
\\t { string.append('\t'); }
\\n { string.append('\n'); }
\\r { string.append('\r'); }
\\\" { string.append('\"'); }
\\ { string.append('\\'); }
}


<STRING> {
\" { yybegin(YYINITIAL);
return symbol(sym.STRING_LITERAL,
string.toString()); }
[^\n\r\"\\]+ { string.append( yytext() ); }
\\t { string.append('\t'); }
\\n { string.append('\n'); }
\\r { string.append('\r'); }
\\\" { string.append('\"'); }
\\ { string.append('\\'); }
}
/* error fallback */
[^] {
          return symbol(sym.ERROR, yytext().toString());
      }

          //throw new Error("Illegal character <"+
//(int)yytext().toString().charAt(0) + " VALUE: " + yytext()  + "Lenght: " + yytext().toString().length() +">"  ); }







/*
Insensitive case
<CHARACTER> Comillas
<STRING> Doble comilla
Entero
Doble
Booleano
{
}
(
)
[
]
<
>
= //Igual
+  //SUma
-
*
==
!=
<=
>=
&&
|| //or
^   //xor
! //not
import
from
si
sino
return
repetir
imprimir
mientras
SEMI



Render
Component


//UFEX
Panel
text
textfield
button
list
elements
item
default
spinner
max
min
image



// < enter state component

id
X
y
height
width
color
border
ClassName









 */









