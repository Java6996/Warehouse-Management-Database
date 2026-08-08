/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_factura`(
    IN fra_fecha_emision DATE,
    IN fra_monto_total DECIMAL(10,2),
    IN fra_id_cte INT,
    IN fra_id_usuario INT
)
BEGIN
    DECLARE existe_cliente INT;
    DECLARE existe_usuario INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error al insertar la factura. Operación cancelada.' AS mensaje;
    END;
    START TRANSACTION;
    SELECT COUNT(*)
    INTO existe_cliente
    FROM cliente
    WHERE id = fra_id_cte;
    SELECT COUNT(*)
    INTO existe_usuario
    FROM usuario
    WHERE id = fra_id_usuario;
    IF existe_cliente = 0 THEN
        ROLLBACK;
        SELECT 'Error: el cliente no existe.' AS mensaje;
    ELSEIF existe_usuario = 0 THEN
        ROLLBACK;
        SELECT 'Error: el usuario no existe.' AS mensaje;
    ELSE
        INSERT INTO factura
        (fecha_emision, monto_total, id_Cliente, id_Usuario)
        VALUES
        (fra_fecha_emision, fra_monto_total, fra_id_cte, fra_id_usuario);
        COMMIT;
        SELECT 'Factura insertada correctamente.' AS mensaje;
    END IF;
END ;;
DELIMITER ;


/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_producto_completo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_producto_completo`(
    IN p_nombre VARCHAR(100),
    IN p_descripcion LONGTEXT,
    IN p_stock INT,
    IN p_precio DOUBLE,
    IN p_id_categoria INT,
    IN p_id_proveedor INT
)
BEGIN
    DECLARE v_id_producto INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    START TRANSACTION;
    IF NOT EXISTS (SELECT 1 FROM categoria WHERE id = p_id_categoria) 
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La categoría no existe';
    END IF;
    IF NOT EXISTS (
        SELECT 1 FROM proveedor WHERE id = p_id_proveedor) 
        THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El proveedor no existe';
    END IF;
    INSERT INTO producto
    (nombre,descripcion,stock,precio)
    VALUES
    (p_nombre,p_descripcion, p_stock,p_precio);
    SET v_id_producto = LAST_INSERT_ID();
    INSERT INTO categoria_producto
    (id_Categoria,id_Producto)
    VALUES
    (p_id_categoria, v_id_producto);
    INSERT INTO proveedor_producto
    (id_Proveedor,id_Producto)
    VALUES
    (p_id_proveedor,v_id_producto);
    COMMIT;
    SELECT 'Producto registrado correctamente' AS mensaje;
END ;;
DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_stock`(
    IN producto_id_producto INT,
    IN producto_cantidad INT
)
BEGIN
    DECLARE stock_actual INT;
    DECLARE EXIT HANDLER FOR NOT FOUND
    BEGIN
        SELECT 'Producto inexistente' AS mensaje;
    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error al actualizar stock' AS mensaje;
    END;
    START TRANSACTION;
    SELECT stock
    INTO stock_actual
    FROM producto
    WHERE id = producto_id_producto;
    IF stock_actual < producto_cantidad THEN
        ROLLBACK;
        SELECT 'Stock insuficiente' AS mensaje;
    ELSE
        UPDATE producto
        SET stock = stock - producto_cantidad
        WHERE id = producto_id_producto;
        COMMIT;
        SELECT 'Stock actualizado correctamente' AS mensaje;
    END IF;
END ;;
DELIMITER ;
