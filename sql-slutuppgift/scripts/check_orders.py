#!/usr/bin/env python3

# Module Imports
import mariadb
import sys

# Connect to MariaDB Platform
try:
    conn = mariadb.connect(
        user="root",
        password="1",
        host="mariadb-server",
        port=3306,
        database="petshop"
    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

# Get Cursor
cur = conn.cursor()

# Allows to take query without value parameter (naked query) or with. (1 or 2 args)
def getResult(*args):
    if len(args) == 2:
        cur.execute(args[0], args[1])
    else:
        cur.execute(args[0])
    return cur.fetchall()

# Setup
warehouse_id = ""
result = None

# Queries
get_warehouses = "SELECT * FROM warehouses"
get_total_orders = "SELECT product_id, sum(qty) \
                    FROM ordered_products JOIN orders USING(order_id) \
                    WHERE order_status LIKE('AWAITING') AND warehouse_id = ? \
                    GROUP BY product_id"
                    
get_total_inventory =  "SELECT product_id, SUM(qty) \
                        FROM inventory \
                        WHERE warehouse_id = ? \
                        GROUP BY product_id"

# Get data
result = getResult(get_warehouses)

print("Available warehouses to check order status")
for row in result:
    print(f"{row[0]}, {row[1]}")

while True:
    raw_input = input("Select #: ")
    try:
        warehouse_id = int(raw_input)
        if warehouse_id in range(1, len(result)+1):
            break
        print("Wrong input, try again.")
    except ValueError:
        print("Input only accepts integers, try again")
        continue

# Get relevant orders and inventory
total_orders = getResult(get_total_orders, [warehouse_id])
total_inventory = getResult(get_total_inventory, [warehouse_id])

print(f"Checking order status for warehouse: {warehouse_id}")

for order_pid, o_qty in total_orders:
    for inventory_pid, i_qty in total_inventory:
        if not order_pid == inventory_pid:
            continue
        delta = i_qty - o_qty
        if delta < 0: # We have less products in inventory than ordered
            print(f"Missing {abs(delta)} of product id {order_pid}")
        break # Match found, next product
            
conn.close()