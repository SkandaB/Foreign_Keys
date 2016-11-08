import MySQLdb
import time
import random
import calendar
from datetime import timedelta, date
from faker import Faker
fake = Faker()

db = MySQLdb.connect(host="127.0.0.1",    # your host, usually localhost
                     user="foreignkeys",         # your username
                     passwd="nonosql",  # your password
                     db="hw7_db")        # name of the data base

cur = db.cursor()

#User table
for i in range(6, 101):
    try:
        full_name = fake.name()
        street = fake.street_address()
        city = fake.city()
        unit_number = fake.random_digit_not_null()
        zip_code = fake.zipcode()
        #SQL query to INSERT a record into the table FACTRESTTBL.
        cur.execute('''INSERT into user (id, full_name, Street, City, unit_number, zip_code)
                      values (%s, %s, %s, %s, %s, %s)''',
                      (i, full_name, street, city, unit_number, zip_code))
        db.commit()
    except:
       db.rollback()

#Vote table
for i in range(10, 101):
    try:
        post_id = random.randint(1,350)
        user_id = random.randint(1,100)
        cur.execute('''INSERT into vote (id, user_id, post_id)
                      values ( %s, %s, %s)''',
                      (i, user_id, post_id))
        db.commit()
    except:
       db.rollback()
        
#Calendar table
def daterange(start_date, end_date):
    for n in range(int ((end_date - start_date).days)):
        yield start_date + timedelta(n)

#Calendar table
start_date = date(2015, 1, 2)
end_date = date(2016, 10, 30)
for single_date in daterange(start_date, end_date):
    try:
        fulldate = single_date.strftime("%Y-%m-%d")
        day_of_week = calendar.day_name[single_date.weekday()]
        month = calendar.month_name[single_date.weekday()]
        year = single_date.year
        day_of_month =  single_date.day
        quarter = 'Q' + str((single_date.month-1)//3 + 1)
        cur.execute('''INSERT into calendar (fulldate, month, year, day_of_month, day_of_week, quarter)
                      values ( %s, %s, %s, %s, %s, %s)''',
                      (fulldate, month, year, day_of_month, day_of_week, quarter))
        db.commit()
    except:
        db.rollback()

db.close()
