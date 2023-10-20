from .router import Router
from .resolver import Resolver
from src.database.models import *

UserRouter = Router[Users]("user", Resolver[Users]())
PersonalRouter = Router[Personal]("personal", Resolver[Personal]())
BookRouter = Router[Book]("book", Resolver[Book]())
BorrowedRecordRouter = Router[BorrowedRecord]("borrowed_record", Resolver[BorrowedRecord]())
AuthorRouter = Router[Author]("author", Resolver[Author]())
GenreRouter = Router[Genre]("genre", Resolver[Genre]())

routers = (UserRouter.router, PersonalRouter.router, BookRouter.router, BorrowedRecordRouter.router, AuthorRouter.router, GenreRouter.router)
