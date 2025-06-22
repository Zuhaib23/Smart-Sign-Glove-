
# Smart Sign Glove 🤖🧤

The **Smart Sign Glove** is an assistive wearable technology designed to translate hand gestures (sign language) into readable text and speech. This project uses **Arduino** for sensor data collection and **Python (with K-Nearest Neighbors - KNN)** for gesture classification and translation.

## 🔧 Features

- Real-time gesture recognition using flex sensors
- Arduino-based data acquisition via serial communication
- Python-based machine learning (KNN) for gesture classification
- Converts detected signs into text 
- Lightweight, low-cost, and suitable for education and research purposes



## 🛠 Hardware Requirements

- Arduino Uno or compatible board
- Flex sensors (1 for each finger – 5 recommended)
- Jumper wires, breadboard, resistors
- USB cable for Arduino-to-PC connection
- Glove to mount sensors

## 📡 Software Requirements

- Python 3.7+
- Arduino IDE
- Libraries listed in `requirements.txt`:
  - `scikit-learn`
  - `numpy`
  - `pyserial`
  - `pyttsx3` (for text-to-speech)


Install all Python dependencies with:

```bash
pip install -r requirements.txt
````

## 📥 Data Collection

Run the following script to collect labeled data from Arduino:

```bash
python data_collection/collect_data.py
```

You will be prompted to enter the label (e.g., `A`, `Hello`, `Thanks`) and the script will save the sensor readings for training.

## 🧠 Model Training

After collecting data, train the model using:

```bash
python model/train_model.py
```

This script trains a KNN classifier and saves the model as `model.pkl`.

## ⚡ Real-Time Prediction

To recognize gestures live from the glove:

```bash
python realtime_prediction/predict_gesture.py
```

It will display the predicted sign and optionally speak it aloud using text-to-speech.

## 📷 Demo

!\[Demo GIF or image here if available]

## 📄 License

This project is licensed under the MIT License. See `LICENSE` for more details.

## 🙌 Contributions

Contributions, feature requests, and feedback are welcome! Feel free to fork the repo, open issues, or submit pull requests.

---

### 💬 Contact

For any queries or collaborations:

* GitHub: https://github.com/Zuhaib23
* Email: zohaibrajput0311@gmail.com

```

---

Let me know if you’d like me to generate the license file (`LICENSE`) or the full working Python + Arduino code structure.
```
