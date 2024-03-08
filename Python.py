import mysql.connector
def select(conn,query):  # Function to execute SELECT queries
    cursor = conn.cursor()
    cursor.execute(query)
    results = []  # List to store query results
    for row in cursor.fetchall():
        results.append(row) #add each row to list
    cursor.close()
    return results
def execute(conn,query):  # Function to update, delete, and insert queries
    cursor = conn.cursor()
    cursor.execute(query)
    conn.commit()
def show(rows): #function to iterate through rows and print
    for row in rows:
        print(row)
def save(data, file_name): 
    # Function to save data to a text file
    with open(file_name, 'w') as file: #open file with write mode
        for row in data:
            # Write each row of data to the file
            file.write(str(row) + '\n')
try:
    conn = mysql.connector.connect( #database connection
        user="root", #mysql user name
        password="", #user password
        host="localhost",
        database="apartmentdb") #database name
except mysql.connector.Error as err: #handle connection errors
    print("Cannot connect.")
    exit()

print("Select a record")
rows = select(conn,"select * from tenants") #call the select function
save(rows, "db.txt") # call the save function to add text to file
show(rows) # call the show function to show the output
