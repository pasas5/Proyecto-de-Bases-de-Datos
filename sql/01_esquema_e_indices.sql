-- Crear la base de datos y usarla
CREATE DATABASE IF NOT EXISTS tienda_electronicos;
USE tienda_electronicos;

-- Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE, 
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

--  Tabla Categorías
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

--  Tabla Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL CHECK (precio >= 0), 
    stock INT NOT NULL CHECK (stock >= 0), 
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria) ON DELETE SET NULL
);

--  Tabla Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    estado ENUM('pendiente', 'enviado', 'entregado') DEFAULT 'pendiente',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE
);

--  Tabla Detalles_Pedido
CREATE TABLE Detalles_Pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10, 2) NOT NULL CHECK (precio_unitario >= 0),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE
);

--  Tabla Reseñas
CREATE TABLE Resenas (
    id_resena INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    id_cliente INT NOT NULL,
    calificacion INT NOT NULL CHECK (calificacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE
);

-- Optimiza la búsqueda de productos cuando se filtra por categoría
CREATE INDEX idx_productos_categoria ON Productos(id_categoria);

-- Optimiza las consultas para ver el historial de pedidos de un cliente específico
CREATE INDEX idx_pedidos_cliente ON Pedidos(id_cliente);

-- Acelera las búsquedas de productos por nombre
CREATE INDEX idx_productos_nombre ON Productos(nombre);