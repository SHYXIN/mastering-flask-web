
from typing import Dict, Any

from sqlalchemy import update, delete, insert, and_, or_
from sqlalchemy.future import select
from sqlalchemy.orm import Session
from modules.models.db import AuthorizationCode, Client
from datetime import datetime
from werkzeug.security import gen_salt

class AuthCodeRepository: 
    
    def __init__(self, sess:Session):
        self.sess:Session = sess
    
    async def insert_code(self, auth: AuthorizationCode) -> bool: 
        try:
            await self.sess.add(auth)
            await self.sess.flush()
            await self.sess.commit()
            await self.sess.close()
            return True
            
        except Exception as e: 
            print(e)
        return False
    
    async def delete_code(self, code:str) -> bool: 
        try:
           sql = delete(AuthorizationCode).where(AuthorizationCode.code == code)
           await self.sess.execute(sql)
           await self.sess.commit()
           await self.sess.close()
           return True
        except Exception as e: 
            print(e)
        return False
    
    async def select_all_code(self):
        sql = select(AuthorizationCode)
        sql.execution_options(synchronize_session="fetch")
        q = await self.sess.execute(sql)
        records = q.scalars().all()
        await self.sess.close()
        return records
    
    async def select_code(self, code:str, client_id:str): 
        sql = select(AuthorizationCode).where(and_(AuthorizationCode.code == code, AuthorizationCode.client_id == client_id))
        sql.execution_options(synchronize_session="fetch")
        q = await self.sess.execute(sql)
        record = q.scalars().all()
        await self.sess.close()
        return record
    
    