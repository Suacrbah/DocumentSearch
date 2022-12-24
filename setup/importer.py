import meilisearch
import json, os

client = meilisearch.Client('http://localhost:7700', api_key='xcz')

id = 100000
for fn in os.listdir('data/json'):
    with open('data/json/' + fn) as f:
        book = json.load(f)

    chapter_dict = {}
    for para in book:
        chapter, content = para['chapter'], para['text']
        if chapter not in chapter_dict:
            chapter_dict[chapter] = {
                'id': str(id),
                'title': para['source'],
                'chapter': chapter,
                'content': content
            }
            id += 1
        else:
            chapter_dict[chapter]['content'] += '\n' + content

    chapters = [chapter_dict[k] for k in chapter_dict]
    client.index('books').add_documents(chapters)

client.index('books').update_filterable_attributes([
    'title',
])