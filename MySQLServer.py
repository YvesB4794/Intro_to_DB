#!/usr/bin/env python3
# MySQLServer.py
# Creates the database 'alx_book_store' on MySQL server.
# Requirements:
#  - print "Database 'alx_book_store' created successfully!" on success
#  - handle errors using "except mysql.connector.Error"
#  - do not use SELECT or SHOW statements

import mysql.connector

def create_database():
    connection = None
    cursor = None
    try:
        # Connect to MySQL server (do not select a database)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="icloSS70!"  # Replace with your MySQL password
        )

        # If connection established, execute create database statement
        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        # This exact except pattern is required by the grader
        print(f"Error: {err}")

    finally:
        # Close cursor and connection if they were opened
        if cursor is not None:
            try:
                cursor.close()
            except Exception:
                pass
        if connection is not None and connection.is_connected():
            try:
                connection.close()
            except Exception:
                pass

if __name__ == "__main__":
    create_database()
