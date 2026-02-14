# Are we meeting SLA commitments consistently?
SELECT
    `SLA for Resolution`,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `SLA for Resolution`;

# Which priority tickets impact SLA performance the most?
SELECT
    `Priority`,
    `SLA for Resolution`,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Priority`, `SLA for Resolution`
ORDER BY `Priority`;

# What is the average resolution time (MTTR)?
SELECT
    AVG(TIME_TO_SEC(`Resolution Time`)) / 3600 AS avg_resolution_hours
FROM itsm_fact_table;

# Which priority level takes the longest to resolve?
SELECT
    `Priority`,
    AVG(TIME_TO_SEC(`Resolution Time`)) / 3600 AS avg_resolution_hours
FROM itsm_fact_table
GROUP BY `Priority`
ORDER BY avg_resolution_hours DESC;

# Which support level handles the most complex issues?
SELECT
    `Support Level`,
    AVG(TIME_TO_SEC(`Resolution Time`)) / 3600 AS avg_resolution_hours
FROM itsm_fact_table
GROUP BY `Support Level`
ORDER BY avg_resolution_hours DESC;

# Which teams are overloaded with tickets?
SELECT
    `Agent Group`,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Agent Group`
ORDER BY ticket_count DESC;

# Are tickets evenly distributed among agents?
SELECT
    `Agent Name`,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Agent Name`
ORDER BY ticket_count DESC
LIMIT 10;

# Which incident topics occur most frequently?
SELECT
    `Topic`,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Topic`
ORDER BY ticket_count DESC
LIMIT 10;

# Which product groups generate the most incidents?
SELECT
    `Product Group`,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Product Group`
ORDER BY ticket_count DESC;

# Do complex tickets take longer to resolve?
SELECT
    AVG(`Agent Interactions`) AS avg_interactions,
    AVG(TIME_TO_SEC(`Resolution Time`)) / 3600 AS avg_resolution_hours
FROM itsm_fact_table;

# When do most tickets occur (trend analysis)?
SELECT
    `Created Date`,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Created Date`
ORDER BY `Created Date`;


















