USE tienda_electronicos;

--  INSERTAR CATEGORIAS
INSERT INTO Categorias (nombre, descripcion) VALUES 
('Componentes PC', 'Tarjetas madre, procesadores, tarjetas gráficas y fuentes de poder.'),
('Periféricos', 'Teclados, ratones, mouse pads y controles.'),
('Monitores', 'Monitores de oficina y monitores gaming de alta tasa de refresco.'),
('Audio', 'Audífonos inalámbricos, bocinas y barras de sonido.'),
('Almacenamiento', 'Discos duros, SSDs NVMe y gabinetes externos.');

-- INSERTAR CLIENTES
INSERT INTO Clientes (nombre, correo, telefono, direccion) VALUES 
('Carlos Mendoza', 'carlos.m@email.com', '555-0101', 'Av. Reforma 123, CDMX'),
('Ana Sofía López', 'ana.lopez@email.com', '555-0102', 'Calle Roma 45, Monterrey'),
('Luis Hernández', 'luis.h@email.com', '555-0103', 'Col. Centro 88, Guadalajara'),
('María Fernanda Ruiz', 'mafer.ruiz@email.com', '555-0104', 'Av. Juárez 10, Puebla'),
('Jorge Salinas', 'jorge.s@email.com', '555-0105', 'Plaza Mayor 22, Toluca'),
('Daniela Torres', 'dany.t@email.com', '555-0106', 'Calle 11 Sur, Querétaro'),
('Roberto Gómez', 'roberto.g@email.com', '555-0107', 'Av. Hidalgo 33, León'),
('Patricia Vega', 'paty.vega@email.com', '555-0108', 'Col. del Valle 90, CDMX'),
('Miguel Ángel Castro', 'miguel.c@email.com', '555-0109', 'Paseo de la Reforma 2, Mérida'),
('Lucía Navarro', 'lucia.n@email.com', '555-0110', 'Calle Mina 14, Tijuana'),
('Fernando Silva', 'fer.silva@email.com', '555-0111', 'Av. Universidad 55, CDMX'),
('Gabriela Ortiz', 'gaby.o@email.com', '555-0112', 'Col. Condesa 76, CDMX'),
('Hugo Morales', 'hugo.m@email.com', '555-0113', 'Calle 5 de Mayo 12, Veracruz'),
('Andrea Domínguez', 'andrea.d@email.com', '555-0114', 'Av. de las Rosas 8, Cancún'),
('Ricardo Peña', 'ricardo.p@email.com', '555-0115', 'Col. Nápoles 11, CDMX');

-- INSERTAR PRODUCTOS (30 registros)
INSERT INTO Productos (nombre, descripcion, precio, stock, id_categoria) VALUES 
('Tarjeta Madre Asus ROG', 'Tarjeta madre ATX para procesadores de última generación.', 4500.00, 15, 1),
('Tarjeta Gráfica AMD Radeon RX 7800 XT', 'Gráfica de alto rendimiento para gaming a 1440p.', 12500.00, 8, 1),
('Mouse Gaming Logitech G502', 'Mouse ergonómico con sensor óptico de alta precisión.', 1200.00, 40, 2),
('Audífonos Inalámbricos Xiaomi', 'Audífonos Bluetooth con cancelación de ruido activa.', 850.00, 50, 4),
('Monitor Gaming 144Hz 27"', 'Monitor IPS con alta tasa de refresco y 1ms de respuesta.', 5200.00, 20, 3),
('Gabinete Externo Orico para SSD', 'Carcasa de aluminio para discos NVMe M.2.', 450.00, 35, 5),
('Mouse Pad RGB Extendido', 'Alfombrilla para mouse y teclado con iluminación LED.', 350.00, 100, 2),
('Procesador Ryzen 7 5800X', 'Procesador de 8 núcleos y 16 hilos.', 4800.00, 25, 1),
('SSD NVMe 1TB Gen 4', 'Unidad de estado sólido de alta velocidad de lectura/escritura.', 1800.00, 60, 5),
('Teclado Mecánico RGB', 'Teclado con switches rojos y retroiluminación.', 1500.00, 30, 2),
('Control Gamepad Inalámbrico', 'Mando compatible con PC y consolas.', 900.00, 22, 2),
('Fuente de Poder 750W 80+ Gold', 'Fuente de alimentación modular para PC de escritorio.', 2100.00, 18, 1),
('Memoria RAM 32GB (2x16) DDR5', 'Kit de memoria de alto rendimiento a 6000MHz.', 2600.00, 40, 1),
('Monitor de Oficina 24" FHD', 'Monitor estándar para productividad y ofimática.', 2200.00, 15, 3),
('Micrófono de Condensador USB', 'Micrófono ideal para streaming y grabación de voz.', 1300.00, 25, 4),
('Cámara Web 1080p', 'Cámara para videoconferencias con enfoque automático.', 800.00, 30, 2),
('Bocinas Bluetooth de Escritorio', 'Sistema de sonido estéreo compacto.', 950.00, 20, 4),
('Disco Duro Externo 2TB', 'Unidad de almacenamiento portátil USB 3.0.', 1400.00, 45, 5),
('Soporte de Monitor Doble', 'Brazo articulado para montaje en escritorio.', 750.00, 12, 2),
('Enfriamiento Líquido 240mm', 'Sistema de refrigeración AIO para procesadores.', 2300.00, 15, 1),
('Tarjeta de Red Wi-Fi 6', 'Adaptador PCIe para conexiones inalámbricas de alta velocidad.', 650.00, 28, 1),
('Pasta Térmica de Alto Rendimiento', 'Jeringa de 4g para mantenimiento de procesadores.', 200.00, 100, 1),
('Gabinete ATX de Cristal Templado', 'Torre para PC con excelente flujo de aire.', 1900.00, 10, 1),
('Audífonos de Estudio Cerrados', 'Auriculares de monitoreo profesional.', 3100.00, 8, 4),
('SSD SATA 500GB', 'Unidad de estado sólido estándar de 2.5 pulgadas.', 700.00, 55, 5),
('Cable HDMI 2.1 de 2 metros', 'Cable de video para resoluciones 4K y 8K.', 250.00, 80, 2),
('Hub USB-C de 7 puertos', 'Adaptador multipuertos con HDMI y lector de tarjetas.', 600.00, 40, 2),
('Monitor Ultrawide 34"', 'Pantalla ultra ancha para máxima productividad y gaming.', 8900.00, 5, 3),
('Barra de Sonido con Subwoofer', 'Sistema de audio para televisores y PC.', 3500.00, 10, 4),
('Kit de Desarmadores de Precisión', 'Herramientas para ensamblaje y reparación de electrónicos.', 300.00, 60, 2);

-- INSERTAR PEDIDOS (20 registros)
INSERT INTO Pedidos (id_cliente, fecha_pedido, estado) VALUES 
(1, '2026-06-01', 'entregado'),
(2, '2026-06-05', 'entregado'),
(3, '2026-06-10', 'entregado'),
(4, '2026-06-12', 'enviado'),
(5, '2026-06-15', 'pendiente'),
(6, '2026-06-18', 'entregado'),
(7, '2026-06-20', 'pendiente'),
(8, '2026-06-22', 'entregado'),
(9, '2026-06-25', 'enviado'),
(10, '2026-06-26', 'pendiente'),
(1, '2026-06-27', 'enviado'),
(11, '2026-06-28', 'pendiente'),
(12, '2026-06-29', 'entregado'),
(13, '2026-07-01', 'pendiente'),
(14, '2026-07-02', 'pendiente'),
(15, '2026-07-03', 'enviado'),
(2, '2026-07-04', 'pendiente'),
(3, '2026-07-05', 'pendiente'),
(4, '2026-07-06', 'pendiente'),
(5, '2026-07-07', 'pendiente');

-- INSERTAR DETALLES DE PEDIDO (25 registros)
-- (id_pedido, id_producto, cantidad, precio_unitario)
INSERT INTO Detalles_Pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES 
(1, 5, 1, 5200.00), -- Pedido 1: 1 Monitor Gaming
(1, 26, 1, 250.00), -- Pedido 1: 1 Cable HDMI
(2, 2, 1, 12500.00),-- Pedido 2: 1 Tarjeta Gráfica
(3, 4, 2, 850.00),  -- Pedido 3: 2 Audífonos Xiaomi
(4, 3, 1, 1200.00), -- Pedido 4: 1 Mouse Logitech
(4, 7, 1, 350.00),  -- Pedido 4: 1 Mouse Pad RGB
(5, 1, 1, 4500.00), -- Pedido 5: 1 Tarjeta Madre Asus
(5, 8, 1, 4800.00), -- Pedido 5: 1 Procesador Ryzen
(6, 6, 2, 450.00),  -- Pedido 6: 2 Gabinetes Orico
(7, 10, 1, 1500.00),-- Pedido 7: 1 Teclado Mecánico
(8, 11, 2, 900.00), -- Pedido 8: 2 Controles Gamepad
(9, 13, 1, 2600.00),-- Pedido 9: 1 RAM 32GB
(10, 9, 1, 1800.00),-- Pedido 10: 1 SSD NVMe 1TB
(11, 28, 1, 8900.00),-- Pedido 11: 1 Monitor Ultrawide
(12, 15, 1, 1300.00),-- Pedido 12: 1 Micrófono USB
(13, 24, 1, 3100.00),-- Pedido 13: 1 Audífonos de Estudio
(14, 22, 3, 200.00), -- Pedido 14: 3 Pastas Térmicas
(15, 14, 1, 2200.00),-- Pedido 15: 1 Monitor Oficina
(16, 29, 1, 3500.00),-- Pedido 16: 1 Barra de Sonido
(17, 30, 1, 300.00), -- Pedido 17: 1 Kit Desarmadores
(18, 12, 1, 2100.00),-- Pedido 18: 1 Fuente de Poder
(18, 23, 1, 1900.00),-- Pedido 18: 1 Gabinete ATX
(19, 17, 1, 950.00), -- Pedido 19: 1 Bocinas Bluetooth
(20, 16, 1, 800.00), -- Pedido 20: 1 Cámara Web
(20, 27, 1, 600.00); -- Pedido 20: 1 Hub USB-C

-- INSERTAR RESEÑAS (10 registros)
-- (id_producto, id_cliente, calificacion, comentario, fecha)
INSERT INTO Resenas (id_producto, id_cliente, calificacion, comentario, fecha) VALUES 
(5, 1, 5, 'Excelente monitor, los 144Hz se notan muchísimo en los juegos.', '2026-06-15'),
(2, 2, 5, 'Rendimiento brutal para 1440p, las temperaturas son muy buenas.', '2026-06-20'),
(4, 3, 4, 'Suenan muy bien, pero la batería dura un poco menos de lo esperado.', '2026-06-18'),
(3, 4, 5, 'El mejor mouse que he tenido, súper cómodo y preciso.', '2026-06-25'),
(6, 6, 5, 'Materiales de buena calidad, el aluminio disipa bien el calor.', '2026-06-28'),
(11, 8, 4, 'Buen control, responde rápido aunque los gatillos se sienten algo rígidos.', '2026-07-02'),
(24, 12, 5, 'Sonido plano ideal para monitoreo, aíslan el ruido externo perfectamente.', '2026-07-05'),
(26, 1, 5, 'Cumple su función, soporta 4K sin problemas de señal.', '2026-06-16'),
(7, 4, 3, 'Las luces RGB están bien, pero el material se ensucia muy rápido.', '2026-06-26'),
(15, 12, 4, 'Buena calidad de grabación de voz, aunque capta un poco el ruido de fondo.', '2026-07-06');