LOCK TABLES `alerta_stock` WRITE;
/*!40000 ALTER TABLE `alerta_stock` DISABLE KEYS */;
INSERT INTO `alerta_stock` VALUES (1,'Coca-Cola 2.25L',0,'2026-06-09 10:10:51');
/*!40000 ALTER TABLE `alerta_stock` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `auditoria_producto` WRITE;
/*!40000 ALTER TABLE `auditoria_producto` DISABLE KEYS */;
INSERT INTO `auditoria_producto` VALUES (1,53,'Inserción',NULL,'Pepas',NULL,10,'2026-06-09 00:55:11','root@localhost'),(2,NULL,'Actualización','Pepas','Pepas',10,8,'2026-06-09 00:58:55','root@localhost'),(3,53,'Eliminación','Pepas',NULL,8,NULL,'2026-06-09 01:07:06','root@localhost');
/*!40000 ALTER TABLE `auditoria_producto` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bebidas','Productos líquidos y refrescantes'),(2,'Cervezas','Bebidas derivados del alcohol'),(3,'Alimentos','Productos comestibles'),(4,'Cigarrillos','Artículos derivados del tabaco, incluyendo cigarrillos de diversas marcas y presentaciones'),(5,'Limpieza','Productos de aseo y desinfección'),(6,'Lácteos','Productos derivados de la leche'),(7,'Fiambres','Productos derivados de carnes procesadas, embutidos y carnes frías');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (1,1),(2,2),(3,5),(4,6),(5,6),(6,4),(7,4),(8,3),(9,3),(10,3),(11,3),(12,1),(13,3),(14,3),(18,3),(52,3);
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'María','Aguer','maguer453@gmail.com','m12345678'),(2,'Lucas','Salvarrey','lucas@yahoo.com','l12345678'),(3,'Agustina','Castelar','acastelar880@gmail.com','a12345678'),(4,'Matias','Perez','mperez421@gmail.com','m12345678'),(5,'Oriana','Zapata','oriana.zapata@hotmail.com','o12345678'),(6,'Carlos','Wilson','cwilson555@gmail.com','w12345678'),(7,'Rocio','Velázquez','rocio@yahoo.com','r12345678');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (8,1,5,500),(12,2,5,600),(8,2,1,500),(12,3,2,600),(11,3,1,700),(9,3,1,300),(12,4,3,600),(11,5,4,700),(13,5,1,350),(4,6,1,2600),(11,6,1,700),(11,6,1,700),(9,6,1,300),(14,6,2,20),(12,7,4,600),(8,7,1,500);
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2025-10-01',2500,1,2),(2,'2025-10-02',3500,2,3),(3,'2025-10-03',2200,3,1),(4,'2025-10-04',1800,4,5),(5,'2025-10-05',3150,5,6),(6,'2025-10-06',4340,6,7),(7,'2025-10-07',2900,7,4),(8,'2025-10-10',25000,6,5),(9,'2025-10-10',25000,3,4),(10,'2025-10-11',2100,4,4),(11,'2025-10-11',2100,4,4),(12,'2026-01-11',4800,5,2),(13,'2026-01-11',5800,6,7),(14,'2026-01-12',600,1,3),(15,'2026-01-13',1600,3,2);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `factura_forma_pago` WRITE;
/*!40000 ALTER TABLE `factura_forma_pago` DISABLE KEYS */;
INSERT INTO `factura_forma_pago` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7);
/*!40000 ALTER TABLE `factura_forma_pago` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Efectivo','Pagado'),(2,'Transferencia','Pagado'),(3,'Efectivo','Pendiente'),(4,'Transferencia','Pagado'),(5,'Efectivo','Pendiente'),(6,'Efectivo','Pagado'),(7,'Efectivo','Pagado');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Coca-Cola 2.25L','Bebida gaseosa Coca-Cola 2.25 litros',0,4000),(2,'Heineken Lata 473ml','Cerveza Heineken en lata de 473 ml',15,2000),(3,'Magistral Grande','Detergente Magistral 750 ml',15,3000),(4,'Manteca Tonadita 200g','Manteca Tonadita presentación 200g',15,2600),(5,'Queso Cremoso Tregar','Queso cremoso por kilo',12,5800),(6,'Marlboro Ks','Cigarrillos Marlboro paquete 20 unidades',15,5100),(7,'Red Point Ks','Cigarrillos Red Point paquete 20 unidades',25,2000),(8,'Caramelos Billiken','Caramelos surtidos',40,500),(9,'Chupetín Pico Dulce','Chupetín clásico',30,300),(10,'Alfajor Jorgito','Alfajor dulce de leche',15,400),(11,'Galletitas Express','Galletitas dulces económicas',20,700),(12,'Agua Manaos 500ml','Botella de agua 500ml',50,600),(13,'Chicles Beldent','Chicles sabor menta',30,350),(14,'Caramelo suelto','Caramelo individual',50,20),(17,'null','null',10,4500),(18,'nulo','nulo',20,4500),(52,'Pepas','Galletas con membrillo',10,6000);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Mario','Rodriguez','mrodriguez219@gmail.com',11223344,'Coca Cola'),(2,'Martín','Ramirez','mramirez409@gmail.com',44332211,'Unilever Argentina'),(3,'Santiago','Suarez','ssuarez331@gmail.com',11447787,'Arcor'),(4,'Tobías','Martinez','tobias.martinez@hotmail.com',1134397,'Tregar'),(5,'Alex','Ritondo','aritondo874@gmail.com',11432566,'Massalin Particulares S.A.'),(6,'Leandro','Gomez','leandro.gomez@hotmail.com',11543607,'Quilmes'),(7,'Jairo','Guido','jairo@yahoo.com',11594422,'Tregar');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `proveedor_producto` WRITE;
/*!40000 ALTER TABLE `proveedor_producto` DISABLE KEYS */;
INSERT INTO `proveedor_producto` VALUES (1,1),(6,2),(2,3),(4,4),(4,5),(3,6),(5,7),(3,8),(3,9),(3,10),(3,11),(1,12),(3,13),(3,14),(6,18),(3,52);
/*!40000 ALTER TABLE `proveedor_producto` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Alberto','Suarez','administrador','alberto.suarez@hotmail.com','as12345678'),(2,'Soledad','Paredes','empleado','soledad@yahoo.com','sp12345678'),(3,'Adolfo','Ruiz','empleado','aruiz301@gmail.com','ar12345678'),(4,'Gabriela','González','empleado','gabriela.gonzalez@hotmail.com','gg12345678'),(5,'Martina','Herrera','empleado','mherrera007@gmail.com','mh12345678'),(6,'Xavier','Verrey','empleado','xavier_verrey@hotmail.com','xv12345678'),(7,'Germán','Padilla','empleado','gpadilla775@gmail.com','gp12345678');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
