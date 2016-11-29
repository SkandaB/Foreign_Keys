import MySQLdb
import time
import random
import calendar
from datetime import timedelta, date

db = MySQLdb.connect(host="127.0.0.1",    # your host, usually localhost
                     user="root",         # your username
                     db="filedb")        # name of the data base

cur = db.cursor()

#Calendar table
def daterange(start_date, end_date):
    for n in range(int ((end_date - start_date).days)):
        yield start_date + timedelta(n)

#Calendar table
def doit():
    start_date = date(2008, 1, 1)
    end_date = date(2016, 10, 30)
    for single_date in daterange(start_date, end_date):
        try:
            fulldate = single_date.strftime("%Y-%m-%d")
            day_of_week = calendar.day_name[calendar.weekday(single_date.year,
                                                             single_date.month,
                                                             single_date.day)]
            month = calendar.month_name[single_date.month]
            year = single_date.year
            day_of_month =  single_date.day
            quarter = 'Q' + str((single_date.month-1)//3 + 1)
            cur.execute('''INSERT into calendar (fulldate, month, year, day_of_month, day_of_week, quarter)
                        values ( %s, %s, %s, %s, %s, %s)''',
                        (fulldate, month, year, day_of_month, day_of_week, quarter))
            db.commit()
        except:
            db.rollback()

if __name__ == "__main__":
    doit()
