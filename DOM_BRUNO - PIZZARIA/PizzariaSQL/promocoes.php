<?php
include 'functions.php';

?>
<!DOCTYPE html>
<html>
<head>
    <title>Buscar Promoções de Pizzas</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="/icones/icone1.svg" type="image/x-icon">
	<?=template_header('Pizzaria Dom Zeca')?>
</head>
<body>
    <h2>Buscar Promoções de Pizzas</h2>
    <form action="buscar_promocoes.php" method="GET">
        <label for="pizza_flavor">Selecione o sabor da pizza:</label>
        <select id="pizza_flavor" name="pizza_flavor">
            <option value="Calabresa">Calabresa</option>
            <option value="Margherita">Margherita</option>
            <option value="Pepperoni">Pepperoni</option>
            <option value="Frango com Catupiry">Frango com Catupiry</option>
            <option value="Quatro Queijos">Quatro Queijos</option>
            <option value="Portuguesa">Portuguesa</option>
            <option value="Bacon">Bacon</option>
            <option value="Vegetariana">Vegetariana</option>
            <!-- Adicione outras opções conforme necessário -->
        </select>
        <button type="submit">Pesquisar</button>
    </form>
</body>
</html>
