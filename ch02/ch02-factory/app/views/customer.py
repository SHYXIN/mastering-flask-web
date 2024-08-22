from flask import render_template, request, current_app
from app.model.db import db ,Customer
from app.repository.customer import CustomerRepository
from app.services.login import get_login_id
from app.exceptions.db import DuplicateRecordException

@current_app.route('/customer/add', methods=['GET', 'POST']) # type: ignore
def add_customer():
    repo = CustomerRepository(db)
    if request.method == 'POST':
        current_app.logger.info('add_customer POST view executed')
        cust = Customer(id=int(request.form['id']), firstname=request.form['firstname'],
                        lastname=request.form['lastname'], middlename=request.form['middlename'],
                        address=request.form['address'], email=request.form['email'],
                        mobile=request.form['mobile'], status=request.form['status'])
        result = repo.insert(cust)
        if result == False:
            raise DuplicateRecordException()
    current_app.logger.info('add_customer GET view executed')
    logins = get_login_id(2, db)
    return render_template('login/customer_details_form.html', logins=logins), 200