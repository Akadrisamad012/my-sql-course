-- SELECT * FROM airports

SELECT 
    ps.PatientID
   
    , ps.Hospital
    , PS.Ward
    , ps.AdmittedDate
    , ps.DischargeDate 
    , DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
    , DATEADD(DAY, -14, ps.AdmittedDate) AS ReminderDate
    , ps.Tariff
FROM  PatientStay ps
where ps.Hospital IN ('pruh', 'oxleas')
AND ps.Ward LIKE '%surgery'
-- AND ps.AdmittedDate >= '2024-02-27'
AND ps.AdmittedDate <= '2024-03-01'
-- AND ps.AdmittedDate between '2024-02-27' AND '2024-03-01'
ORDER BY ps.AdmittedDate DESC , PS.PatientId DESC


SELECT
    ps.Hospital
, COUNT (*) as NumberOfPatient 
, SUM( ps.Tariff) as TotalTariff
, MAX(ps.Tariff) as MaxTariff
, Min(ps.Tariff) as MinTariff
, avg(ps.Tariff) as AvgTariff
FROM PatientStay ps
group by ps.Hospital, ps.Ward
 order by NumberOfPatient DESC

SELECT
    ps.ward,
    avg(ps.Tariff) as AverageTariff
    FROM PatientStay ps
    GROUP BY ps.Ward
   
   SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    ,dh.HospitalSize
    ,dh.HospitalType
FROM
    PatientStay ps
    JOIN DimHospital dh
    ON ps.Hospital = dh.Hospital