#!/bin/bash

# Set the MAC address of the Bluetooth device you want to connect to
device="FC:58:FA:75:D7:5E"

# Check if the device is already paired
if bluetoothctl info "$device" | grep 'Paired: yes' -q; then
    echo "Device already paired"
else
    # Pair with the device
    bluetoothctl pair "$device"
fi

# Check if the device is already trusted
if bluetoothctl info "$device" | grep 'Trusted: yes' -q; then
    echo "Device already trusted"
else
    # Trust the device
    bluetoothctl trust "$device"
fi

# Check if the device is already connected
if bluetoothctl info "$device" | grep 'Connected: yes' -q; then
    echo "Device already connected"
else
    # Connect to the device
    bluetoothctl connect "$device"
fi
