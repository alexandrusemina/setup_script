#!/bin/bash

# Welcome message
echo "Welcome to the Custom ROM Cloning Script for Nothing Phone 2 (Pong)!"
echo "Happy custom ROM building! 🎉"
echo "Build script by GHOST | ゴースト"

# Define your ROM repository and HAL repository
TREE_REPO_URL="https://github.com/Pong-Development/device_nothing_Pong.git"
VENDOR_REPO_URL="https://github.com/Pong-Development/vendor_nothing_Pong.git"
KERNEL_REPO_URL_GKI="https://github.com/Pong-Development/kernel_nothing_sm8475.git"
KERNEL_MODULE_REPO_URL="https://github.com/Pong-Development/kernel_nothing_sm8475-modules.git"
KERNEL_TREE_REPO_URL="https://github.com/Pong-Development/kernel_nothing_sm8475-devicetrees.git"
DISPLAY_HAL_REPO_URL="https://github.com/Pong-Development/hardware_qcom-caf_sm8450_display.git"
AUDIO_HAL_REPO_URL="https://github.com/Pong-Development/hardware_qcom_audio-ar.git"
AUDIO_PAL_HAL_REPO_URL="https://github.com/Pong-Development/vendor_qcom_opensource_arpal-lx.git"
SEPOLICY_HAL_REPO_URL="https://github.com/Pong-Development/device_qcom_sepolicy_vndr.git"
GLYPH_REPO_URL="https://github.com/Pong-Development/packages_apps_ParanoidGlyph.git"
DOLBY_REPO_URL="https://github.com/Pong-Development/hardware_dolby.git"

# Tree clone
echo "Clone device tree"
echo "clo branch for AOSPA(CLO) or AOSPA based roms, also skip hal and kernel clone aospa dependancy handle this"
echo "Use uclamp branch if rom has caf task_profile changes (ignore if you dont know), must clone uclamp branch display hal also"

# Ask if the user wants to override BUILD_USERNAME and BUILD_HOSTNAME
echo "Override host metadata to make builds more reproducible and avoid leaking info"
read -p "Do you want to override BUILD_USERNAME and BUILD_HOSTNAME (skip if you don't know about this)? (y/n): " OVERRIDE_CHOICE

if [ "$OVERRIDE_CHOICE" == "y" ]; then
    # Prompt user for BUILD_USERNAME and BUILD_HOSTNAME
    read -p "Enter your desired BUILD_USERNAME: " BUILD_USERNAME
    read -p "Enter your desired BUILD_HOSTNAME: " BUILD_HOSTNAME

    # Export the entered BUILD_USERNAME and BUILD_HOSTNAME
    export BUILD_USERNAME="$BUILD_USERNAME"
    export BUILD_HOSTNAME="$BUILD_HOSTNAME"

    echo "BUILD_USERNAME is set to: $BUILD_USERNAME"
    echo "BUILD_HOSTNAME is set to: $BUILD_HOSTNAME"
else
    echo "Using default BUILD_USERNAME and BUILD_HOSTNAME"
fi

# Predefined tree branch names
echo "Cloning device tree"
git clone "$TREE_REPO_URL" device/nothing/Pong
echo "device tree clone done"

# Predefined tree branch names
echo "Cloning device vendor"
git clone "$VENDOR_REPO_URL" vendor/nothing/Pong
echo "device tree vendor done"

# Kernel clone
echo "Cloning kernel tree and module hal"
git clone "$KERNEL_REPO_URL_GKI" kernel/nothing/sm8475
git clone "$KERNEL_MODULE_REPO_URL" kernel/nothing/sm8475-modules
git clone "$KERNEL_TREE_REPO_URL" kernel/nothing/sm8475-devicetrees
echo "Kernel clone done"

# Display hal branches and prompt for selection
echo "Cloning display hal"
rm -rf hardware/qcom-caf/sm8450/display
git clone "$DISPLAY_HAL_REPO_URL" hardware/qcom-caf/sm8450/display
echo "display clone done"

# Audio-pal hal 
echo "Cloning Audio-pal hal"
rm -rf hardware/qcom-caf/sm8450/audio/pal
git clone "$AUDIO_PAL_HAL_REPO_URL" hardware/qcom-caf/sm8450/audio/pal
echo "Audio-pal  hal clone done"

# Audio hal 
echo "Cloning audio hal"
rm -rf hardware/qcom-caf/sm8450/audio/primary-hal
git clone "$AUDIO_HAL_REPO_URL" hardware/qcom-caf/sm8450/audio/primary-hal
echo "Audio hal clone done"

# Sepolicy vndr
echo "Cloning sepolicy vndr"
rm -rf device/qcom/sepolicy_vndr/sm8450
git clone "$SEPOLICY_HAL_REPO_URL" device/qcom/sepolicy_vndr/sm8450
echo "sepolicy vndr clone done"

# Paranoid Glyph
echo "Cloning Paranoid glyph"
rm -rf packages/apps/ParanoidGlyphPhone2
rm -rf packages/apps/ParanoidGlyph
git clone "$GLYPH_REPO_URL" packages/apps/ParanoidGlyphPhone2
echo "Paranoid Glyph clone done"

# Dolby repo
echo "Cloning Dolby"
git clone "$DOLBY_REPO_URL" hardware/dolby
echo "Dolby clone done"

# Clone finished
echo "All repositories cloned successfully! Enjoy building your custom ROM!"

# Remove setup to avoid conflict
echo "Removing setup to avoid issus, you can always clone it again if you want ....kek...."
rm -rf setup.sh
