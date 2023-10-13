from .router import Router
from .resolver import Resolver
from src.database.models import *

UserRouter = Router("user", Resolver(Users))
PersonalRouter = Router("personal", Resolver(Personal))
BookRouter = Router("book", Resolver(Book))
BorrowedRecordRouter = Router("borrowed_record", Resolver(BorrowedRecord))
AuthorRouter = Router("author", Resolver(Author))
GenreRouter = Router("genre", Resolver(Genre))

routers = (UserRouter.router, PersonalRouter.router, BookRouter.router, BorrowedRecordRouter.router, AuthorRouter.router, GenreRouter.router)
