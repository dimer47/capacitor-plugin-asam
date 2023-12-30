# capacitor-plugin-asam

Easily integrate Autonomous Single App Mode in your ios app, allowing it to control Single App Mode sessions for focused, distraction-free user experiences. Ideal for educational, testing, or kiosk applications.

## Install

```bash
npm install capacitor-plugin-asam
npx cap sync
```

## API

<docgen-index>

* [`setASAM(...)`](#setasam)
* [`enableASAM()`](#enableasam)
* [`disableASAM()`](#disableasam)
* [`isASAMEnabled()`](#isasamenabled)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### setASAM(...)

```typescript
setASAM(options: { enable: boolean; }) => Promise<{ success: boolean; }>
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ enable: boolean; }</code> |

**Returns:** <code>Promise&lt;{ success: boolean; }&gt;</code>

--------------------


### enableASAM()

```typescript
enableASAM() => Promise<{ success: boolean; }>
```

**Returns:** <code>Promise&lt;{ success: boolean; }&gt;</code>

--------------------


### disableASAM()

```typescript
disableASAM() => Promise<{ success: boolean; }>
```

**Returns:** <code>Promise&lt;{ success: boolean; }&gt;</code>

--------------------


### isASAMEnabled()

```typescript
isASAMEnabled() => Promise<{ enabled: boolean; }>
```

**Returns:** <code>Promise&lt;{ enabled: boolean; }&gt;</code>

--------------------

</docgen-api>


<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### enableASAM()

```typescript
enableASAM(): Promise<{ success: boolean }>;
```

Enable Autonomous Single App Mode (ASAM) on the device.

**Returns:** <code>Promise&lt;{ success: boolean; }&gt;</code>

--------------------

</docgen-api>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### disableASAM()

```typescript
disableASAM(): Promise<{ success: boolean }>;
```

Disable Autonomous Single App Mode (ASAM) on the device.

**Returns:** <code>Promise&lt;{ success: boolean; }&gt;</code>

--------------------

</docgen-api>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### isASAMEnabled()

```typescript
isASAMEnabled(): Promise<{ enabled: boolean }>;
```

Returns whether Autonomous Single App Mode (ASAM) is enabled on the device.

**Returns:** <code>Promise&lt;{ enabled: boolean; }&gt;</code>

--------------------

</docgen-api>
