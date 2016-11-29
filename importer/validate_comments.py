import lxml.etree
import json

def get_rows_to_import(xml_path, required_fields=None):
    parser = lxml.etree.iterparse(xml_path)
    for event, el in parser:
        el.clear()
        while el.getprevious() is not None:
            del el.getparent()[0]
	

for comment in get_rows_to_import('Comments.xml', ['CreationDate', 'Text', 'UserId', 'PostId']):
    pass
