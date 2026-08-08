/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_facturas_clientesxhandler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_facturas_clientesxhandler`(
    IN p_id_cliente INT
)
BEGIN

    DECLARE cant_facturas INT;
    DECLARE EXIT HANDLER FOR NOT FOUND
    BEGIN
    SELECT 'No se encontraron registros' AS mensaje;
    END;
    SELECT COUNT(*) INTO cant_facturas
    FROM factura WHERE id_Cliente = p_id_cliente;
    IF cant_facturas = 0 THEN
        SELECT 'El cliente no tiene facturas registradas o no existe' 
        AS mensaje;
    ELSE
        SELECT cliente.nombre, cliente.apellido,
		COUNT(factura.id) AS cantidad_facturas FROM cliente
        INNER JOIN factura ON factura.id_Cliente = cliente.id
        WHERE cliente.id = p_id_cliente GROUP BY cliente.id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_productos_categoriasxhandler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_productos_categoriasxhandler`(
in nombre_producto varchar(50), in nombre_categoria varchar(50))
BEGIN
DECLARE cantidad INT;
DECLARE EXIT HANDLER FOR NOT FOUND
BEGIN
    SELECT 'No existen productos para esa categoría' AS mensaje;
END;
 SELECT COUNT(*) INTO cantidad FROM categoria_producto 
categoria_producto INNER 
 JOIN producto producto ON categoria_producto.id_Producto = 
producto.id INNER 
 JOIN categoria categoria ON categoria_producto.id_Categoria = 
categoria.id WHERE 
 producto.nombre = nombre_producto AND categoria.nombre = 
nombre_categoria;
 IF cantidad = 0 THEN
 SELECT 'No se encontró relación entre producto y categoría' AS 
mensaje;
 ELSE
 SELECT producto.nombre AS producto, categoria.nombre AS categoria 
FROM categoria_producto categoria_producto 
 INNER JOIN producto producto ON categoria_producto.id_Producto = 
producto.id
 INNER JOIN categoria categoria ON categoria_producto.id_Categoria = 
categoria.id
 WHERE producto.nombre = nombre_producto AND categoria.nombre 
= nombre_categoria;
 END IF;
END ;;
DELIMITER ;


/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-24 21:07:34
