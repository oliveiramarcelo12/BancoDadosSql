<?php
    include 'functions.php';
    
    // Verificar se foi feita uma pesquisa
    if(isset($_GET['search'])) {
        // Conectar ao banco de dados PostgreSQL
        $pdo = pdo_connect_pgsql();

        // Preparar a consulta SQL para buscar as pizzas com o nome selecionado
        $search = '%' . $_GET['search'] . '%';
        $stmt = $pdo->prepare('SELECT * FROM pizzas WHERE nome LIKE :search');
        $stmt->bindValue(':search', $search, PDO::PARAM_STR);
        $stmt->execute();

        // Obter os resultados da consulta
        $pizzas = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Verificar se foram encontrados resultados
        if(empty($pizzas)) {
            $error = 'Nenhuma pizza encontrada para o nome especificado.';
        }
    }
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pesquisar Pizzas</title>
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
        select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 300px;
            margin-bottom: 10px;
        }
        button[type="submit"], button[type="button"], a.button {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        button[type="submit"]:hover, button[type="button"]:hover, a.button:hover {
            background-color: #45a049;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

<h2>Pesquisar Pizzas</h2>

<div class="content read">
    <form class="" id="searchForm" action="" method="get">
        <label for="search">Selecione uma pizza:</label>
        <select id="search" name="search">
            <option value="">Selecione uma pizza...</option>
            <?php
                // Conectar ao banco de dados PostgreSQL
                $pdo = pdo_connect_pgsql();

                // Preparar a consulta SQL para obter os nomes das pizzas
                $stmt = $pdo->query('SELECT DISTINCT nome FROM pizzas');
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $selected = ($_GET['search'] ?? '') === $row['nome'] ? 'selected' : '';
                    echo '<option value="' . htmlspecialchars($row['nome'], ENT_QUOTES) . '" ' . $selected . '>' . htmlspecialchars($row['nome'], ENT_QUOTES) . '</option>';
                }
            ?>
        </select>
        <button class="create-contact" type="submit" id="searchButton">Pesquisar</button>
        <button type="button" id="clearButton">Limpar</button>
    </form>
</div>

<div class="content read">
    <?php if (isset($error)): ?>
        <p class="error"><?=htmlspecialchars($error, ENT_QUOTES)?></p>
    <?php elseif (isset($pizzas)): ?>
        <h3>Resultados da Pesquisa</h3>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Preço</th>
                    <th>Ingredientes</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($pizzas as $pizza): ?>
                    <tr>
                        <td><?=$pizza['id_pizza']?></td>
                        <td><?=$pizza['nome']?></td>
                        <td><?=$pizza['preco']?></td>
                        <td><?=$pizza['ingredientes']?></td>
                        <td>
                            <a href="editar_pizza.php?id=<?=$pizza['id_pizza']?>" class="button">Editar</a>
                            <a href="excluir_pizza.php?id=<?=$pizza['id_pizza']?>" class="button">Excluir</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>
</div>

<script>
    document.getElementById('clearButton').addEventListener('click', function() {
        document.getElementById('search').selectedIndex = 0;
    });
</script>

</body>
</html>
