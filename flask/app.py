import time

import redis
from flask import Flask

app = Flask(__name__)
res = redis.StrictRedis(host='redis-service', port=6379)

def get_currency_data(date_string):
    retries = 5
    while True:
        try:
            return res.get('1990-01-02_AUD')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1

@app.route('/')
def hello():
    count = get_currency_data()
    return 'Your currency data is {} times.\n'.format(count)
