import serial

# Configure the serial connection
serial_port = 'COM8'  # Replace with your serial port (e.g., COM3, /dev/ttyUSB0)
baud_rate = 9600  # Must match the Arduino's Serial.begin rate
output_file = "Yes.txt"  # Output file to save data

try:
    # Open serial connection
    with serial.Serial(serial_port, baud_rate, timeout=1) as ser:
        print("Connected to Arduino. Waiting for data...")

        with open(output_file, 'w') as file:
            while True:
                # Read a line from the serial port
                raw_line = ser.readline()
                
                # Decode the raw bytes safely
                try:
                    line = raw_line.decode('utf-8').strip()  # Attempt to decode as UTF-8
                    if line:  # Ensure the line is not empty
                        print(line)  # Display in console
                        file.write(line + '\n')  # Save to file
                except UnicodeDecodeError as e:
                    print(f"Decode error: {e}. Skipping this line...")

except serial.SerialException as e:
    print(f"An error occurred: {e}")
finally:
    print("Serial connection closed.")
