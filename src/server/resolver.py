from typing import Generic, TypeVar
from src.database.models import BaseModelModify
from src.database.db_manager import db

TModel = TypeVar("TModel", bound=BaseModelModify)

class Resolver(Generic[TModel]):

    def get(self, object_id: int) -> TModel:
        res = db.execute(
            query=f'select * from {self.__orig_class__.__args__[0].__name__} where id=(?)',
            args=(object_id,)
        )
        return None if not res else self._get_model(res)

    def create(self, model: dict) -> None:
        name = self.__orig_class__.__args__[0].__name__

        _model: TModel = self._get_model(tuple(model.values()))
        model_fields_amount = len(_model.model_fields)

        fields = list(_model.model_fields.keys())
        del fields[0]

        values = list(_model.model_dump().values())
        del values[0]

        db.execute(
            query=f"insert into {name}({self._array_to_str(fields)}) values({self._get_values_str(model_fields_amount-1)})",
            args=(tuple(values))
        )

    def remove(self, object_id: int) -> None:
        return db.execute(f'delete from {self.__orig_class__.__args__[0].__name__} where id=(?)', args=(object_id,))

    def update(self, object_id: int, new_data: dict) -> None:

        name = self.__orig_class__.__args__[0].__name__

        _model: TModel = self._get_model(tuple(new_data.values()))
        model_fields_amount = len(_model.model_fields)

        fields = list(_model.model_fields.keys())
        del fields[0]

        values = list(_model.model_dump().values())
        del values[0]
        values.append(object_id)

        return db.execute(
            query=f'update {name} set ({self._array_to_str(fields)}) = ({self._get_values_str(model_fields_amount-1)}) where id=(?)',
            args=(tuple(values)))

    def get_all(self) -> list[TModel]:
        res_list = db.execute(query=f"select * from {self.__orig_class__.__args__[0].__name__}", many=True)
        models = []

        if res_list:
            for res in res_list:
                models.append(self._get_model(res))

        return models

    def _get_model(self, res: tuple):
        model = self.__orig_class__.__args__[0]
        fields = tuple(model.model_fields.keys())
        args = {}
        for i in range(0, len(res)):
            args[fields[i]] = res[i]
        return model(**args)

    def _get_values_str(self, amount: int) -> str:
        values: str = "?"
        for i in range(1, amount):
            values += ", ?"
        return values

    def _array_to_str(self, array) -> str:
        return ','.join(map(str, array))
