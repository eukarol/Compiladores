# Analisador Léxico em C++ com Flex

Este projeto é um analisador léxico desenvolvido em **C++** utilizando a ferramenta **Flex**. Ele analisa um arquivo de entrada contendo código-fonte e identifica tokens como palavras-chave, identificadores, literais, operadores e símbolos. O analisador também constrói uma tabela de símbolos para armazenar identificadores e seus valores.

## Funcionalidades

- Reconhecimento de palavras-chave (ex.: `int`, `if`, `while`, etc.).
- Identificação de identificadores válidos.
- Suporte para literais inteiros, caracteres e strings.
- Reconhecimento de operadores e símbolos específicos.
- Ignora comentários de linha única (`//`) e múltiplas linhas (`/* ... */`).
- Construção de uma tabela de símbolos para identificadores.
- Detecção e tratamento de erros léxicos.

---

## Requisitos

Antes de começar, certifique-se de ter o seguinte instalado:

- **Flex**: Ferramenta para gerar analisadores léxicos.
- **G++**: Compilador para C++.

---

## Como Usar

1. **Clone o repositório**:
   ```bash
   git clone <url-do-repositório>
   cd <pasta-do-projeto>
   ```

2. **Compile o arquivo `.l` com o Flex**:
   ```bash
   flex scanner.l
   ```

   Isso gerará o arquivo `lex.yy.c`.

3. **Compile o projeto com G++**:
   ```bash
   g++ lex.yy.c main.cpp -o analisador
   ```

4. **Execute o analisador**:
   ```bash
   ./analisador < arquivo_de_entrada.txt
   ```

   Substitua `arquivo_de_entrada.txt` pelo arquivo que contém o código a ser analisado.

---

## Estrutura do Projeto

- **scanner.h**: Arquivo do Flex contendo as definições de tokens e regras de análise léxica.
- **main.cpp**: Arquivo principal para executar o analisador.
- **tokens.h**: Arquivo de cabeçalho com as definições de tokens.
- **README.md**: Documentação do projeto.
- **entrada_de_exemplo.txt**: Exemplo de arquivo de entrada para testes.

---

## Exemplos

### Arquivo de Entrada (entrada_de_exemplo.txt):
```c
int main() {
    char c = 'A';
    int x = 42;
    // Este é um comentário
    print("Hello, World!");
}
```

### Saída Esperada:
```plaintext
Token: TK_INT (Palavra-chave)
Token: TK_IDENTIFIER (Identificador: main)
Token: '(' (Símbolo)
Token: ')' (Símbolo)
Token: '{' (Símbolo)
Token: TK_CHAR (Palavra-chave)
Token: TK_IDENTIFIER (Identificador: c)
Token: '=' (Símbolo)
Token: TK_LITERAL_CHAR (Literal de caractere: 'A')
Token: ';' (Símbolo)
Token: TK_INT (Palavra-chave)
Token: TK_IDENTIFIER (Identificador: x)
Token: '=' (Símbolo)
Token: TK_LITERAL_INT (Literal inteiro: 42)
Token: ';' (Símbolo)
Token: TK_PRINT (Palavra-chave)
Token: '(' (Símbolo)
Token: TK_LITERAL_STRING (Literal de string: "Hello, World!")
Token: ')' (Símbolo)
Token: ';' (Símbolo)
Token: '}' (Símbolo)
```

---

## Detalhes Técnicos

### Palavras-chave Suportadas
- `char`
- `int`
- `if`
- `then`
- `else`
- `while`
- `read`
- `print`
- `return`

### Tipos de Literais Reconhecidos
- Inteiros: Números como `1234`.
- Caracteres: Ex.: `'A'`, `'\n'`.
- Strings: Ex.: `"Texto de exemplo"`.

### Erros Léxicos
Quando um caractere não reconhecido é encontrado, o analisador emite uma mensagem de erro no seguinte formato:
```plaintext
Erro léxico: caractere inválido '<caractere>' na linha <número_da_linha>
```

