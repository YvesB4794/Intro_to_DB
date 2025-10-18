#!/usr/bin/env python3
"""
MySQLServer.py
A simple Python script to create the database 'alx_book_store' if it does not already exist.
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    try:
        # Connect to MySQL Server (without selecting a database)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="icloSS70!"  # <-- replace with your actual MySQL root password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection is not None and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    create_database()

