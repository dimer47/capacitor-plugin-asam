# 📖 API Documentation — capacitor-plugin-asam

Complete reference for all methods available in the ASAM (Autonomous Single App Mode) Capacitor plugin.

> **⚠️ iOS only** — All methods throw `unavailable` on Web and `unimplemented` on Android.

---

## 📦 Import

```typescript
import { Asam } from "capacitor-plugin-asam";
```

---

## 📋 Methods Overview

| Method | Description | Returns |
| --- | --- | --- |
| [`setASAM(options)`](#-setasamoptions) | Enable or disable ASAM | `Promise<{ success: boolean }>` |
| [`enableASAM()`](#-enableasam) | Enable ASAM | `Promise<{ success: boolean }>` |
| [`disableASAM()`](#-disableasam) | Disable ASAM | `Promise<{ success: boolean }>` |
| [`isASAMEnabled()`](#-isasamenabled) | Check if ASAM is active | `Promise<{ enabled: boolean }>` |

---

## 🔧 setASAM(options)

Enable or disable Autonomous Single App Mode based on the `enable` parameter.

### Signature

```typescript
setASAM(options: { enable: boolean }): Promise<{ success: boolean }>
```

### Parameters

| Parameter | Type | Required | Description |
| --- | --- | --- | --- |
| `options.enable` | `boolean` | ✅ | `true` to enable ASAM, `false` to disable |

### Returns

| Property | Type | Description |
| --- | --- | --- |
| `success` | `boolean` | `true` if the operation succeeded, `false` otherwise |

### Example

```typescript
import { Asam } from "capacitor-plugin-asam";

// ✅ Enable ASAM
const result = await Asam.setASAM({ enable: true });
if (result.success) {
  console.log("ASAM enabled successfully");
} else {
  console.error("Failed to enable ASAM — is the device supervised via MDM?");
}

// 🛑 Disable ASAM
const result2 = await Asam.setASAM({ enable: false });
if (result2.success) {
  console.log("ASAM disabled successfully");
}
```

### Notes

- If `enable` is not provided, it defaults to `false`.
- This method will always return `{ success: false }` if the device is **not supervised** by MDM or Apple Configurator.

---

## ✅ enableASAM()

Shortcut to enable Autonomous Single App Mode. Equivalent to `setASAM({ enable: true })`.

### Signature

```typescript
enableASAM(): Promise<{ success: boolean }>
```

### Parameters

None.

### Returns

| Property | Type | Description |
| --- | --- | --- |
| `success` | `boolean` | `true` if ASAM was enabled successfully |

### Example

```typescript
import { Asam } from "capacitor-plugin-asam";

const { success } = await Asam.enableASAM();
if (success) {
  console.log("ASAM is now active — the user cannot leave the app");
} else {
  console.error("Failed to enable ASAM");
}
```

---

## 🛑 disableASAM()

Shortcut to disable Autonomous Single App Mode. Equivalent to `setASAM({ enable: false })`.

### Signature

```typescript
disableASAM(): Promise<{ success: boolean }>
```

### Parameters

None.

### Returns

| Property | Type | Description |
| --- | --- | --- |
| `success` | `boolean` | `true` if ASAM was disabled successfully |

### Example

```typescript
import { Asam } from "capacitor-plugin-asam";

const { success } = await Asam.disableASAM();
if (success) {
  console.log("ASAM disabled — the user can now leave the app");
} else {
  console.error("Failed to disable ASAM");
}
```

---

## 🔍 isASAMEnabled()

Check whether Autonomous Single App Mode (Guided Access) is currently active on the device.

### Signature

```typescript
isASAMEnabled(): Promise<{ enabled: boolean }>
```

### Parameters

None.

### Returns

| Property | Type | Description |
| --- | --- | --- |
| `enabled` | `boolean` | `true` if ASAM / Guided Access is currently active |

### Example

```typescript
import { Asam } from "capacitor-plugin-asam";

const { enabled } = await Asam.isASAMEnabled();
console.log(`ASAM is currently ${enabled ? "enabled" : "disabled"}`);
```

---

## 🔄 Full Usage Example

A complete example showing a typical enable → check → disable flow:

```typescript
import { Asam } from "capacitor-plugin-asam";

async function startExam() {
  // 🔒 Lock the device into ASAM
  const { success } = await Asam.enableASAM();
  if (!success) {
    alert("Cannot lock device. Please ensure MDM is configured.");
    return;
  }

  // ✅ Verify it's enabled
  const { enabled } = await Asam.isASAMEnabled();
  console.log("Exam mode active:", enabled);
}

async function endExam() {
  // 🔓 Release the device from ASAM
  const { success } = await Asam.disableASAM();
  if (success) {
    console.log("Exam mode ended. Device unlocked.");
  }
}
```

---

## ⚠️ Prerequisites & Troubleshooting

### MDM Supervision Required

All ASAM methods require the device to be **supervised** via:
- **MDM** (Mobile Device Management) — Jamf, Mosyle, Hexnode, etc.
- **Apple Configurator**

Without supervision, `setASAM`, `enableASAM`, and `disableASAM` will always return `{ success: false }`.

### Allowlist Your App

Your app's **bundle ID** must be allowlisted for Autonomous Single App Mode in the MDM configuration profile. Without this, the system will reject the request.

### Platform Support

| Platform | Status |
| --- | --- |
| 🍎 iOS 15+ | ✅ Fully supported |
| 🌐 Web | ❌ Throws `unavailable` |
| 🤖 Android | ❌ Throws `unimplemented` |

### Common Issues

| Issue | Cause | Solution |
| --- | --- | --- |
| `success` is always `false` | Device not supervised | Configure MDM supervision |
| `success` is always `false` | App not allowlisted | Add bundle ID to ASAM config profile |
| Plugin not found | Missing `npx cap sync` | Run `npx cap sync` after install |
