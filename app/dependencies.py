from elasticsearch import Elasticsearch
from functools import lru_cache

@lru_cache(maxsize=None)
def get_es_connection():
    """
    Establish an ElasticSearch connection.
    The connection object is stored in memory
    """

    return Elasticsearch("http://localhost:9200")
