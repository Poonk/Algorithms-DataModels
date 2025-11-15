/*

*/
SELECT * FROM Car;
-- SELECT DISTINCT Model FROM Car ORDER BY Model;

-- Q1: How does the Gas vehicle percentage in the market compared to year 2000 to after year 2000?
SELECT
    CASE 
        WHEN Prod_year <= 2000 THEN 'Before 2000'
        ELSE 'After 2000'
    END AS Period,
    ROUND(
        (SUM(
            CASE 
                WHEN Fuel_type IN ('Petrol', 'Diesel') THEN 1 
                ELSE 0 
            END
        ) * 100.0) / 
        COUNT(*),
        2
    ) AS Gasoline_Percentage
FROM Car
GROUP BY Period;

-- Q2: Is there any difference between the average car prices across different brand countries (Japanese, American, European)?

CREATE VIEW CarUpdate AS
    SELECT *, 
        CASE
            WHEN Manufacturer = 'ACURA' THEN 'Asian'
            WHEN Manufacturer = 'ALFA ROMEO' THEN 'European'
            WHEN Manufacturer = 'ASTON MARTIN' THEN 'European'
            WHEN Manufacturer = 'AUDI' THEN 'European'
            WHEN Manufacturer = 'BENTLEY' THEN 'European'
            WHEN Manufacturer = 'BMW' THEN 'European'
            WHEN Manufacturer = 'BUICK' THEN 'American'
            WHEN Manufacturer = 'CADILLAC' THEN 'American'
            WHEN Manufacturer = 'CHEVROLET' THEN 'American'
            WHEN Manufacturer = 'CHRYSLER' THEN 'American'
            WHEN Manufacturer = 'CITROEN' THEN 'European'
            WHEN Manufacturer = 'DAEWOO' THEN 'Asian'
            WHEN Manufacturer = 'DAIHATSU' THEN 'Asian'
            WHEN Manufacturer = 'DODGE' THEN 'American'
            WHEN Manufacturer = 'FERRARI' THEN 'European'
            WHEN Manufacturer = 'FIAT' THEN 'European'
            WHEN Manufacturer = 'FORD' THEN 'American'
            WHEN Manufacturer = 'GAZ' THEN 'European'
            WHEN Manufacturer = 'GMC' THEN 'American'
            WHEN Manufacturer = 'GREATWALL' THEN 'Asian'
            WHEN Manufacturer = 'HAVAL' THEN 'Asian'
            WHEN Manufacturer = 'HONDA' THEN 'Asian'
            WHEN Manufacturer = 'HUMMER' THEN 'American'
            WHEN Manufacturer = 'HYUNDAI' THEN 'Asian'
            WHEN Manufacturer = 'INFINITI' THEN 'Asian'
            WHEN Manufacturer = 'ISUZU' THEN 'Asian'
            WHEN Manufacturer = 'JAGUAR' THEN 'European'
            WHEN Manufacturer = 'JEEP' THEN 'American'
            WHEN Manufacturer = 'KIA' THEN 'Asian'
            WHEN Manufacturer = 'LAMBORGHINI' THEN 'European'
            WHEN Manufacturer = 'LANCIA' THEN 'European'
            WHEN Manufacturer = 'LAND ROVER' THEN 'European'
            WHEN Manufacturer = 'LEXUS' THEN 'Asian'
            WHEN Manufacturer = 'LINCOLN' THEN 'American'
            WHEN Manufacturer = 'MASERATI' THEN 'European'
            WHEN Manufacturer = 'MAZDA' THEN 'Asian'
            WHEN Manufacturer = 'MERCEDES-BENZ' THEN 'European'
            WHEN Manufacturer = 'MERCURY' THEN 'American'
            WHEN Manufacturer = 'MINI' THEN 'European'
            WHEN Manufacturer = 'MITSUBISHI' THEN 'Asian'
            WHEN Manufacturer = 'MOSKVICH' THEN 'European'
            WHEN Manufacturer = 'NISSAN' THEN 'Asian'
            WHEN Manufacturer = 'OPEL' THEN 'European'
            WHEN Manufacturer = 'PEUGEOT' THEN 'European'
            WHEN Manufacturer = 'PONTIAC' THEN 'American'
            WHEN Manufacturer = 'PORSCHE' THEN 'European'
            WHEN Manufacturer = 'RENAULT' THEN 'European'
            WHEN Manufacturer = 'ROLLS-ROYCE' THEN 'European'
            WHEN Manufacturer = 'ROVER' THEN 'European'
            WHEN Manufacturer = 'SAAB' THEN 'European'
            WHEN Manufacturer = 'SATURN' THEN 'American'
            WHEN Manufacturer = 'SCION' THEN 'Asian'
            WHEN Manufacturer = 'SEAT' THEN 'European'
            WHEN Manufacturer = 'SKODA' THEN 'European'
            WHEN Manufacturer = 'SSANGYONG' THEN 'Asian'
            WHEN Manufacturer = 'SUBARU' THEN 'Asian'
            WHEN Manufacturer = 'SUZUKI' THEN 'Asian'
            WHEN Manufacturer = 'TESLA' THEN 'American'
            WHEN Manufacturer = 'TOYOTA' THEN 'Asian'
            WHEN Manufacturer = 'UAZ' THEN 'European'
            WHEN Manufacturer = 'VAZ' THEN 'European'
            WHEN Manufacturer = 'VOLKSWAGEN' THEN 'European'
            WHEN Manufacturer = 'VOLVO' THEN 'European'
            WHEN Manufacturer = 'ZAZ' THEN 'European'
        END AS Brand_Country
        FROM Car;
        
-- SELECT * FROM CarUpdate;

SELECT Brand_Country, AVG(Price) AS Avg_Price
FROM CarUpdate
GROUP BY Brand_Country
ORDER BY Brand_Country;

DROP VIEW CarUpdate;
