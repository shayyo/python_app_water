from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host='redis-service', port=6379)


@app.route('/')
def index():
    redis.incr('hits')
    return 'This page has been visited {} times.'.format(redis.get('hits'))
