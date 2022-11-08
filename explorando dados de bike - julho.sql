# Número total de viagens
SELECT COUNT(ride_id) AS total_viagens FROM bikes.bikes_julho


# Que tipo de bicicleta é mais usada?
SELECT DISTINCT(COUNT(rideable_type)) AS Number_of_rides, rideable_type FROM bikes.bikes_julho
GROUP BY rideable_type;

# Existem mais ciclistas casuais ou membros?
SELECT DISTINCT(COUNT(member_casual)) AS Number_of_members, member_casual FROM bikes.bikes_julho
GROUP BY member_casual;

# Média de minutos de viagem por tipo de cliente
SELECT member_casual, AVG(Duration) AS average_duration_ride FROM bikes.bikes_julho 
GROUP BY member_casual;

# Qual tipo de bibicleta foi usada por períodos mais longos? 
SELECT rideable_type, AVG(Duration) FROM bikes.bikes_julho
GROUP BY rideable_type;

# As 10 estações de início mais usadas no mês de julho
SELECT start_station_name, COUNT(start_station_name) AS number_of_use_begining FROM bikes.bikes_julho
WHERE start_station_name != ''
GROUP BY start_station_name
ORDER BY number_of_use_begining DESC LIMIT 10;

# E as 10 estações de fim mais usadas
SELECT end_station_name, COUNT(end_station_name) AS number_of_use FROM bikes.bikes_julho
WHERE end_station_name != ''
GROUP BY end_station_name
ORDER BY number_of_use DESC LIMIT 10;

# Quais dias da semana tem maior movimento?
WITH viagens(data, viagens_dia, dia_semana) AS
(
SELECT DATE(started_at) AS data, COUNT(started_at) AS viagens_dia, DAYNAME(started_at) AS dia_semana FROM bikes.bikes_julho
GROUP BY DAY(started_at)
ORDER BY started_at)
SELECT data, viagens_dia, dia_semana FROM viagens
ORDER BY viagens_dia DESC;

# Qual o número de viagens com menos de 15 minutos?
SELECT COUNT(duration) AS Viagens_menos_15min FROM bikes.bikes_julho
WHERE duration < '00:15:00'

# Viagens entre 15 e 30 minutos 
SELECT COUNT(duration) AS Viagens_menos_15min FROM bikes.bikes_julho
WHERE duration BETWEEN '00:15:00' AND '00:30:00'

# Viagens com mais de 30 minutos
SELECT COUNT(duration) AS Viagens_menos_15min FROM bikes.bikes_julho
WHERE duration > '00:30:00'