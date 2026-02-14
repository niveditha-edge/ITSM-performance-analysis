# Total tickets
SELECT COUNT(*) AS total_tickets
FROM itsm_fact_table;

# Tickets by Status
SELECT `Status`, COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Status`
ORDER BY ticket_count DESC;

# Tickets by Priority
SELECT `Priority`, COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Priority`
ORDER BY ticket_count DESC;

# SLA Performance Analysis
## SLA – First Response:
SELECT `SLA for first response`, COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `SLA for first response`;
## SLA – Resolution:
SELECT `SLA for Resolution`, COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `SLA for Resolution`;
## SLA by Priority:
SELECT
    `Priority`,
    `SLA for Resolution`,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Priority`, `SLA for Resolution`
ORDER BY `Priority`;

# Resolution Time Analysis (MTTR-focused)
## Average Resolution Time:
SELECT
    AVG(TIME_TO_SEC(`Resolution Time`)) / 3600 AS avg_resolution_hours
FROM itsm_fact_table;
## Avg Resolution Time by Priority:
SELECT
    `Priority`,
    AVG(TIME_TO_SEC(`Resolution Time`)) / 3600 AS avg_resolution_hours
FROM itsm_fact_table
GROUP BY `Priority`
ORDER BY avg_resolution_hours DESC;
## Avg Resolution Time by Support Level:
SELECT
    `Support Level`,
    AVG(TIME_TO_SEC(`Resolution Time`)) / 3600 AS avg_resolution_hours
FROM itsm_fact_table
GROUP BY `Support Level`
ORDER BY avg_resolution_hours DESC;

# Incident & Topic Analysis
## Top Incident Topics:
SELECT `Topic`, COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Topic`
ORDER BY ticket_count DESC
LIMIT 10;
## Product Groups with Most Tickets:
SELECT `Product Group`, COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Product Group`
ORDER BY ticket_count DESC;

# Agent & Team Performance
## Tickets by Agent Group:
SELECT `Agent Group`, COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Agent Group`
ORDER BY ticket_count DESC;
## Top Agents by Ticket Volume:
SELECT `Agent Name`, COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Agent Name`
ORDER BY ticket_count DESC
LIMIT 10;
##Avg Agent Interactions per Ticket:
SELECT
    AVG(`Agent Interactions`) AS avg_interactions
FROM itsm_fact_table;
## Tickets with High Interaction Count (Complex Issues):
SELECT *
FROM itsm_fact_table
WHERE `Agent Interactions` > (
    SELECT AVG(`Agent Interactions`)
    FROM itsm_fact_table
);

# Time-based Trend Analysis
## Tickets Created per Day:
SELECT
    `Created Date`,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY `Created Date`
ORDER BY `Created Date`;
## Monthly Ticket Trend:
SELECT
    DATE_FORMAT(`Created Date`, '%Y-%m') AS month,
    COUNT(*) AS ticket_count
FROM itsm_fact_table
GROUP BY month
ORDER BY month;

# Customer Satisfaction (Survey)
## Survey Result Distribution:
SELECT `Survey Results`, COUNT(*) AS response_count
FROM itsm_fact_table
GROUP BY `Survey Results`;
## Resolution Time vs Survey Result:
SELECT
    `Survey Results`,
    AVG(TIME_TO_SEC(`Resolution Time`)) / 3600 AS avg_resolution_hours
FROM itsm_fact_table
GROUP BY `Survey Results`;
























