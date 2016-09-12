### Foreign_Keys

### Setup

* Start MariaDB server
* Setup foreignkeys user and database

	```
	cat setup_database.sql | mysql -u root
	```
* For every homework, create schema (+ test data)
	
	```
	cd HW1
	cat schema.sql | mysql -u foreignkeys -pnonosql foreignkeys
	```
