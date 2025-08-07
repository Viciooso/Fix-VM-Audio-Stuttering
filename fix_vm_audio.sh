#!/bin/bash

set -e

echo "🔧 Fixing stuttering audio issue in virtual machines (WirePlumber + PipeWire)..."

# Create WirePlumber config directory
CONFIG_DIR="$HOME/.config/wireplumber/wireplumber.conf.d"
mkdir -p "$CONFIG_DIR"

# Config file path
CONFIG_FILE="$CONFIG_DIR/50-alsa-config.conf"

# Write config content
cat > "$CONFIG_FILE" << 'EOF'
monitor.alsa.rules = [
  {
    matches = [
      {
        node.name = "~alsa_output.*"
      }
    ]
    actions = {
      update-props = {
        api.alsa.period-size = 1024
        api.alsa.headroom = 8192
      }
    }
  }
]
EOF

echo "✅ Configuration file created at: $CONFIG_FILE"

# Restart services
echo "🔁 Restarting PipeWire and WirePlumber..."
systemctl --user restart wireplumber pipewire pipewire-pulse

echo "✅ Services restarted successfully."
echo "ℹ️ If you're using Firefox in the VM, consider disabling the speech-dispatcher as well."
