#!/usr/bin/env python3
import mysql.connector

def create_database():
    conn = None
    cur = None
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="icloSS70!"
        )
        if conn.is_connected():
            cur = conn.cursor()
            cur.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        if cur is not None:
            try:
                cur.close()
            except Exception:
                pass
        if conn is not None and conn.is_connected():
            try:
                conn.close()
            except Exception:
                pass

if __name__ == "__main__":
    create_database()
