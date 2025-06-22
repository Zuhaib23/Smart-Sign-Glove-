
# Smart Sign Glove 🤖🧤

The **Smart Sign Glove** is a low-cost wearable system designed to translate hand gestures (sign language) into readable text and voice. It uses **flex sensors** connected to an **Arduino** for gesture data acquisition and performs gesture classification using **K-Nearest Neighbors (KNN)** implemented in **MATLAB**.

---

## 🔧 Features

- Real-time sign detection using finger-bend (flex) sensors
- Arduino-based data acquisition over serial
- MATLAB-based machine learning using the KNN algorithm
- Converts recognized gestures into text (and optionally into speech)
- Extendable to full alphabets, digits, or common sign words

---



---

## 🛠 Hardware Requirements

- Arduino Uno (or any compatible board)
- 5x Flex sensors (one per finger)
- Jumper wires, resistors, breadboard
- USB cable (for Arduino-PC connection)
- A glove (to mount sensors)

---

## 📡 Software Requirements

- **Arduino IDE** (for uploading code)
- **MATLAB** (R2018a or later recommended)
- Instrument Control Toolbox (for serial communication)

---

## 📥 Data Collection (Using MATLAB)

1. Upload the `glove_sensor.ino` code to your Arduino.
2. Open `data_collection.m` in MATLAB.
3. It will:
   - Connect to the COM port
   - Read real-time flex sensor values from Arduino
   - Prompt for a gesture label
   - Store and save labeled data in `gesture_dataset.mat`

```matlab
% In MATLAB
data_collection
````

---

## 🧠 KNN Model Training (MATLAB)

Once data is collected:

```matlab
knn_train
```

* Trains a KNN model on the recorded gestures
* Saves the trained model for prediction

---

## ⚡ Real-Time Prediction

To test the glove in real-time using the trained model:

```matlab
knn_predict
```

This script:

* Reads live sensor values from Arduino
* Predicts gesture label using trained KNN model
* Displays the result in the MATLAB console

---

## 📷 Demo 

![image](https://github.com/user-attachments/assets/bf947644-3764-4455-88d7-81026f61c110)

![image](https://github.com/user-attachments/assets/308e0e32-0168-44f0-a26f-0a54f6f7d5c7)

![image](https://github.com/user-attachments/assets/ea55bdd6-37ce-466c-93d6-470bafe4b6db)


## Final Product
![image](https://github.com/user-attachments/assets/71c9890e-6e51-4b81-84a7-b7326e96a7b9)




---

## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for more information.

---

## 🙌 Contributions

Want to help improve this project? Feel free to fork, submit pull requests, or open issues.

---

### 📬 Contact

* GitHub: https://github.com/Zuhaib23
* Email: zohaibrajput0311@gmail.com

```


