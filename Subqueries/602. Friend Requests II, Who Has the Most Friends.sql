SELECT TOP(1) 
    reqS.requester_id AS id, 
    COALESCE(reqS.countAsRequester, 0) + COALESCE(acc.countAsAccepter, 0) AS num
FROM (
    SELECT 
        req.requester_id, 
        COUNT(req.requester_id) AS countAsRequester
    FROM RequestAccepted req
    GROUP BY req.requester_id
) reqS
LEFT JOIN (
    SELECT 
        acc.accepter_id, 
        COUNT(acc.accepter_id) AS countAsAccepter
    FROM RequestAccepted acc
    GROUP BY acc.accepter_id
) acc
ON reqS.requester_id = acc.accepter_id
ORDER BY num DESC;