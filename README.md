
# 🧤 Smart Sign Glove

The **Smart Sign Glove** is a low-cost wearable device designed to recognize hand gestures based on finger flexing using flex sensors. It combines **Arduino**, **Python**, and **MATLAB** to train a machine learning model, extract gesture threshold values, and finally embed the logic into Arduino for offline use.

---

## 🧠 System Overview

1. **Data Collection (Python)**  
   Read real-time flex sensor data from Arduino and save labeled samples.

2. **Training & Threshold Extraction (MATLAB)**  
   Use KNN to classify gestures and extract **flex value ranges** (thresholds) for each gesture.

3. **Deployment to Arduino**  
   Hardcode the threshold values for each gesture into Arduino, allowing offline real-time gesture detection without Python or MATLAB.

---

## 🔧 Features

- Collect gesture data using flex sensors and Python
- Classify gestures using MATLAB's KNN algorithm
- Automatically generate threshold ranges for each gesture
- Final Arduino sketch runs independently to recognize gestures in real time

---




---

## 🛠 Hardware Requirements

- Arduino Uno/Nano
- 5x Flex Sensors (one per finger)
- Jumper wires, resistors
- Glove to mount sensors
- USB cable

---

## 💻 Software Requirements

### Arduino IDE
- Upload `glove_threshold_classifier.ino` once thresholds are determined

### Python 3.x
Used for collecting labeled gesture data.

Install dependencies:
```bash
pip install pyserial pandas
````

Run data collection:

```bash
python PythonCodefor_Collecting Data.py
```


---





## 📷 Demo 
![image](https://github.com/user-attachments/assets/07e06436-642c-4cec-b93b-1ffc320ebee3)

![image](https://github.com/user-attachments/assets/a9d1d7e1-958b-4e22-a29e-d6d9393ae989)


![image](https://github.com/user-attachments/assets/ffdd6796-aef1-497c-8c4b-9812920eea77)


## Final product 
![image](https://github.com/user-attachments/assets/72c19680-93cc-4f07-843f-1d23861cd56d)


> 

---

## 📄 License

This project is licensed under the MIT License.

---

## 🙌 Contributions

You can contribute by:

* Adding more gestures and their threshold logic
* Improving data smoothing and filtering
* Making the threshold extraction dynamic or adaptive

---

## 📬 Contact

* GitHub: https://github.com/Zuhaib23
* Email: zohaibrajput0311@gmail.com

```


