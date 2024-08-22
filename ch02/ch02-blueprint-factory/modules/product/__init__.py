from flask import Blueprint
import modules
import modules.model.db

product_bp = Blueprint('product_bp', __name__,
    template_folder='pages',
    static_folder='resources', static_url_path='static')


import modules.product.views.product
