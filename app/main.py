from fastapi import FastAPI

from dependencies import get_es_connection

app = FastAPI()
es_client = get_es_connection()


@app.get("/")
def index():
    return {
        "suck":"it!",
        "new": "field"
    }


@app.get("/_indices")
def cat():
    """
    Get a list of available indices
    """
    return es_client.indices.get(index="*")