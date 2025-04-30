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
AND ps.AdmittedDate between '2024-02-27' AND '2024-03-01'