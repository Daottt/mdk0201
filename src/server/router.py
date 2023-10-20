from typing import Generic, Any
from .resolver import Resolver, TModel
from fastapi import APIRouter
from src.database.models import BaseModelModify

class Router(Generic[TModel]):
    resolver: Resolver[TModel]

    def __init__(self, name, resolver: Resolver[TModel]):
        self.name = name
        self.resolver = resolver

        self.router = APIRouter(prefix=f'/{name}', tags=[name])
        self.addEndpoints()

    def addEndpoints(self):
        self.router.add_api_route('/id', self.get, methods=["get"])
        self.router.add_api_route('/create', self.create, methods=["post"])
        self.router.add_api_route('/update', self.update, methods=["put"])
        self.router.add_api_route('/update', self.delete, methods=["delete"])
        self.router.add_api_route('/', self.get_all, methods=["get"])

    def get(self, object_id: int):
        return self.resolver.get(object_id)

    def create(self, model: dict[str, Any]):
        self.resolver.create(model)

    def delete(self, object_id: int):
        return self.resolver.remove(object_id)

    def update(self, object_id: int, new_data: dict[str, Any]):
        return self.resolver.update(object_id=object_id, new_data=new_data)

    def get_all(self):
        return self.resolver.get_all()
