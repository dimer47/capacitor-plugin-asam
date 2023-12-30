import { WebPlugin } from '@capacitor/core';

import type { AsamPlugin } from './definitions';

export class AsamWeb extends WebPlugin implements AsamPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
