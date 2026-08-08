/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_generar_alertas_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_alertas_stock`()
BEGIN
    DECLARE ciclo_fin INT DEFAULT 0;
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_stock INT;
    DECLARE cur_productos CURSOR FOR
        SELECT nombre, stock FROM producto
        WHERE stock < 5;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET ciclo_fin = 1;
    OPEN cur_productos;
    ciclo: LOOP FETCH cur_productos INTO v_nombre, v_stock;
        IF ciclo_fin = 1 THEN LEAVE ciclo;
        END IF;
        INSERT INTO alerta_stock
        (producto,stock_actual,fecha_alerta)
        VALUES
        (v_nombre, v_stock,NOW());
    END LOOP;
    CLOSE cur_productos;
END ;;
DELIMITER ;