import requests
import json
from bottle import route, run, response

BASEURL = 'http://localhost:1026'

@route('/version')
def hello():
    print('Requested /version')
    response.content_type = 'application/json'
    r = requests.get(BASEURL + '/version')
    return r

''' retorna uma lista '''
@route('/entities')
def entities():
    response.content_type = 'application/json'
    print('Requested /entities')
    r = requests.get(BASEURL + '/v2/entities')
    return r

@route('/assaltos')
def assaltos():
    PATH = '/v2/entities/?q=subtype==\'Assalto\'&type=Ocorrencia'
    response.content_type = 'application/json'
    r = requests.get(BASEURL + PATH)
    return r

@route('/homicidios')
def homicidios():
    PATH = '/v2/entities/?q=subtype==\'Homicidio\'&type=Ocorrencia'
    response.content_type = 'application/json'
    r = requests.get(BASEURL + PATH)
    return r

@route('/roubosDeCarros')
def roubosDeCarros():
    PATH = '/v2/entities/?q=subtype==\'RoubosDeCarros\'&type=Ocorrencia'
    response.content_type = 'application/json'
    r = requests.get(BASEURL + PATH)
    return r

@route('/ocorrencias')
def ocorrencias():
    PATH = '/v2/entities/?type=Ocorrencia'
    response.content_type = 'application/json'
    r = requests.get(BASEURL + PATH)
    return r

run(host='localhost', port=8080, debug=True)
