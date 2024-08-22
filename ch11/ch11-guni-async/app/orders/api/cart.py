from app.orders import order_bp
from flask import request, jsonify
from app.orders.repository.cart import CartRepository

@order_bp.post("/cart/add")
async def add_cart():
    try:
        cart_json = request.get_json()
        repo = CartRepository()
        result = await repo.insert_cart(cart_json)
        if result == False:
            return jsonify(message="error"), 500
        else:
            return jsonify(record=cart_json)
    except  Exception as e:
        print(e)
    return jsonify(message="error"), 500

@order_bp.get("/cart/list/all")
async def list_all_cart():
    repo = CartRepository()
    result = await repo.select_all_cart()
    return jsonify(records=result)