package main.specifications;
import main.specifications.sym;

public class Symbol {
    private sym type;
    private int line;
    private int column;
    private Object value;

    public Symbol(sym type, int line, int column){
        this.type = type;
        this.line = line;
        this.column = column;
        this.value = null;
    }

    public Symbol(sym type, int line, int column, Object value){
        this.type = type;
        this.line = line;
        this.column = column;
        this.value = value;
    }


    public sym getType() {
        return type;
    }

    public int getLine() {
        return line;
    }

    public int getColumn() {
        return column;
    }

    public Object getValue() {
        return value;
    }
}
