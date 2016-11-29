from xml.etree import ElementTree as ET
import json

ret = set()

usersf = open('users.txt', 'w')
votesf = open('votes.txt', 'w')

def get_users_to_import():
    parser = ET.iterparse('Votes.xml')
    for event, el in parser:
        if event == 'end' and el.tag == 'row':
            attrs = dict(el.items())
            if 'UserId' in attrs.keys():
                yield attrs


for vote in get_users_to_import():
    ret.add(vote['UserId'])
    votesf.write(json.dumps(vote) + '\n')


for user_id in ret:
    usersf.write(user_id + '\n')

usersf.close()
votesf.close()
