import sys
import MySQLdb
import MySQLdb.cursors
from time import sleep
conn = MySQLdb.connect('127.0.0.1', 'root', cursorclass=MySQLdb.cursors.DictCursor)
conn.select_db('filedb')
cursor = conn.cursor()

def get_count(table):
	cursor.execute("show table status where Name=%s", (table,))
	res = cursor.fetchone()
	return res['Rows']

def main():
	table = sys.argv[1]
	total = int(sys.argv[2])
	c1 = get_count(table)
	sleep(5)
	c2 = get_count(table)
	rate = (c2-c1)/5.0
	progress = (c2/float(total))*100.0
	rem = (total / rate) / 3600 if rate > 0 else -1
	print "Insert rate: {0:.2f} rows/sec. Progress {1:.2f}% rem: {2:.2f} hrs".format(rate, progress, rem)


if __name__ == "__main__":
	main()
