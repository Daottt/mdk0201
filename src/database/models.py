from datetime import datetime
from typing import Optional
from pydantic import BaseModel

class BaseModelModify(BaseModel):
    id: Optional[int] = None

class Genre(BaseModelModify):
    name: str

class Author(BaseModelModify):
    name: str

class Country(BaseModelModify):
    name: str

class Location(BaseModelModify):
    address: str
    postal_code: str
    country_id: int

class Library(BaseModelModify):
    name: str
    location_id: int

class Job(BaseModelModify):
    name: str

class Book(BaseModelModify):
    name: str
    genre_id: int
    library_id: int
    author_id: int

class Users(BaseModelModify):
    login: str
    password: str

class Personal(Users):
    job_id: int

class BorrowedRecord(BaseModelModify):
    user_id: int
    personal_id: int
    book_id: int
    issue_date: datetime
    return_date: datetime
    is_returned: bool

