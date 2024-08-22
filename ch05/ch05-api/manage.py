from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy

from app.model.config import Base
from main import app

db = SQLAlchemy(app, metadata=Base.metadata)
migrate = Migrate(app, db)

# Flask-Migrate still works with SQLAlchemy Async config



