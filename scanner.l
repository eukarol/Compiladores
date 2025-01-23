%{
#include <iostream>
#include <string>
#include <map>
#include "token.h"

// Variável global para o número da linha atual
extern int line_number;

// Tabela de símbolos (mapeia identificadores para seus tipos/valores)
std::map<std::string, std::string> symbol_table;

// Variável de controle de execução
int is_running = 1;

// Função para adicionar entradas à tabela de símbolos
void addToSymbolTable(const std::string& key, const std::string& value) {
    // Evita duplicação na tabela de símbolos
    if (symbol_table.find(key) == symbol_table.end()) {
        symbol_table[key] = value;
    }
}
%}

%%
// Palavras-chave
"char"       { return TK_CHAR; }
"int"        { return TK_INT; }
"if"         { return TK_IF; }
"then"       { return TK_THEN; }
"else"       { return TK_ELSE; }
"while"      { return TK_WHILE; }
"read"       { return TK_READ; }
"print"      { return TK_PRINT; }
"return"     { return TK_RETURN; }

// Operadores e símbolos
","|";"|":"|"("|")"|"["|"]"|"{"|"}"|"="|"+"|"-"|"*"|"/"|"%"|"<"|">"|"&"|"|"|"~" {
    return yytext[0];
}

// Identificadores
[a-zA-Z_][a-zA-Z0-9_]* {
    addToSymbolTable(yytext, "IDENTIFIER");
    return TK_IDENTIFIER;
}

// Literais inteiros
[0-9]+ {
    addToSymbolTable(yytext, "INTEGER_LITERAL");
    return TK_LITERAL_INT;
}

// Literais de caracteres
"'"([^'\n\\]|\\.)"'" {
    addToSymbolTable(yytext, "CHAR_LITERAL");
    return TK_LITERAL_CHAR;
}

// Literais de strings
\"([^\"\\\n]|\\.)*\" {
    addToSymbolTable(yytext, "STRING_LITERAL");
    return TK_LITERAL_STRING;
}

// Comentários de linha única
"//".* { /* Ignorado */ }

// Comentários de múltiplas linhas
"/\\*"([^*]|\\*+[^*/])*"\\*/" { /* Ignorado */ }

// Espaços em branco
[ \t\n]+ { /* Ignorado */ }

// Caracteres não reconhecidos (erro léxico)
. { 
    std::cerr << "Erro léxico: caractere inválido '" << yytext << "' na linha " << line_number << std::endl; 
    return TK_ERROR; 
}
%%

// Retorna o número da linha atual
int getLineNumber(void) {
    return line_number;
}

// Verifica se o analisador léxico deve continuar executando
int isRunning(void) {
    return is_running;
}
