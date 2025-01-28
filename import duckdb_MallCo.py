import duckdb

con = duckdb.connect("mallco.db")

con.sql(
    """
    CREATE TABLE mall_customers AS SELECT * FROM read_csv_auto('Mall_Customers.csv', HEADER=TRUE);
    """
)
