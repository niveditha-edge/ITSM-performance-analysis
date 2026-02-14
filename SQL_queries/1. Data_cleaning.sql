select * from itsm_fact_table;

CREATE TABLE itsm_fact_table_backup AS
SELECT *
FROM itsm_fact_table;

DESCRIBE itsm_fact_table;

# Check total rows
SELECT COUNT(*) AS total_rows
FROM itsm_fact_table;

# Check duplicate tickets
SELECT
    `Status`,
    `Ticket ID`,
    `Priority`,
    `Priority Level`,
    `Source`,
    `Topic`,
    `Agent Group`,
    `Agent Name`,
    `Created Date`,
    `Created time`,
    `Expected SLA to resolve Date`,
    `Expected SLA to resolve Time`,
    `Expected SLA to first response Date`,
    `Expected SLA to first response Time`,
    `First response Date`,
    `First response Time`,
    `SLA for first response`,
    `Resolution Date`,
    `Resolution Time`,
    `SLA for Resolution`,
    `Close time`,
    `Agent Interactions`,
    `Survey Results`,
    `Product Group`,
    `Support Level`,
    `Country`,
    COUNT(*) AS cnt
FROM itsm_fact_table
GROUP BY
    `Status`,
    `Ticket ID`,
    `Priority`,
    `Priority Level`,
    `Source`,
    `Topic`,
    `Agent Group`,
    `Agent Name`,
    `Created Date`,
    `Created time`,
    `Expected SLA to resolve Date`,
    `Expected SLA to resolve Time`,
    `Expected SLA to first response Date`,
    `Expected SLA to first response Time`,
    `First response Date`,
    `First response Time`,
    `SLA for first response`,
    `Resolution Date`,
    `Resolution Time`,
    `SLA for Resolution`,
    `Close time`,
    `Agent Interactions`,
    `Survey Results`,
    `Product Group`,
    `Support Level`,
    `Country`
HAVING COUNT(*) > 1;

# Check NULLs
SELECT
    SUM(CASE WHEN `Status` IS NULL THEN 1 ELSE 0 END) AS status_nulls,
    SUM(CASE WHEN `Ticket ID` IS NULL THEN 1 ELSE 0 END) AS ticket_id_nulls,
    SUM(CASE WHEN `Priority` IS NULL THEN 1 ELSE 0 END) AS priority_nulls,
    SUM(CASE WHEN `Created time` IS NULL THEN 1 ELSE 0 END) AS created_time_nulls,
    SUM(CASE WHEN `Resolution Time` IS NULL THEN 1 ELSE 0 END) AS resolution_time_nulls,
    SUM(CASE WHEN `SLA for Resolution` IS NULL THEN 1 ELSE 0 END) AS sla_resolution_nulls
FROM itsm_fact_table;

## View rows where critical values are missing
SELECT *
FROM itsm_fact_table
WHERE `Status` IS NULL
   OR `Priority` IS NULL
   OR `Created time` IS NULL;
   
## Check NULLs in SLA-related columns
SELECT
    SUM(CASE WHEN `SLA for first response` IS NULL THEN 1 ELSE 0 END) AS first_response_sla_nulls,
    SUM(CASE WHEN `SLA for Resolution` IS NULL THEN 1 ELSE 0 END) AS resolution_sla_nulls
FROM itsm_fact_table;

## Check NULLs in Agent-related columns
SELECT
    SUM(CASE WHEN `Agent Group` IS NULL THEN 1 ELSE 0 END) AS agent_group_nulls,
    SUM(CASE WHEN `Agent Name` IS NULL THEN 1 ELSE 0 END) AS agent_name_nulls,
    SUM(CASE WHEN `Agent Interactions` IS NULL THEN 1 ELSE 0 END) AS agent_interactions_nulls
FROM itsm_fact_table;

# Standardize STATUS values
UPDATE itsm_fact_table
SET status = UPPER(TRIM(status));

# Standardize PRIORITY
UPDATE itsm_fact_table
SET priority = UPPER(TRIM(priority));

# Verify after standardization
SELECT DISTINCT `Status`
FROM itsm_fact_table;

SELECT DISTINCT `SLA for first response`
FROM itsm_fact_table;

SELECT DISTINCT `SLA for Resolution`
FROM itsm_fact_table;

UPDATE itsm_fact_table
SET
    `SLA for first response` = UPPER(TRIM(`SLA for first response`)),
    `SLA for Resolution` = UPPER(TRIM(`SLA for Resolution`));
 
# Agent Interaction Cleanup
SELECT *
FROM itsm_fact_table
WHERE `Agent Interactions` IS NULL
   OR `Agent Interactions` < 0;
























