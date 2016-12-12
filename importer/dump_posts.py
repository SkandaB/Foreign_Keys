import lxml.etree
import json

usersf = open('userids.txt', 'w')
questionsf = open('questions.txt', 'w')
answersf = open('answers.txt', 'w')
postids = open('postids.txt', 'w')

users = set()

def get_rows_to_import(xml_path, required_fields=None):
    parser = lxml.etree.iterparse(xml_path)
    for event, el in parser:
        if event == 'end' and el.tag == 'row':
            attrs = dict(el.items())
            el.clear()
            if required_fields and not has_required_fields(attrs, required_fields):
                continue
            yield attrs

def has_required_fields(attrs, required_fields):
    for field in required_fields:
        if field not in attrs:
            return False
    return True

for post in get_rows_to_import('Posts.xml', ['CreationDate', 'Body', 'OwnerUserId']):
    if post.get('ParentId'):
        answersf.write(json.dumps(post) + '\n')
    else:
        questionsf.write(json.dumps(post) + '\n')
    postids.write(post["Id"] + "\n")
    users.add(post["OwnerUserId"])

for user in users:
    usersf.write(user + '\n')

usersf.close()
questionsf.close()
answersf.close()
postids.close()
