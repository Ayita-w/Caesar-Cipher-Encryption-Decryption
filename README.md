

🔐 Caesar Cipher Encryption & Decryption (x86 Assembly)

This project implements Caesar Cipher encryption and decryption using x86 Assembly Language with the Irvine32 library.
The program takes user input (text and key), encrypts the data, and then decrypts it back to the original text.

📌 Features

Accepts user input string

Accepts key shift (1–25)

Encrypts data using Caesar Cipher

Decrypts data using inverse key logic

Uses modular Assembly procedures for clean structure

🛠️ Technologies Used

x86 Assembly Language

MASM

Irvine32 Library

Windows OS

📂 Project Structure
.
├── project.asm        # Main assembly source file
└── README.md          # Project documentation

⚙️ How It Works

User enters the data (string)

User enters the key (shift value)

Program encrypts the data using Caesar Cipher

Encrypted data is displayed

Program decrypts the data using inverse logic

Decrypted data is displayed

▶️ How to Run
Prerequisites

MASM installed

Irvine32 library properly configured

Visual Studio (recommended)

Steps

Open Visual Studio

Create a new Win32 Console Project

Add project.asm to the project

Make sure Irvine32.inc, Irvine32.lib, and Irvine32.dll are correctly linked

Build and run the project

🧪 Sample Output
Enter the data: HELLO
Enter the key-shifts(1-25): 3

Encrypted Data: KHOOR
Decrypted Data: HELLO

🧠 Concepts Used

Caesar Cipher algorithm

Assembly procedures (PROC)

Registers & memory addressing

String manipulation

Modular programming in Assembly

📜 License

This project is for educational purposes.
Feel free to use, modify, and learn from it.
