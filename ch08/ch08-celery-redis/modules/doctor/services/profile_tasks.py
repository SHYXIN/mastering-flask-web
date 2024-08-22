from celery import shared_task
from modules.doctor.repository.doctor import DoctorRepository
from modules.models.config import db_session
from modules.models.db import Doctor
from json import loads, dumps
from asyncio import run
from datetime import date


@shared_task(ignore_result=False)
def add_doctor_task_wrapper(details):
    async def add_doctor_task(details):
        try:
            async with db_session() as sess:
              async with sess.begin(): 
                repo = DoctorRepository(sess)
                details_dict = loads(details)
                print(details_dict)
                doctor = Doctor(**details_dict)
                result = await repo.insert_doctor(doctor)
                if result:
                    return str(True)
                else:
                    return str(False)
        except Exception as e:
            print(e)
            return str(False)
    return run(add_doctor_task(details))

@shared_task(ignore_result=False)
def list_all_doc_task_wrapper():
    async def list_all_doc_task():
      async with db_session() as sess:
        async with sess.begin(): 
            repo = DoctorRepository(sess)
            records = await repo.select_all_doc()
            doc_rec = [rec.to_json() for rec in records]
            return dumps(doc_rec, default=json_date_serializer)
    return run(list_all_doc_task())

def json_date_serializer(obj):
    if isinstance(obj, date):
        return obj.isoformat()
    raise TypeError ("Type %s not serializable" % type(obj))
