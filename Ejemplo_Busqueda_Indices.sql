
-- Busqueda por indices
-- Heap
select periodo from gastoMillon where periodo in (10,7,3)					-- Busqueda Heap

-- �ndice Clustered
select * from gastoMillon where idgasto in (999,800,8087)					-- Busqueda sin indice Clustered

-- �ndice Non-Clustered
select periodo from gastoMillon where periodo in (10,7,3)					-- Busqueda sin indice Non-Clustered 

-- �ndice Unique
select * from gastoMillon where idgasto in (10,7,3)							-- Busqueda sin indice Unique

-- �ndice con columnas incluidas 
select fechapago, idtipogasto from gastoMillon where periodo in (10,7,3)	-- Busqueda sin �ndice con columnas incluidas 

-- �ndice Filtrado
select * from gastoMillon where importe = 79395.75							-- Busqueda sin �ndice Filtrado 