export interface AsamPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
