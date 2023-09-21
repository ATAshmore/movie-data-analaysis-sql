# movie-data-analaysis-sql

This repository contains SQL queries and data for the COP 4710 Fall 2022 project, due on November 7, 2022. The project involves analyzing a dataset of movies, including details such as budgets, revenues, genres, and ratings.

## Data

The dataset consists of three CSV files: movies.csv, genres.csv, and ratings.csv. These files contain information about movies, their genres, and user ratings, downloaded from [The Movie Database](https://www.themoviedb.org) and [MovieLens](https://movielens.org).

To set up the relevant database tables in PostgreSQL, use the provided SQL commands listed in the project description.

## Queries

The project requires writing SQL queries to answer various questions about the dataset. These queries cover topics such as missing revenue information, budgets, popularity, user ratings, and genre-related statistics. All queries can be found in the `queries.sql` file.

## Running Queries

To execute the queries and generate the output, follow these steps:

1. Set up the database tables as described in the project description.
2. Open a terminal and navigate to the directory containing `queries.sql`.
3. Run the following command, replacing `username` and `database` with your PostgreSQL credentials:

   ```shell
   psql -U username -d database -f queries.sql -o output.txt
   ```

   This command will run all queries and save the results in the `output.txt` file.
