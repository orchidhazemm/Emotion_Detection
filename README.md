# 🎭 Emotion_Detection

**Detect emotions from speech, text, and video — then fuse them.**  
A deep learning pipeline for **multimodal emotion recognition** using the RAVDESS and Go Emotions datasets.

---

## ✨ What's inside

| Modality | What we do | Highlight result |
|----------|------------|-------------------|
| **🎤 Audio** | MFCC + pitch/intensity from RAVDESS speech | **~80%** validation accuracy |
| **📝 Text** | Go Emotions (54K+ samples) → 3-class (happy/sad/neutral) | **75%** test accuracy |
| **🎬 Video** | RAVDESS emotional speech video → frame-based CNN | **~84%** test accuracy, **87%** validation peak |
| **🔀 Multimodal** | Fuse text + audio + video with a transformer encoder | **~39–43%** (fusion baseline; room to grow with better alignment) |

Models are trained for **happy**, **sad**, and **neutral** across modalities, then combined in the Multimodal module for joint prediction.

---

## 📁 Repo structure

```
deeplearning/
├── Audio/          # RAVDESS audio, MFCC features, spectrograms
├── Text/           # Go Emotions processing, BERT-style inputs
├── Video/          # RAVDESS video, frame extraction, CNN
└── Multimodal/     # Fused text+audio+video model & training
```

Each folder contains Jupyter notebooks for data prep, training, and evaluation.

---

## 🚀 Quick start

1. **Clone**
   ```bash
   git clone https://github.com/orchidhazemm/Emotion_Detection.git
   cd Emotion_Detection
   ```

2. **Data**
   - **Audio / Video:** RAVDESS from Kaggle (`uwrfkaggler/ravdess-emotional-speech-audio`, `adrivg/ravdess-emotional-speech-video`) — see notebooks for `kagglehub` usage.
   - **Text:** Go Emotions via Hugging Face `datasets`: `AlexOrtzx/go_emotions_max_500` (notebook has the flow).

3. **Run**
   - Open `deeplearning/Audio/Audio.ipynb`, `Text/Text.ipynb`, `Video/video.ipynb`, or `Multimodal/multimodal.ipynb`.
   - Install deps (e.g. `torch`, `pandas`, `scikit-learn`, `transformers`/`datasets` as in the notebooks).

---

## 📊 Results snapshot (from the notebooks)

- **Video (3 epochs):** Train accuracy **79.96%**, validation **87.20%**, test **83.84%**.
- **Text (3 epochs):** Test accuracy **75%**, test loss **0.67**.
- **Audio (30 epochs):** Validation accuracy reaches **~80%**.
- **Multimodal:** Fused model reports **~39–43%** accuracy on the combined setup (early baseline).

---

## 📜 License & attribution

- **RAVDESS:** [Kaggle RAVDESS Emotional Speech Audio](https://www.kaggle.com/datasets/uwrfkaggler/ravdess-emotional-speech-audio), [RAVDESS Emotional Speech Video](https://www.kaggle.com/datasets/adrivg/ravdess-emotional-speech-video).
- **Go Emotions:** [Hugging Face / Google](https://huggingface.co/datasets/AlexOrtzx/go_emotions_max_500).

---

*Built for multimodal emotion detection — from voice, words, and face.*
