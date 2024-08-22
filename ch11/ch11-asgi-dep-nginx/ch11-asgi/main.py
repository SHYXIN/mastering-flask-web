from asgiref.wsgi import WsgiToAsgi
from app import create_app
import asyncio 
import platform
import asyncio


if platform.system() == "Windows": 
     asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())

app = create_app('../config_dev.toml')



# This hook ensures that the connection is closed when we've finished
# processing the request.


asgi_app = WsgiToAsgi(app)
# uvicorn main:asgi_app