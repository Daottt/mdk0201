from fastapi import APIRouter
from .resolver import Resolver
from src.database.models import BaseModel

class Router:

    def __init__(self, name, resolver: Resolver):
        self.name = name
        self.resolver = resolver

        self.router = APIRouter(prefix=f'/{name}', tags=[name])
        self.addEndpoints()

    def addEndpoints(self):
        self.router.add_api_route('/{object_id}', self.get, methods=["get"])
        #self.router.add_api_route('/create', self.create, methods=["post"])

    def get(self, object_id: int):
        return self.resolver.get(object_id)

    #def create(self, model: dict):
        #new_id = self.resolver.create(model)
        #return f'{{code: 201, id: {new_id}}}'
