from flask import jsonify, current_app, request
from modules.repository.login import LoginRepository
from modules.models.config import db_session
from modules.models.db import Login
from werkzeug.security import generate_password_hash
from flask_cors import cross_origin


@cross_origin()
@current_app.post('/login/signup')
async def add_signup():
     login_json = request.get_json()
     password = login_json["password"]
     passphrase = generate_password_hash(password)
     async with db_session() as sess:
          async with sess.begin(): 
            repo = LoginRepository(sess)
            login = Login(username=login_json["username"], password=passphrase, role=login_json["role"])
            result = await repo.insert_login(login)
            if result == False:
                return jsonify(message="error in insert"), 201
            return jsonify(record=login_json), 200

       


@current_app.get("/logout")
async def logout():
    return jsonify(record="logged-out user"), 201