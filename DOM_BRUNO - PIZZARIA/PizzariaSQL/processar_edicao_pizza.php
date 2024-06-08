<?php
include 'functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Verificar se todos os campos foram enviados
    if (isset($_POST['id_pizza'], $_POST['nome'], $_POST['preco'], $_POST['ingredientes'])) {
        // Conectar ao banco de dados PostgreSQL
        $pdo = pdo_connect_pgsql();

        // Preparar a consulta SQL para atualizar a pizza
        $stmt = $pdo->prepare('UPDATE pizzas SET nome = :nome, preco = :preco, ingredientes = :ingredientes WHERE id_pizza = :id_pizza');
        $stmt->bindValue(':id_pizza', $_POST['id_pizza'], PDO::PARAM_INT);
        $stmt->bindValue(':nome', $_POST['nome'], PDO::PARAM_STR);
        $stmt->bindValue(':preco', $_POST['preco'], PDO::PARAM_STR);
        $stmt->bindValue(':ingredientes', $_POST['ingredientes'], PDO::PARAM_STR);

        // Executar a consulta
        if ($stmt->execute()) {
            // Redirecionar de volta para a página de listagem de pizzas
            header('Location: listar_pizzas.php');
            exit();
        } else {
            // Se houver um erro ao executar a consulta, exibir uma mensagem de erro
            $error = 'Erro ao atualizar a pizza. Por favor, tente novamente.';
        }
    } else {
        // Se algum dos campos estiver faltando, exibir uma mensagem de erro
        $error = 'Todos os campos são obrigatórios.';
    }
} else {
    // Se a solicitação não for do tipo POST, redirecionar de volta para a página de listagem de pizzas
    header('Location: listar_pizzas.php');
    exit();
}

// Se houver um erro, exibir a mensagem de erro
if (isset($error)) {
    echo '<p>' . htmlspecialchars($error, ENT_QUOTES) . '</p>';
}
?>
