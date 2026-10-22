import psycopg2

conn = psycopg2.connect(
    host="localhost",
    database="company_db",
    user="postgres",
    password="281998momo",
    port="5432"
)

cursor = conn.cursor()

print("Connected successfully!")

cursor.execute("""
    CREATE TABLE IF NOT EXISTS employees (
        emp_id INTEGER PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        salary INTEGER,
        job_title VARCHAR(100),
        gender VARCHAR(10),
        hire_date DATE
    );
""")

cursor.execute("""
    CREATE TABLE IF NOT EXISTS departments (
        emp_id INTEGER,
        dept_name VARCHAR(100),
        dept_id INTEGER
    );
""")

employees = [
    (17679, "Robert", "Gilmore", 110000, "Operations Director", "Male", "2018-09-04"),
    (26650, "Elvis", "Ritter", 86000, "Sales Manager", "Male", "2017-11-24"),
    (30840, "David", "Barrow", 85000, "Data Scientist", "Male", "2019-12-02"),
    (49714, "Hugo", "Forester", 55000, "IT Support Specialist", "Male", "2019-11-22"),
    (51821, "Linda", "Foster", 95000, "Data Scientist", "Female", "2019-04-29"),
    (67323, "Lisa", "Wiener", 75000, "Business Analyst", "Female", "2018-08-09"),
    (70950, "Rodney", "Weaver", 87000, "Project Manager", "Male", "2018-12-20"),
    (71329, "Gayle", "Meyer", 77000, "HR Manager", "Female", "2019-06-28"),
    (76589, "Jason", "Christian", 99000, "Project Manager", "Male", "2019-01-21"),
    (97927, "Billie", "Lanning", 67000, "Web Developer", "Female", "2018-06-25")
]

cursor.executemany("""
    INSERT INTO employees
    (emp_id, first_name, last_name, salary, job_title, gender, hire_date)
    VALUES (%s, %s, %s, %s, %s, %s, %s)
    ON CONFLICT (emp_id) DO NOTHING;
""", employees)

departments = [
    (17679, "Operations", 13),
    (26650, "Marketing", 14),
    (30840, "Operations", 13),
    (49823, "Technology", 12),
    (51821, "Operations", 13),
    (67323, "Marketing", 14),
    (71119, "Administrative", 11),
    (76589, "Operations", 13),
    (97927, "Technology", 12)
]

cursor.execute("DELETE FROM departments;")

cursor.executemany("""
    INSERT INTO departments
    (emp_id, dept_name, dept_id)
    VALUES (%s, %s, %s);
""", departments)

conn.commit()

cursor.close()
conn.close()

print("Tables created and data inserted successfully!")

