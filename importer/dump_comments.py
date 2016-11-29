import lxml.etree
import json

usersf = open('userids.txt', 'rb')
postidsf = open('postids.txt', 'rb')
commentsf = open('comments.txt', 'wb')

userids = set()
for line in usersf:
    userids.add(line.strip())

postids = set()
for line in postidsf:
    postids.add(line.strip())

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

for comment in get_rows_to_import('Comments.xml', ['CreationDate', 'Text', 'UserId', 'PostId']):
    if comment['PostId'] in postids and comment['UserId'] in userids:
        commentsf.write(json.dumps(comment) + '\n')


usersf.close()
postidsf.close()
commentsf.close()
