import requests

pres_wiki_html = requests.get('https://en.wikipedia.org/wiki/List_of_Presidents_of_the_United_States').text
