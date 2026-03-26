# ⚡ Wan2GP Advanced Installer

Get a pro-grade, portable **Wan2GP** environment in minutes. This installer is precision-engineered for **NVIDIA RTX 20XX, 30XX, 40XX and 50XX** series GPUs, leveraging the latest CUDA kernels and specialized attention mechanisms for maximum video generation speed.

⚠️ **Official Version:** This is the original repository from `the3minutenode`. If you are viewing this elsewhere, it is a fork and may not be verified.

[![GitHub Release](https://img.shields.io/github/v/release/the3minutenode/Wan2GP-Advanced-Installer)](https://github.com/the3minutenode/Wan2GP-Advanced-Installer/releases/latest)
[![GitHub Release Date](https://img.shields.io/github/release-date/the3minutenode/Wan2GP-Advanced-Installer)](https://github.com/the3minutenode/Wan2GP-Advanced-Installer/releases/latest)
[![GitHub last commit](https://img.shields.io/github/last-commit/the3minutenode/Wan2GP-Advanced-Installer)](https://github.com/the3minutenode/Wan2GP-Advanced-Installer/releases/latest)
[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/the3minutenode/Wan2GP-Advanced-Installer/total)](https://github.com/the3minutenode/Wan2GP-Advanced-Installer/releases/latest)

[![Discord](https://img.shields.io/discord/1431137394056233030?label=discord&logo=discord&logoColor=white)](https://discord.com/invite/wDn7cj68gm)
[![Static Badge](https://img.shields.io/badge/discord-3400%20total-brightgreen?logo=discord&logoColor=white)](https://discord.com/invite/wDn7cj68gm)
[![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UC8ZKAaWoHYLy58Y6dmypHqg?label=YouTube%20Subscribers)](https://www.youtube.com/@The3MinuteNode)
[![YouTube Channel Views](https://img.shields.io/youtube/channel/views/UC8ZKAaWoHYLy58Y6dmypHqg?label=YouTube%20Views)](https://www.youtube.com/@The3MinuteNode)

**Important Note on Timing:** The installation and environment setup are remarkably fast - typically around **5 minutes**. **HOWEVER**, the first time you run video generation, it will take **MUCH LONGER**. This is because the system must download all the necessary AI models, which can take **15 minutes** or more depending on your internet speed. If it feels stuck, **check the CMD window** for download progress.

## 🎥 What is Wan2GP?
**Wan2GP** is a specialized, high-performance AI video generation suite. While ComfyUI is a versatile "all-in-one" node-based tool, **Wan2GP** is built from the ground up to be a dedicated "Video Engine." 

**Why use this instead of ComfyUI?**
* **Optimized for Video:** It provides a cleaner, more stable implementation for heavy video models like Wan 2.1/2.2 and LTX-Video without workflow complexity.
* **Superior Memory Management:** It often handles VRAM offloading more efficiently than ComfyUI, allowing cards with 12GB–16GB of VRAM to generate longer or higher-resolution clips.
* **All-in-One Features:** Built-in support for specialized tasks and advanced video extending that can be a hassle to set up in custom nodes.

## 🚀 Why use this?

* **GPU Optimized:** Features specialized scripts
  - **RTX 20XX (CUDA 12.6)**
  - **RTX 30XX (CUDA 12.6)**
  - **RTX 40XX, 50XX (CUDA 12.8)**
  - a bleeding-edge version for **RTX 50XX (CUDA 13.0)**
* **Maximum Speed:** Pre-configured with **SageAttention** and **FlashAttention** to significantly reduce render times.
* **Zero Conflict:** A portable "embedded" install. It creates a self-contained environment that won't touch your system Python or global settings.
* **Triton Support:** Includes Triton for Windows, enabling advanced kernels previously difficult to run on PC.

## 🛠️ Quick Start

1.  **Prerequisites:** Ensure you have [Git for Windows](https://git-scm.com/) and [Curl](https://curl.se/) installed.
2.  **Download:** **[Download the Latest Release](https://github.com/the3minutenode/Wan2GP-Advanced-Installer/releases/latest)** Choose the script that matches your hardware.
3.  **Run Installer:** Double-click your chosen `.bat` file. It will automatically download the embedded Python environment, clone the **Wan2GP** repository, and install all dependencies.
4.  **Launch:** Once the setup is complete, a `run.bat` will be generated in the main folder. Double-click `run.bat` to start generating.

## 📦 The Tech Stack

| Feature |  RTX 20XX | RTX 30XX  | RTX 40XX / 50XX  | RTX 50XX (Optimized) |
| :--- | :--- | :--- | :--- | :--- |
| **Python** | 3.10.11 | 3.10.11 | 3.10.11 | 3.11.9 |
| **PyTorch** | 2.6.0 | 2.6.0 | 2.7.1 | 2.10.0 |
| **CUDA** | 12.6 | 12.6 | 12.8 | 13.0 |
| **SageAttention** | 1.0.6 | 2.1.1 | 2.2.0 | 2.2.0 |
| **FlashAttention** | None | None | 2.7.4 | 2.8.3 |
| **Triton** | < v3.3 | < v3.3 | < v3.4 | Latest |

## ⚠️ Requirements

* **OS:** Windows 10/11.
* **GPU:** NVIDIA RTX 20XX, 30XX, 40XX or 50XX series (required for these specific hardware-accelerated kernels).
* **Storage:** Sufficient space for the Python environment and model weights.

## 🆘 Support & Updates

* **Having Issues?** If the script fails or you hit an error, please **[Open an Issue Here](https://github.com/the3minutenode/Wan2GP-Advanced-Installer/issues)** so the community can help.
* **Join the Efficiency Movement:** [YouTube](https://www.youtube.com/@The3MinuteNode) | [Discord](https://discord.gg/wDn7cj68gm) | [Support the Project](https://www.paypal.com/donate/?hosted_button_id=EF3QDPEWK359N)
