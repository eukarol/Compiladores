#include <iostream>
#include "token.h"

// def da variável global para o número de linha
int line_number = 1;

extern int yylex();
extern int getLineNumber();
extern int isRunning();
extern std::map<std::string, std::string> symbol_table;

int main() {
    int token;
    while (isRunning() && (token = yylex())) {
        if (token == TK_ERROR) {
            std::cerr << "Erro léxico na linha " << getLineNumber() << std::endl;
        } else if (token < 256) {
            std::cout << "Token: '" << (char)token << "' na linha " << getLineNumber() << std::endl;
        } else {
            std::cout << "Token: " << token << " na linha " << getLineNumber() << std::endl;
        }
    }

    // exibir tabela de símbolos ao final
    std::cout << "\nTabela de Símbolos:" << std::endl;
    for (const auto& entry : symbol_table) {
        std::cout << entry.first << " -> " << entry.second << std::endl;
    }

    return 0;
}
