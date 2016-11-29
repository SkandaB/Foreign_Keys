import lxml.etree
import json

usersf = open('userids.txt', 'rb')
postidsf = open('postids.txt', 'rb')
votesf = open('votes.txt', 'wb')

userids = set()
for line in usersf:
    userids.add(line.strip())

postids = set()
for line in postidsf:
    postids.add(line.strip())

print 'done loading'

def get_rows_to_import(xml_path, required_fields=None):
    parser = lxml.etree.iterparse(xml_path)
    for event, el in parser:
        if event == 'end' and el.tag == 'row':
            attrs = dict(el.items())
            el.clear()
            while el.getprevious() is not None:
                del el.getparent()[0]
            if required_fields and not has_required_fields(attrs, required_fields):
                continue
            yield attrs

def has_required_fields(attrs, required_fields):
    for field in required_fields:
        if field not in attrs:
            return False
    return True

#for vote in get_rows_to_import('Votes.xml', ['CreationDate', 'PostId', 'UserId']):
for vote in get_rows_to_import('Votes.xml', ['PostId', 'UserId']):
    if vote['PostId'] in postids and vote['UserId'] in userids:
        votesf.write(json.dumps(vote) + '\n')


usersf.close()
postidsf.close()
votesf.close()
