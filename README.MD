## 📌 Project Background

The IT Service Management (ITSM) dataset represents operational IT support ticket data across multiple priority levels, agent groups, ticket sources, and resolution timelines.

This project transforms raw IT support ticket data into a structured business intelligence solution using **SQL and Power BI**, focusing on data cleaning, Service Level Agreement(SLA) validation, exploratory analysis, performance measurement, and executive-level reporting.

The primary objective is to analyze **SLA performance, resolution efficiency (MTTR), workload distribution, ticket complexity, and operational bottlenecks** to support data-driven IT service improvement decisions.



## 🧱 Data Structure & Initial Checks

### Dataset Details

- **Domain:** IT Service Management (ITSM)  
- **Format:** CSV  
- **Records:** ~9999 tickets  
- **Source:** IT support ticket-level operational data  

### Key Columns

**Dimensions:**  
Ticket_ID, Created_Date, Priority, Status, Source, Agent_Name, Agent_Group, Complexity_Level  

**Measures:**  
Resolution_Time_Hours, SLA_Status  

### Initial Data Quality Checks

- Row count validation  
- Duplicate ticket detection  
- Missing value identification  
- Datatype validation  
- Standardization of priority & status values  
- Resolution time consistency checks  
- SLA breach validation  



## 📊 Power BI Dashboard

The dashboard provides operational insights through:

- Total Tickets, Open Tickets, Resolved Tickets KPIs  
- Average Resolution Time  
- SLA Performance by Priority  
- Monthly Ticket Trend Analysis  
- Resolution Time by Priority  
- Ticket Distribution by Source  
- Top Agents by Ticket Volume  
- Ticket Load by Agent Group  
- Ticket Status Breakdown  
- Complexity vs Resolution Time Analysis  


An interactive Power BI dashboard (Overview & Breakdown pages) can be downloaded [here](PowerBI/ITSM_dashboard.pbix)




### The SQL queries used for preprocessing and analysis can be found in:

Initial Data Checks: [here](SQL%20queries/1.%20Data_cleaning.sql)

Exploratory Data Analysis: [here](SQL%20queries/2.%20Exploratory_Data_Analysis.sql)

Business Questions: [here](SQL%20queries/3.%20Business_questions.sql)



## 📈 Executive Summary

**Overview of Findings:**

- Higher priority tickets (Critical & High) are resolved significantly faster than lower priority tickets.
- Network Operations and IT Support handle the highest ticket workload.
- Ticket inflow is evenly distributed across Phone, Chat, Email, and Portal channels.
- A significant portion of tickets remain in active states (Open & In Progress), indicating operational backlog.
- Ticket complexity (L1, L2, L3) is evenly distributed across the dataset.



### Overview Page
![Overview](Images/Image(1).png)


**Ticket Breakdown Analysis:**
- Identifies highest-performing agents based on ticket volume (Ahmed Al-Nasser, Yousef Al-Nasser, Abdullah Al-Farsi).

- Network Ops and IT Support handle the largest share of tickets, followed by Security and Customer Service.


-  Ticket inflow is evenly distributed across Phone, Chat, Email, and Portal channels (~25% each).

 
 - Significant volume of tickets remains in Open and In Progress states, indicating active workload and backlog levels.




### Breakdown Page
![Breakdown](Images/Image(2).png)



## 📌 Recommendations

- Reduce backlog by prioritizing Open and In Progress tickets through daily monitoring and faster reassignment workflows.

- Rebalance workload across agent groups, especially Network Ops and IT Support, to prevent operational overload.

- Implement proactive SLA tracking dashboards to identify and address potential breaches before escalation.

- Introduce performance tracking at agent level to improve accountability and optimize ticket resolution efficiency.

## 🛠️ Tools & Technologies

- **MySQL**  
  Used for data import, cleaning, SLA validation, data transformation, aggregation, filtering, and business logic analysis.

- **Power BI**  
  Used for building interactive operational dashboards and KPI reporting.

- **DAX**  
  Implemented for KPI calculations such as Total Tickets, MTTR, SLA metrics, and trend analysis.



## ✅ Conclusion

This project delivers an end-to-end ITSM performance analysis using SQL and Power BI, converting raw ticket data into clear operational insights. The analysis enables better SLA monitoring, workload optimization, and data-driven service management decisions.


