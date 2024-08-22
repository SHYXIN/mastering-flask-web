from flask import Blueprint
import modules
import modules.model.db

shipping_bp = Blueprint('shipping_bp', __name__,
    template_folder='pages',
    static_folder='resources', static_url_path='static')


import modules.shipping.views.shipping

