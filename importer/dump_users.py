import lxml.etree
import json

useridsf = open('userids.txt', 'rb')
usersf = open('users.txt', 'wb')

userids = set()
for line in useridsf:
    userids.add(line.strip())

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

for user in get_rows_to_import('Users.xml', ['CreationDate', 'Id', 'DisplayName']):
    if user['Id'] in userids:
        usersf.write(json.dumps(user) + '\n')


usersf.close()
useridsf.close()
