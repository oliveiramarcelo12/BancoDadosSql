<!DOCTYPE html>
<html>
<head>
    <title>Resultado das Promoções de Pizzas</title>
</head>
<body>
    <h2>Promoções Disponíveis</h2>
    <?php
    // Verificar se o sabor da pizza foi enviado
    if (isset($_GET['pizza_flavor'])) {
        $pizza_flavor = $_GET['pizza_flavor'];

        // Conectar ao banco de dados
        include 'functions.php'; // Inclua seu arquivo de funções aqui
        $pdo = pdo_connect_pgsql();

        // Consulta SQL para buscar as pizzas com o sabor selecionado e suas promoções
        $sql = "
            SELECT e.nome AS nome_entrega, p.nome AS nome_pizza, pr.nome_promocao, pr.descricao, pr.desconto 
            FROM entregas e
            JOIN pizzas p ON e.pizza = p.nome
            JOIN pizza_promocoes pp ON p.id_pizza = pp.id_pizza
            JOIN promocoes pr ON pp.id_promocao = pr.id_promocao
            WHERE p.nome = :pizza_flavor";

        // Preparar e executar a consulta SQL
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(':pizza_flavor' => $pizza_flavor));

        // Exibir os resultados da pesquisa
        if ($stmt->rowCount() > 0) {
            echo "<ul>";
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<li>Entrega: {$row['nome_entrega']}, Pizza: {$row['nome_pizza']}, Promoção: {$row['nome_promocao']}, Descrição: {$row['descricao']}, Desconto: {$row['desconto']}%</li>";
            }
            echo "</ul>";
        } else {
            echo "<p>Nenhuma promoção encontrada para o sabor de pizza selecionado.</p>";
        }
    } else {
        echo "<p>Por favor, selecione um sabor de pizza para pesquisar.</p>";
    }
    ?>
</body>
</html>
