from flask import Flask, send_from_directory
import requests
from main import score
app = Flask(__name__)

UPLOAD_DIRECTORY='/data/'

@app.route('/')
def hello():
    return score()
