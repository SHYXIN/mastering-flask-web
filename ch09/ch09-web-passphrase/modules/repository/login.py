
from typing import Dict, Any

from sqlalchemy import update, delete, insert, and_, or_
from sqlalchemy.future import select
from sqlalchemy.orm import Session
from modules.models.db import Login, enc_key
from datetime import datetime

class LoginRepository: 
    
    def __init__(self, sess:Session):
        self.sess:Session = sess
    
    async def insert_login(self, login: Login) -> bool: 
        try:
            sql = insert(Login).values(username=login.username, password=login.password, role=login.role)
            await self.sess.execute(sql)
            await self.sess.commit()
            await self.sess.close()
            return True
            #self.sess.add(attendance)
            #await self.sess.flush()
        except Exception as e: 
            print(e)
        return False
    
    async def change_password(self, username:str, passwd:str) -> bool: 
       try:
           sql = update(Login).where(Login.username == username).values(password=passwd)
           await self.sess.execute(sql)
           await self.sess.commit()
           await self.sess.close()
           return True
       except Exception as e: 
           print(e)
       return False
   
    async def delete_login(self, id:int) -> bool: 
        try:
           sql = delete(Login).where(Login.id == id)
           await self.sess.execute(sql)
           await self.sess.commit()
           await self.sess.close()
           return True
        except Exception as e: 
            print(e)
        return False
    
    async def select_all_login(self):
        sql = select(Login)
        sql.execution_options(synchronize_session="fetch")
        q = await self.sess.execute(sql)
        records = q.scalars().all()
        await self.sess.close()
        return records
    
    async def select_login(self, id:int): 
        sql = select(Login).where(Login.id == id)
        sql.execution_options(synchronize_session="fetch")
        q = await self.sess.execute(sql)
        record = q.scalars().all()
        await self.sess.close()
        return record
    
    async def select_all_admin(self): 
        sql = select(Login).where(Login.role == 0)
        sql.execution_options(synchronize_session="fetch")
        q = await self.sess.execute(sql)
        records = q.scalars().all()
        await self.sess.close()
        return records
    
    async def select_all_doctor(self): 
        sql = select(Login).where(Login.role == 1)
        sql.execution_options(synchronize_session="fetch")
        q = await self.sess.execute(sql)
        records = q.scalars().all()
        await self.sess.close()
        return records
    
    async def select_all_patient(self): 
        sql = select(Login).where(Login.role == 2)
        sql.execution_options(synchronize_session="fetch")
        q = await self.sess.execute(sql)
        records = q.scalars().all()
        await self.sess.close()
        return records
    
    async def select_login_username_passwd(self, username:str, password:str): 
        sql = select(Login).where(and_(Login.username == username, Login.password == password))
        sql.execution_options(synchronize_session="fetch")
        q = await self.sess.execute(sql)
        record = q.scalars().all()
        await self.sess.close()
        return record
    