# Blueprint do Projeto Eco Coleta (Baseado no Protótipo 2)

## 1. Visão Geral

Este documento descreve o projeto "Eco Coleta", um aplicativo Flutter baseado em um protótipo visual. O objetivo é criar uma plataforma para agendamento de coletas seletivas, onde os usuários acumulam pontos e cashback que podem ser trocados por recompensas. Este blueprint detalha cada tela e funcionalidade, servindo como o guia mestre para o desenvolvimento.

---

## 2. Arquitetura e Estrutura

*   **Navegação:** Será implementada utilizando o pacote `go_router` para gerenciar as rotas de forma declarativa e robusta, suportando a complexidade das telas do aplicativo.
*   **Gerenciamento de Estado:** O `provider` será usado para gerenciar o estado do tema e poderá ser estendido para outros estados globais, como informações do usuário autenticado.
*   **Design System:** O tema seguirá estritamente o protótipo, com a cor primária verde, tipografia com `GoogleFonts` (`Oswald`, `Roboto`, `Open Sans`), e componentes estilizados (botões, cards, campos de texto).

---

## 3. Detalhamento das Telas e Funcionalidades

### Frame 1: Login (`/login`)
*   **UI:**
    *   Logo "ECO COLETA" com ícone de reciclagem.
    *   Campos de texto para "Email" e "Senha".
    *   Botão "Entrar".
    *   Links de texto para "Esqueceu a senha?" e "Não tem conta? Cadastrar".
*   **Funcionalidade:**
    *   Autenticar o usuário (inicialmente simulado).
    *   Ao clicar em "Cadastrar", navegar para a tela de cadastro (`/cadastro`).
    *   Após o login, navegar para a tela principal (`/home`).

### Frame 2: Tela de Cadastro (`/cadastro`)
*   **UI:**
    *   Título "TELA DE CADASTRO".
    *   Seletor de foto de perfil.
    *   Campos de texto para "Nome", "E-mail", "Endereço" e "Complemento".
    *   Botão "Cadastrar".
*   **Funcionalidade:**
    *   Coletar informações do novo usuário.
    *   Após o cadastro, navegar para a tela principal (`/home`).

### Frame 3: Agendamento (`/agendamento`)
*   **UI:**
    *   Título "AGENDAMENTOS".
    *   Campos para "DATA" e "HORA".
    *   Widget de calendário para seleção da data.
    *   Widget de relógio (ou similar) para seleção da hora.
    *   Botão para confirmar o agendamento.
*   **Funcionalidade:**
    *   Permitir que o usuário escolha uma data e hora para a coleta.

### Frame 4: Tela Principal (Dashboard com Histórico) (`/home`)
*   **UI:**
    *   **AppBar Customizado:** Ícone de menu (hambúrguer) à esquerda e logo "ECO COLETA" no centro.
    *   **Card de Saldo:** Exibe a foto do perfil, nome do usuário ("José"), "Saldo Cashback" (e.g., R$ 50,00) e "Saldo de Pontos" (e.g., 50).
    *   **Seção de Histórico:** Lista de coletas anteriores com data, tipo de material e valor/pontos correspondentes.
    *   **Menu Lateral (Drawer):** Acessado pelo ícone de menu. Contém links para:
        *   Perfil
        *   Agendamento
        *   Histórico
        *   Trocas
        *   Configurações
        *   Sair
*   **Funcionalidade:**
    *   Servir como a tela central do aplicativo.
    *   Navegar para as outras seções através do menu.

### Frame 5, 6, 7: Trocas e Recompensas (`/trocas`)
*   **UI:**
    *   **Tela de Recompensas:** Exibe o saldo de pontos e uma lista de "Recompensas Disponíveis" (e.g., "10% Desconto no mercado parceiro", "Passe de ônibus grátis"). Cada recompensa mostra o custo em pontos.
    *   **Tela de Confirmação:** Ao selecionar uma recompensa, mostra os detalhes e pergunta "Deseja trocar X pontos por este item?". Contém os botões "Confirmar" e "Cancelar".
    *   **Tela de Sucesso:** Mensagem "Troca confirmada" com um ícone de sucesso.
*   **Funcionalidade:**
    *   Permitir que o usuário gaste seus pontos em recompensas.
    *   Atualizar o saldo de pontos após a troca.

### Frame 8: Perfil do Usuário (`/perfil`)
*   **UI:**
    *   Título "Perfil do Usuário".
    *   Exibe a foto e o nome do usuário.
    *   **Card de Informações:** Mostra endereço, telefone e e-mail. Botão "Editar Perfil".
    *   **Card de Informações de Coleta:** Próximas coletas agendadas com opção de "Agendar" ou "Cancelar".
    *   **Card de Histórico de Coletas:** Resumo do histórico com link para "Ver Histórico".
    *   **Card de Resumo:** Total de "Resíduos Reciclados" (e.g., 350KG) e "Pontos" totais.
*   **Funcionalidade:**
    *   Visualizar e editar as informações do perfil.
    *   Gerenciar agendamentos de coleta.

### Frame 9: Notificação
*   **UI:**
    *   Um pop-up ou mensagem informativa.
    *   Exemplo: "Lembrete: você tem uma coleta agendada para amanhã às 09:00".
*   **Funcionalidade:**
    *   Implementar como notificações push ou alertas no aplicativo para lembrar os usuários sobre eventos importantes.

---

## 4. Plano de Desenvolvimento Atual

O desenvolvimento seguirá esta ordem, implementando tela por tela, começando pela estrutura de navegação.

1.  **Configurar `go_router`:** Definir as rotas para todas as telas listadas acima.
2.  **Finalizar Login e Cadastro:** Implementar a navegação entre a tela de login e cadastro.
3.  **Desenvolver a `HomeScreen`:** Criar a estrutura da tela principal com o menu lateral (Drawer).
4.  **Implementar as telas restantes:** Desenvolver iterativamente as telas de Perfil, Agendamento e Trocas.
