export interface AsamPlugin {
  setASAM(options: { enable: boolean }): Promise<{ success: boolean }>;
  enableASAM(): Promise<{ success: boolean }>;
  disableASAM(): Promise<{ success: boolean }>;
  isASAMEnabled(): Promise<{ enabled: boolean }>;
}
