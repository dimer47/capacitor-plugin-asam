# 📱 Capacitor Plugin ASAM (Autonomous Single App Mode)

![Release](https://img.shields.io/github/package-json/v/dimer47/capacitor-plugin-asam?color=red&style=flat-square) ![Last update](https://img.shields.io/github/last-commit/dimer47/capacitor-plugin-asam?color=yellow&label=Last%20update&style=flat-square) ![Dependency size](https://img.shields.io/bundlephobia/minzip/capacitor-plugin-asam?color=green&label=dependency%20size&style=flat-square) ![Repo size](https://img.shields.io/github/repo-size/dimer47/capacitor-plugin-asam?style=flat-square) ![Downloads](https://img.shields.io/npm/dt/capacitor-plugin-asam?style=flat-square) ![License](https://img.shields.io/github/license/dimer47/capacitor-plugin-asam?style=flat-square) ![iOS 15+](https://img.shields.io/badge/iOS-15%2B-blue?style=flat-square&logo=apple) ![Capacitor 5+](https://img.shields.io/badge/Capacitor-5%2B-00BFFF?style=flat-square&logo=capacitor)

**⚠️ iOS only** — This plugin uses native iOS APIs and is not available on Android or Web.

Easily integrate **Autonomous Single App Mode** (ASAM) in your iOS app, allowing it to control Single App Mode sessions for focused, distraction-free user experiences. Ideal for educational, testing, or kiosk applications. 🎓🏪

## 🎉 Features

- 🔒 **Enable / Disable** Single App Mode programmatically
- 🔍 **Check** if ASAM is currently enabled
- ⚡ **Async/Await** support — all methods return Promises
- 📦 **Compatible** with Capacitor 5, 6, 7 & 8
- 🍎 **Supports** iOS 15 through iOS 26+

## 📍 Install

```bash
npm install capacitor-plugin-asam
npx cap sync
```

## ⚙️ Configuration

To enable the Autonomous Single App Mode (ASAM) on iOS devices, administrators must utilize a **Mobile Device Management (MDM)** system or **Apple Configurator**.

These tools are essential for setting up and managing ASAM, as they provide the ability to create and deploy specific configuration profiles to iOS devices.

These profiles dictate which applications can run in ASAM, ensuring controlled and secure usage of the devices in environments like schools, businesses, or public kiosks. Without MDM or Apple Configurator, activating ASAM on iOS devices is not feasible.

> 💡 **Tip:** Make sure to allowlist your app's bundle ID in the MDM configuration for Autonomous Single App Mode.

## 🕹️ Usage

```typescript
// import the plugin
import { Asam } from "capacitor-plugin-asam";

// --------------------
// ✅ Enable ASAM using setASAM

let r = await Asam.setASAM({ enable: true });
if (!r.success)
    console.error("Failed to enable ASAM");

let isEnabled = (await Asam.isASAMEnabled()).enabled;
console.log("ASAM is enabled: " + isEnabled);

// --------------------
// ✅ Another way to enable ASAM using enableASAM

r = await Asam.enableASAM();
if (!r.success)
    console.error("Failed to enable ASAM");

isEnabled = (await Asam.isASAMEnabled()).enabled;
console.log("ASAM is enabled: " + isEnabled);

// --------------------
// 🛑 Disable ASAM using disableASAM

r = await Asam.disableASAM();
if (!r.success)
    console.error("Failed to disable ASAM");

isEnabled = (await Asam.isASAMEnabled()).enabled;
console.log("ASAM is enabled: " + isEnabled);

// --------------------
// 🛑 Another way to disable ASAM using setASAM

r = await Asam.setASAM({ enable: false });
if (!r.success)
    console.error("Failed to disable ASAM");
```

## 🧮 API

> 📖 **Full documentation with detailed examples:** [docs/api.md](docs/api.md)

<docgen-index>

* [`setASAM(...)`](#setasam)
* [`enableASAM()`](#enableasam)
* [`disableASAM()`](#disableasam)
* [`isASAMEnabled()`](#isasamenabled)
* [`isSupervised()`](#issupervised)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### setASAM(...)

```typescript
setASAM(options: { enable: boolean; }) => Promise<{ success: boolean; }>
```

Enable or disable Autonomous Single App Mode (ASAM) based on the `enable` parameter.

| Param         | Type                              | Description                                               |
| ------------- | --------------------------------- | --------------------------------------------------------- |
| **`options`** | <code>{ enable: boolean; }</code> | - `enable: true` to activate ASAM, `false` to deactivate. |

**Returns:** <code>Promise&lt;{ success: boolean; }&gt;</code>

--------------------


### enableASAM()

```typescript
enableASAM() => Promise<{ success: boolean; }>
```

Enable Autonomous Single App Mode (ASAM) on the device.
Shortcut for `setASAM({ enable: true })`.

**Returns:** <code>Promise&lt;{ success: boolean; }&gt;</code>

--------------------


### disableASAM()

```typescript
disableASAM() => Promise<{ success: boolean; }>
```

Disable Autonomous Single App Mode (ASAM) on the device.
Shortcut for `setASAM({ enable: false })`.

**Returns:** <code>Promise&lt;{ success: boolean; }&gt;</code>

--------------------


### isASAMEnabled()

```typescript
isASAMEnabled() => Promise<{ enabled: boolean; }>
```

Check whether Autonomous Single App Mode (ASAM) is currently active on the device.

**Returns:** <code>Promise&lt;{ enabled: boolean; }&gt;</code>

--------------------


### isSupervised()

```typescript
isSupervised() => Promise<{ supervised: boolean; }>
```

Check whether the device is in supervised mode.
Only supervised iOS devices can use ASAM.

**Returns:** <code>Promise&lt;{ supervised: boolean; }&gt;</code>

--------------------

</docgen-api>

## 🧪 Testing

```bash
npm test
```

This runs the iOS unit tests via Xcode on the iOS Simulator.

## 🧾 License

[MIT](LICENSE)
