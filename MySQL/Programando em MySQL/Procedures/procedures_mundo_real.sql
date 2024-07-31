/* Recap */

/*Modelo MVC - Retirar a Regra de Negócio da controler
e passar para o Banco de Dados*/

/*

Colocar regras de negócios no banco de dados é um tema bastante discutido e pode ter vantagens e desvantagens significativas. Vou 
detalhar melhor os pontos que você mencionou e adicionar algumas considerações adicionais.

Pontos Fortes

Desafogar a Controller:

    Explicação: Em um modelo MVC (Model-View-Controller), a controller é responsável por orquestrar a lógica do aplicativo, interagindo com a view (interface de usuário) e o model (dados). Quando a lógica de negócios é movida para o banco de dados, a controller tem menos trabalho a fazer, simplificando seu código.
    Vantagem: Isso torna a manutenção da controller mais fácil e menos propensa a erros, pois ela se torna mais leve e focada em coordenação e menos em lógica complexa.

Elevar o Processamento para o Banco:

    Explicação: Bancos de dados modernos são altamente otimizados para operações complexas e podem executar transações e cálculos de forma muito eficiente.
    Vantagem: Utilizar a capacidade do banco de dados pode resultar em melhor performance para operações que envolvem grandes conjuntos de dados, pois evita a transferência de grandes volumes de dados para a aplicação.

Segurança:

    Explicação: Utilizar procedures para operações como SELECT pode proteger contra injeção de SQL, uma técnica maliciosa onde um atacante insere ou manipula consultas SQL através de entradas do usuário.
    Vantagem: Procedures e funções armazenadas no banco de dados podem ser parametrizadas, evitando que entradas maliciosas afetem diretamente as consultas SQL.

Manutenção de Regras de Negócio Consistentes:

    Explicação: Centralizar regras de negócios no banco de dados garante que todas as aplicações que utilizam aquele banco estejam seguindo as mesmas regras.
    Vantagem: Isso pode reduzir inconsistências e bugs que podem surgir quando as regras de negócios são duplicadas ou implementadas de forma ligeiramente diferente em múltiplas aplicações.


Pontos Fracos

Dificuldade de Migração:

    Explicação: Cada sistema de banco de dados (Oracle, MySQL, SQL Server, etc.) tem suas próprias extensões e sintaxes específicas para stored procedures.
    Desvantagem: Migrar de um banco de dados para outro pode se tornar um processo complexo e demorado, pois as procedures precisam ser reescritas para se adaptar ao novo sistema.

Dependência de Linguagem Específica do Banco:

    Explicação: As stored procedures são escritas na linguagem específica do banco de dados (PL/SQL para Oracle, T-SQL para SQL Server, etc.).
    Desvantagem: Isso significa que os desenvolvedores precisam ter conhecimento específico dessas linguagens, o que pode aumentar a complexidade de desenvolvimento e manutenção.

Processamento no Servidor de Aplicação:

    Explicação: Se a lógica de negócios é mantida no banco de dados, o servidor de aplicação precisa apenas chamar essas procedures, o que pode ser eficiente.
    Desvantagem: Contudo, se o servidor de aplicação tiver um processamento alto, adicionar lógica de negócios no banco de dados pode não aliviar significativamente a carga total, pois o banco também pode se tornar um gargalo.

Teste e Depuração:

    Explicação: Testar e depurar código dentro do banco de dados pode ser mais difícil comparado a fazer isso na aplicação.
    Desvantagem: Ferramentas de depuração para stored procedures podem ser limitadas e menos intuitivas do que aquelas disponíveis para a linguagem de programação da aplicação.


A decisão de onde colocar a lógica de negócios (no banco de dados ou na aplicação) depende do contexto específico do projeto, incluindo
considerações de performance, manutenção, e arquitetura do sistema.


Quando entro em uma página e pesquiso algo, narmalmente é realizado
uma consulta no banco de dados.
Injeção de SQL, pode derrubar o Banco
*/
