import duckdb

con = duckdb.connect("kaggle_vg.db")

con.sql(
    """
    CREATE TABLE vgsales AS SELECT * FROM read_csv_auto('vgsales.csv', HEADER=TRUE);
    """
)
