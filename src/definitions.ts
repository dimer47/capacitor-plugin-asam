export interface AsamPlugin {
  /**
   * Enable or disable Autonomous Single App Mode (ASAM) based on the `enable` parameter.
   *
   * @param options - `enable: true` to activate ASAM, `false` to deactivate.
   * @returns `{ success: true }` if the operation succeeded, `{ success: false }` otherwise.
   */
  setASAM(options: { enable: boolean }): Promise<{ success: boolean }>;

  /**
   * Enable Autonomous Single App Mode (ASAM) on the device.
   * Shortcut for `setASAM({ enable: true })`.
   *
   * @returns `{ success: true }` if ASAM was enabled successfully.
   */
  enableASAM(): Promise<{ success: boolean }>;

  /**
   * Disable Autonomous Single App Mode (ASAM) on the device.
   * Shortcut for `setASAM({ enable: false })`.
   *
   * @returns `{ success: true }` if ASAM was disabled successfully.
   */
  disableASAM(): Promise<{ success: boolean }>;

  /**
   * Check whether Autonomous Single App Mode (ASAM) is currently active on the device.
   *
   * @returns `{ enabled: true }` if ASAM / Guided Access is currently active.
   */
  isASAMEnabled(): Promise<{ enabled: boolean }>;
}
