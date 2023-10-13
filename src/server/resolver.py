from pydantic import BaseModel
from src.database.db_manager import db

class Resolver:

    def __init__(self, model):
        self.model = model
        pass

    def get(self, object_id: int) -> BaseModel | None:
        res = db.Execute(
            query=f'select * from {self.model.__name__} where id=(?)',
            args=(object_id,)
        )
        return None if not res else self._get_model(res, 0)

    def _get_model(self, res: tuple, offset:int):
        fields = tuple(self.model.__fields__.keys())
        args = {}
        for i in range(0, len(res)):
            args[fields[i + offset]] = res[i]
        return self.model(**args)
