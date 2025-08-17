# 🩹 Fix VM Audio Stuttering (WirePlumber + PipeWire)

This script fixes **stuttering or choppy audio** when running Linux inside a virtual machine.  
It increases the ALSA ring buffer size via **WirePlumber** configuration.

---

## 💡 Why this happens

In VMs, emulated audio devices often cause jitter due to small ring buffer sizes.  
This script applies a fix by setting:

- `api.alsa.period-size = 1024`
- `api.alsa.headroom = 8192`

---

## 🚀 How to Use

### Option 1: Clone and Run

```bash
git clone https://github.com/Viciooso/Fix-VM-Audio-Stuttering.git
cd fix-vm-audio
chmod +x fix_vm_audio.sh
./fix_vm_audio.sh
```
### Option 2: Curl
```bash <(curl -s https://raw.githubusercontent.com/Viciooso/Fix-VM-Audio-Stuttering/refs/heads/main/fix_vm_audio.sh)```
