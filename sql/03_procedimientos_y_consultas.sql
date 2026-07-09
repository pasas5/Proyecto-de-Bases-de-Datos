USE tienda_electronicos;

-- Consultas
-- Listar productos disponibles por categoría, ordenados por precio
SELECT c.nombre AS categoria, p.nombre AS producto, p.precio, p.stock
FROM Productos p
JOIN Categorias c ON p.id_categoria = c.id_categoria
WHERE p.stock > 0
ORDER BY c.nombre ASC, p.precio ASC;

-- Mostrar clientes con pedidos pendientes y total de compras histórico
SELECT c.nombre, c.correo, 
       SUM(CASE WHEN p.estado = 'pendiente' THEN 1 ELSE 0 END) AS pedidos_pendientes,
       SUM(dp.cantidad * dp.precio_unitario) AS total_gastado
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
JOIN Detalles_Pedido dp ON p.id_pedido = dp.id_pedido
GROUP BY c.id_cliente
HAVING pedidos_pendientes > 0;

-- Reporte de los 5 productos con mejor calificación promedio
SELECT p.nombre, ROUND(AVG(r.calificacion), 2) AS promedio_calificacion, COUNT(r.id_resena) AS total_resenas
FROM Productos p
JOIN Resenas r ON p.id_producto = r.id_producto
GROUP BY p.id_producto
ORDER BY promedio_calificacion DESC, total_resenas DESC
LIMIT 5;

-- PROCEDURES

DELIMITER //

-- Registrar un nuevo pedido 
CREATE PROCEDURE sp_registrar_pedido(IN p_id_cliente INT, OUT p_id_pedido INT)
BEGIN
    DECLARE v_pendientes INT;
    
    SELECT COUNT(*) INTO v_pendientes 
    FROM Pedidos 
    WHERE id_cliente = p_id_cliente AND estado = 'pendiente';
    
    IF v_pendientes >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El cliente ya alcanzó el límite de 5 pedidos pendientes.';
    ELSE
        INSERT INTO Pedidos (id_cliente, fecha_pedido, estado) 
        VALUES (p_id_cliente, CURDATE(), 'pendiente');
        SET p_id_pedido = LAST_INSERT_ID();
    END IF;
END //

-- Registrar una reseña (verifica que el cliente haya comprado el producto)
CREATE PROCEDURE sp_registrar_resena(IN p_id_producto INT, IN p_id_cliente INT, IN p_calificacion INT, IN p_comentario TEXT)
BEGIN
    DECLARE v_comprado INT;
    
    SELECT COUNT(*) INTO v_comprado
    FROM Pedidos p
    JOIN Detalles_Pedido dp ON p.id_pedido = dp.id_pedido
    WHERE p.id_cliente = p_id_cliente AND dp.id_producto = p_id_producto;

    IF v_comprado = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Solo los clientes que han comprado el producto pueden dejar una reseña.';
    ELSE
        INSERT INTO Resenas (id_producto, id_cliente, calificacion, comentario, fecha)
        VALUES (p_id_producto, p_id_cliente, p_calificacion, p_comentario, CURDATE());
    END IF;
END //

-- Actualizar el stock de un producto después de un pedido
CREATE PROCEDURE sp_actualizar_stock(IN p_id_producto INT, IN p_cantidad INT)
BEGIN
    UPDATE Productos 
    SET stock = stock - p_cantidad 
    WHERE id_producto = p_id_producto;
END //

-- Cambiar el estado de un pedido
CREATE PROCEDURE sp_cambiar_estado_pedido(IN p_id_pedido INT, IN p_nuevo_estado VARCHAR(20))
BEGIN
    UPDATE Pedidos 
    SET estado = p_nuevo_estado 
    WHERE id_pedido = p_id_pedido;
END //

-- Eliminar reseña y mostrar el nuevo promedio de calificaciones
CREATE PROCEDURE sp_eliminar_resena(IN p_id_resena INT)
BEGIN
    DECLARE v_id_producto INT;
    
    -- Guardamos el ID del producto antes de borrar la reseña para poder recalcular
    SELECT id_producto INTO v_id_producto FROM Resenas WHERE id_resena = p_id_resena;
    
    DELETE FROM Resenas WHERE id_resena = p_id_resena;
    
    -- Devolvemos el nuevo promedio actualizado
    SELECT p.nombre AS producto, ROUND(AVG(r.calificacion), 2) AS nuevo_promedio
    FROM Productos p
    LEFT JOIN Resenas r ON p.id_producto = r.id_producto
    WHERE p.id_producto = v_id_producto
    GROUP BY p.id_producto;
END //

-- Agregar un nuevo producto verificando que no exista un duplicado
CREATE PROCEDURE sp_agregar_producto(IN p_nombre VARCHAR(100), IN p_descripcion TEXT, IN p_precio DECIMAL(10,2), IN p_stock INT, IN p_id_categoria INT)
BEGIN
    DECLARE v_existe INT;
    
    SELECT COUNT(*) INTO v_existe 
    FROM Productos 
    WHERE nombre = p_nombre AND id_categoria = p_id_categoria;
    
    IF v_existe > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Ya existe un producto con el mismo nombre en esta categoría.';
    ELSE
        INSERT INTO Productos (nombre, descripcion, precio, stock, id_categoria) 
        VALUES (p_nombre, p_descripcion, p_precio, p_stock, p_id_categoria);
    END IF;
END //

-- Actualizar la información de un cliente 
CREATE PROCEDURE sp_actualizar_cliente(IN p_id_cliente INT, IN p_telefono VARCHAR(20), IN p_direccion VARCHAR(255))
BEGIN
    UPDATE Clientes 
    SET telefono = p_telefono, direccion = p_direccion 
    WHERE id_cliente = p_id_cliente;
END //

-- Generar reporte de productos con stock bajo (menos de 5 unidades)
CREATE PROCEDURE sp_reporte_stock_bajo()
BEGIN
    SELECT id_producto, nombre AS producto, stock 
    FROM Productos 
    WHERE stock < 5
    ORDER BY stock ASC;
END //

DELIMITER ;