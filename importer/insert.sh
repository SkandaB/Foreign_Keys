set -xeu
cat newschema.sql | mysql -uroot filedb
python insert_users.py
python insert_posts.py
python insert_comments.py
python insert_tags.py
python insert_votes.py
