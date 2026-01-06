# Presidential Elections Database

## 📚 Project Information

This project is a coursework assignment for the Database Systems course.  
The SQL scripts and database design were created as part of academic work and are intended for educational purposes only.

---

This repository contains a SQL script to create a database for modeling presidential elections.  
It includes tables for regions, candidates, voters, campaigns, budgets, votes, and election results.  
The database is designed to demonstrate relationships between entities and track election-related data.

---

## 🗂️ Table Structure

1. **Region**  
   Stores information about regions, including name and population.

2. **Election**  
   Stores information about elections, including start and end dates.

3. **Nationality**  
   Stores nationalities of candidates and voters.

4. **Candidate**  
   Stores information about presidential candidates: first name, last name, middle name, nationality, date of birth, and additional info.

5. **CandidateElection**  
   Junction table connecting candidates to elections.

6. **Voter**  
   Stores information about voters: first name, last name, middle name, nationality, date of birth, and registered region.

7. **Campaign**  
   Stores information about candidates' election campaigns: campaign name, start and end dates, description, and associated candidate.

8. **Budget**  
   Stores budget information for campaigns: total budget and expenditures.

9. **ElectionResult**  
   Stores results of elections for each candidate with optional descriptive notes.

10. **Vote**  
    Stores individual votes cast by voters, linking to candidate, election, and region.

---

## 🔗 Database Relationships

| Table 1          | Table 2                  | Relationship Type | Description                                                                 |
|-----------------|-------------------------|-----------------|-----------------------------------------------------------------------------|
| Region           | Voter                    | One-to-Many      | One region can have many voters, each voter belongs to one region.         |
| Nationality      | Candidate                | One-to-Many      | One nationality can have many candidates, each candidate has one nationality. |
| Nationality      | Voter                    | One-to-Many      | One nationality can have many voters, each voter has one nationality.       |
| Candidate        | CandidateElection        | Many-to-Many     | Candidates can participate in many elections; elections can have many candidates. |
| CandidateElection| Election                 | Many-to-Many     | Junction table connecting candidates and elections.                          |
| Candidate        | Campaign                 | One-to-Many      | One candidate can have many campaigns; each campaign belongs to one candidate. |
| Campaign         | Budget                   | One-to-One       | Each campaign has one budget.                                               |
| Candidate        | ElectionResult           | Many-to-Many     | One candidate can have results in many elections; each election has many candidates. |
| Voter            | Vote                     | Many-to-Many     | Voters can cast votes in many elections; votes track candidate, election, and region. |
| Vote             | Candidate/Election/Region| Many-to-Many     | Each vote connects voter, candidate, election, and region.                 |

---

## ⚙️ Usage

1. Open SQL Server Management Studio (SSMS) or any compatible SQL environment.
2. Execute the script `presidential_elections.sql` to create the database and tables.
3. Populate tables with data as needed.
4. Run queries to analyze election results, voter demographics, campaign budgets, or voting patterns.
