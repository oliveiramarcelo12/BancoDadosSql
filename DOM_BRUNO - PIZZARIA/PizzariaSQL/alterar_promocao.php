<?php
include 'functions.php';

$pdo = pdo_connect_pgsql();

// Verificar se o ID da promoção foi passado via GET
if(isset($_GET['id'])) {
    // Capturar o ID da promoção
    $id_promocao = $_GET['id'];

    // Verificar se o formulário foi submetido
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Capturar os dados do formulário
        $nome_promocao = $_POST['nome_promocao'];
        $descricao = $_POST['descricao'];
        $desconto = $_POST['desconto'];
        $data_inicio = $_POST['data_inicio'];
        $data_fim = $_POST['data_fim'];

        // Atualizar a promoção no banco de dados
        $sql = "UPDATE promocoes SET nome_promocao = :nome_promocao, descricao = :descricao, desconto = :desconto, data_inicio = :data_inicio, data_fim = :data_fim WHERE id_promocao = :id_promocao";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':nome_promocao' => $nome_promocao, ':descricao' => $descricao, ':desconto' => $desconto, ':data_inicio' => $data_inicio, ':data_fim' => $data_fim, ':id_promocao' => $id_promocao]);

        // Redirecionar para a página de promoções após a atualização
        header('Location: promocoes.php');
        exit();
    } else {
        // Se o formulário não foi submetido, buscar os dados da promoção pelo ID
        $stmt = $pdo->prepare('SELECT * FROM promocoes WHERE id_promocao = :id_promocao');
        $stmt->bindValue(':id_promocao', $id_promocao, PDO::PARAM_INT);
        $stmt->execute();
        $promocao = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verificar se a promoção foi encontrada
        if(!$promocao) {
            // Se não encontrada, redirecionar para a página de promoções com mensagem de erro
            header('Location: promocoes.php?error=Promo%C3%A7%C3%A3o%20n%C3%A3o%20encontrada');
            exit();
        }
    }
} else {
    // Se o ID da promoção não foi passado, redirecionar para a página de promoções com mensagem de erro
    header('Location: promocoes.php?error=ID%20da%20promo%C3%A7%C3%A3o%20n%C3%A3o%20fornecido');
    exit();
}

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Alterar Promoção</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            margin-bottom: 10px;
        }

        button[type="submit"] {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
        }
    </style>
</head>

<body>
    <h2>Alterar Promoção</h2>
    <form action="alterar_promocao.php?id=<?= $promocao['id_promocao'] ?>" method="post">
        <label for="nome_promocao">Nome da Promoção:</label>
        <input type="text" name="nome_promocao" value="<?= htmlspecialchars($promocao['nome_promocao'], ENT_QUOTES) ?>" required>
        <label for="descricao">Descrição:</label>
        <textarea name="descricao" required><?= htmlspecialchars($promocao['descricao'], ENT_QUOTES) ?></textarea>
        <label for="desconto">Desconto (%):</label>
        <input type="number" name="desconto" value="<?= $promocao['desconto'] ?>" required>
        <label for="data_inicio">Data de Início:</label>
        <input type="date" name="data_inicio" value="<?= $promocao['data_inicio'] ?>" required>
        <label for="data_fim">Data de Término:</label>
        <input type="date" name="data_fim" value="<?= $promocao['data_fim'] ?>" required>
        <button type="submit">Salvar Alterações</button>
    </form>
</body>

</html>
