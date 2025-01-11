# Custom ROM Device Tree & HAL Cloning Script for Nothing Phone 2 (Pong)

Welcome to the **Custom ROM Cloning Script** repository! This script simplifies cloning the necessary repositories for building custom ROMs for the Nothing Phone 2, ensuring an efficient and seamless development process.

## Features

- **Device Tree**: Clone the device tree repository for Nothing Phone 2 (Pong).
- **HAL Repositories**: Clone and set up essential Hardware Abstraction Layer (HAL) components, including display, audio, sepolicy, and more.
- **Kernel Repositories**: Get kernel source, modules, and device trees ready for building.
- **Paranoid Glyph**: Include Paranoid Glyph components for customization.
- **Dolby Support**: Clone Dolby hardware repositories for audio enhancements.
- **Customizable Build Metadata**: Option to override `BUILD_USERNAME` and `BUILD_HOSTNAME` for reproducible builds.

## Getting Started

To get started, run the following command in your terminal:

```bash
wget https://raw.githubusercontent.com/Pong-Development/setup_script/refs/heads/main/setup.sh && bash setup.sh
```

### Prerequisites

- A Linux-based development environment.
- Git installed and configured.
- Basic familiarity with custom ROM development.

### How It Works

- The script clones the required repositories for device tree, vendor, kernel, and HALs.
- Allows you to set custom build metadata (`BUILD_USERNAME` and `BUILD_HOSTNAME`).
- Automatically sets up your development directory for ROM building.

## Repository List

Here are the repositories the script clones:

- **Device Tree**: [device\_nothing\_Pong](https://github.com/Pong-Development/device_nothing_Pong)
- **Vendor Tree**: [vendor\_nothing\_Pong](https://github.com/Pong-Development/vendor_nothing_Pong)
- **Kernel Tree**:
  - [kernel\_nothing\_sm8475](https://github.com/Pong-Development/kernel_nothing_sm8475)
  - [kernel\_nothing\_sm8475-modules](https://github.com/Pong-Development/kernel_nothing_sm8475-modules)
  - [kernel\_nothing\_sm8475-devicetrees](https://github.com/Pong-Development/kernel_nothing_sm8475-devicetrees)
- **Display HAL**: [hardware\_qcom-caf\_sm8450\_display](https://github.com/Pong-Development/hardware_qcom-caf_sm8450_display)
- **Audio HAL**:
  - [hardware\_qcom\_audio-ar](https://github.com/Pong-Development/hardware_qcom_audio-ar)
  - [vendor\_qcom\_opensource\_arpal-lx](https://github.com/Pong-Development/vendor_qcom_opensource_arpal-lx)
- **Sepolicy**: [device\_qcom\_sepolicy\_vndr](https://github.com/Pong-Development/device_qcom_sepolicy_vndr)
- **Paranoid Glyph**: [packages\_apps\_ParanoidGlyph](https://github.com/Pong-Development/packages_apps_ParanoidGlyph)
- **Dolby**: [hardware\_dolby](https://github.com/Pong-Development/hardware_dolby)

## Notes

- For **AOSPA-based ROMs**, use the `clo/caf` branch of tree and vendor and default glyph repo.
- If unsure about branches, the script will use defaults compatible with most builds.

---

Feel free to suggest changes or improvements to the repository!

