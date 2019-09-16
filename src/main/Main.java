package main;

//import main.specifications.Lexer;
import main.specifications.Lexer;
import main.specifications.Symbol;

import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Main {

    public static void main(String[] args) {
	// write your code here
        //GenerarArchivos();
        runAnalysis();
    }


    public static void runAnalysis(){
        Reader reader = null;

            try {
                reader = new BufferedReader(new FileReader("C:\\Users\\benav\\Documents\\University\\Compi\\USAC\\USAC\\src\\s1\\s1.ufe"));
                Lexer lexer = new Lexer(reader);
                String result = "";

                while (true) {
                    Symbol symbol = lexer.yylex();
                    if (symbol==null){
                       result +="END\n";
                       break;
                    }
                    System.out.println("Type: " + symbol.getType() + "; line: " + symbol.getLine() + "; column: " + symbol.getColumn() + "; Value:" + (symbol.getValue() == null? "": symbol.getValue().toString()));

                }
            } catch (IOException e) {
                e.printStackTrace();
            }

    }/**/



    public static void GenerarArchivos(){
        System.out.println("\n*** Generando ***\n");
        String archLex = "";
        archLex = "src/main/specifications/lexer.jflex";

        String[] entrada = {archLex};
        jflex.Main.main(entrada);

    }



}
