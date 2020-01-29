from flask import Flask, render_template, make_response, send_from_directory, send_file, url_for
import json

app = Flask(__name__, static_url_path='', static_folder='static', template_folder='templates')
with open('podcasts.json') as json_file:
    podcasts = json.load(json_file)

@app.route('/<podcast>/rss')
def rss(podcast):
    template =  render_template('base.xml', podcast=podcasts['podcasts'][podcast], baseUrl=podcasts['baseUrl'])
    response = make_response(template)
    response.headers['Content-Type'] = 'application/rss+xml'
    return response