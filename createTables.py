import psycopg

with psycopg.connect(
    host="200.129.44.249",
    dbname="554589",
    user="554589",
    password="554589"
) as conn:
    print("Conectou")

    cur=conn.cursor()

    cur.execute("SELECT * FROM leitores;")

    resultado=cur.fetchall()
    print(resultado)