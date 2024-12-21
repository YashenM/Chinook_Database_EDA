# Chinook Database Exploratory Data Analysis (EDA)
Exploratory Data Analysis on the Chinook Database using SQL

## Project Purpose
This project conducts an exploratory data analysis (EDA) of the Chinook database, a sample dataset designed to simulate a digital media store. The goal is to derive actionable insights to improve business performance through data-driven strategies.

## Dataset Overview
The [Chinook database](https://github.com/lerocha/chinook-database) is a public dataset with a rich schema representing a music store's operations. Below is a summary of its key tables and attributes:

- **Album**: AlbumId, Title, ArtistId  
- **Artist**: ArtistId, Name  
- **Customer**: CustomerId, Name, Contact Info, SupportRepId  
- **Employee**: EmployeeId, Name, Title, Hire Details  
- **Genre**: GenreId, Name  
- **Invoice**: InvoiceId, CustomerId, Date, Total  
- **InvoiceLine**: InvoiceLineId, InvoiceId, TrackId, Quantity, UnitPrice  
- **Track**: TrackId, Name, AlbumId, GenreId, UnitPrice

## Tools and Technologies
- **Database Management**: MySQL Workbench  
- **Data Visualization**: Tableau Public  
- **Report Writing**: LaTeX  
- **Version Control**: Git and GitHub

## Steps to Reproduce
To replicate this analysis:
1. Download the Chinook database in `.sql` format from the [source](https://github.com/lerocha/chinook-database).  
2. Import the `.sql` file into MySQL Workbench (tested with version 8.0 CE).  
3. Use the SQL queries provided in this repository to perform the analysis.  
4. Visualize the insights using Tableau Public.

## Repository Structure
The repository contains the following files:
- `Chinook_EDA.sql`: SQL scripts used for analysis.  
- `Chinook_Database.sql`: The Chinook database file.  
- `data_dictionary.txt`: Description of the database schema and attributes.  
- `Report.pdf`: A detailed report documenting findings and recommendations.  
- `Visualizations.twbx`: Tableau workbook showcasing visual insights (to be added).

## Key Findings
### Revenue Insights
- Total revenue: **$2,328.60**  
- Average purchase amount: **$5.65**  
- High-revenue months: January 2022 ($52.62), April 2023 ($51.62).

### Customer Behavior
- Top customers: **Helena Holý ($49.62), Richard Cunningham ($47.62)**.  
- High-revenue regions: **USA ($523.06), Canada ($303.96)**.  
- Spending tiers: High, Medium, Low.

### Artist and Genre Performance
- Top genre: **Rock (835 tracks sold)**.  
- Best-selling artist: **Iron Maiden (213 tracks)**.  
- Best-selling album: **Minha Historia by Chico Buarque (27 tracks sold)**.

### Sales Efficiency
- Best-performing salesperson: **Jane Peacock ($833.04 revenue)**.

## Visualizations
Tableau visualizations highlighting revenue trends, customer segmentation, and performance metrics will be shared in the repository shortly.

## Strategic Recommendations
- Enhance employee training using insights from top performers.  
- Focus marketing efforts on high-revenue regions.  
- Boost revenue in low-performing months with targeted campaigns.  
- Expand inventory in popular genres like Rock, Latin, and Metal.  
- Implement customer loyalty programs for high spenders and upselling strategies for medium spenders.

## Acknowledgments
Special thanks to the Chinook Database project for providing the dataset.
