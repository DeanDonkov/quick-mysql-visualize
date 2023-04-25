from flask import Flask, render_template, g, request, flash, redirect, url_for, session
import sqlite3
import os
import sqlite3

DB_PATH = 'database.db'
SCHEMA_PATH = 'database_setup.sql'

app = Flask(__name__)
app.secret_key = 'my_secret_key'

def create_database():
    if os.path.exists(DB_PATH):
        os.remove(DB_PATH)
    conn = sqlite3.connect(DB_PATH)
    with open(SCHEMA_PATH) as f:
        conn.executescript(f.read())
    conn.close()

    # Add flag to keep track of whether data has been inserted
    data_inserted = False

    # If data has not been inserted, insert it
    if not data_inserted:
        conn = sqlite3.connect(DB_PATH)
        # insert data here
        conn.close()


@app.before_first_request
def init_db():
    create_database()

# Add a new client to the Clients table


@app.route('/insert_client', methods=['POST'])
def insert_client():
    if request.method == 'POST':
        card_number = request.form['card_number']
        full_name = request.form['full_name']

        # Use SQL INSERT statement to insert data into the Clients table
        conn = get_db()
        cur = conn.cursor()
        cur.execute(
            "INSERT INTO Clients (CardNumber, FullName) VALUES (?, ?)", (card_number, full_name))
        conn.commit()
        flash('Client inserted successfully!')
        return redirect(url_for('index'))

# Add a new bank to the Banks table


@app.route('/insert_bank', methods=['POST'])
def insert_bank():
    if request.method == 'POST':
        bank_code = request.form['bank_code']
        bank_name = request.form['bank_name']
        legal_address = request.form['legal_address']

        # Use SQL INSERT statement to insert data into the Banks table
        conn = get_db()
        cur = conn.cursor()
        cur.execute("INSERT INTO Banks (BankCode, BankName, LegalAddress) VALUES (?, ?, ?)",
                    (bank_code, bank_name, legal_address))
        conn.commit()
        flash('Bank inserted successfully!')
        return redirect(url_for('index'))

# Add a new ATM to the ATMs table


@app.route('/insert_atm', methods=['POST'])
def insert_atm():
    if request.method == 'POST':
        atm_number = request.form['atm_number']
        atm_address = request.form['atm_address']
        bank_code = request.form['bank_code']

        # Use SQL INSERT statement to insert data into the ATMs table
        conn = get_db()
        cur = conn.cursor()
        cur.execute("INSERT INTO ATMs (ATMNumber, ATMAddress, BankCode) VALUES (?, ?, ?)",
                    (atm_number, atm_address, bank_code))
        conn.commit()
        flash('ATM inserted successfully!')
        return redirect(url_for('index'))

# Add a new operation to the Operations table


@app.route('/insert_operation', methods=['POST'])
def insert_operation():
    if request.method == 'POST':
        operation_id = request.form['operation_id']
        card_number = request.form['card_number']
        atm_number = request.form['atm_number']
        date = request.form['date']
        time = request.form['time']
        commission = request.form['commission']
        withdrawal_amount = request.form['withdrawal_amount']

        # Use SQL INSERT statement to insert data into the Operations table
        conn = get_db()
        cur = conn.cursor()
        cur.execute("INSERT INTO Operations (OperationID, CardNumber, ATMNumber, Date, Time, Commission, WithdrawalAmount) VALUES (?, ?, ?, ?, ?, ?, ?)",
                    (operation_id, card_number, atm_number, date, time, commission, withdrawal_amount))
        conn.commit()
        flash('Operation inserted successfully!')
        return redirect(url_for('index'))


@app.before_request
def before_request():
    g.db = sqlite3.connect(DB_PATH)


@app.teardown_request
def teardown_request(exception):
    db = getattr(g, 'db', None)
    if db is not None:
        db.close()

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect('database.db')
    return db



@app.route('/')
def index():
    session['username'] = 'John'
    cur = get_db().cursor()

    # Select all rows from each table
    cur.execute("SELECT * FROM Banks")
    banks = cur.fetchall()

    cur.execute("SELECT * FROM ATMs")
    atms = cur.fetchall()

    cur.execute("SELECT * FROM Clients")
    clients = cur.fetchall()

    cur.execute("SELECT * FROM Operations")
    operations = cur.fetchall()


    # Put your SQL schema and data here
  

    # Your SQL queries to visualize the data

    # This query selects information about ATM transactions that occurred during the month of January 2023. It retrieves the OperationID, Date, Time, WithdrawalAmount, Commission, CardNumber, FullName, ATMNumber, and ATMAddress from the Operations, Clients, and ATMs tables. It joins the tables based on matching CardNumber and ATMNumber values and restricts the results to transactions that occurred between January 1, 2023 and January 31, 2023.
    query1 = """
    
SELECT o.OperationID, o.Date, o.Time, o.WithdrawalAmount, o.Commission, c.CardNumber, c.FullName, a.ATMNumber, a.ATMAddress
FROM Operations o
JOIN Clients c ON o.CardNumber = c.CardNumber
JOIN ATMs a ON o.ATMNumber = a.ATMNumber
WHERE o.Date BETWEEN '2023-01-01' AND '2023-01-31';
    """

    # This query selects information about ATM usage by quarter. It retrieves the ATMNumber, ATMAddress, Quarter, NumberOfOperations, and TotalAmount from the Operations and ATMs tables. It joins the tables based on matching ATMNumber values and calculates the quarter based on the Date value. It then groups the results by ATMNumber, ATMAddress, and Quarter, and calculates the number of operations and total amount withdrawn for each quarter.
    query2 = """
    
SELECT a.ATMNumber, a.ATMAddress, (strftime('%m', o.Date) - 1) / 3 + 1 AS Quarter, COUNT(o.OperationID) AS NumberOfOperations, SUM(o.WithdrawalAmount) AS TotalAmount
FROM Operations o
JOIN ATMs a ON o.ATMNumber = a.ATMNumber
GROUP BY a.ATMNumber, a.ATMAddress, (strftime('%m', o.Date) - 1) / 3 + 1;
    """

    # This query selects information about the busiest ATM during the month of January 2023. It retrieves the ATMNumber, ATMAddress, and NumberOfOperations from the Operations and ATMs tables. It joins the tables based on matching ATMNumber values and restricts the results to transactions that occurred between January 1, 2023 and January 31, 2023. It then groups the results by ATMNumber and ATMAddress, and sorts the results in descending order by NumberOfOperations. Finally, it limits the results to the first row, which will be the ATM with the highest number of transactions.
    query3 = """
    SELECT a.ATMNumber, a.ATMAddress, COUNT(o.OperationID) AS NumberOfOperations
FROM Operations o
JOIN ATMs a ON o.ATMNumber = a.ATMNumber
WHERE o.Date BETWEEN '2023-01-01' AND '2023-01-31'
GROUP BY a.ATMNumber, a.ATMAddress
ORDER BY NumberOfOperations DESC
LIMIT 1;
    """

    cur.execute(query1)
    results1 = cur.fetchall()

    cur.execute(query2)
    results2 = cur.fetchall()

    cur.execute(query3)
    results3 = cur.fetchall()

    return render_template('index.html', banks=banks, clients=clients, atms=atms, operations=operations, results1=results1, results2=results2, results3=results3)


if __name__ == '__main__':
    create_database()
    app.run(debug=True)
