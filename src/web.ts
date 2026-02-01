import { WebPlugin } from '@capacitor/core';

import type { AsamPlugin } from './definitions';

export class AsamWeb extends WebPlugin implements AsamPlugin {
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  setASAM(_options: { enable: boolean }): Promise<{ success: boolean }> {
    throw this.unavailable('setASAM is not available on web.');
  }

  enableASAM(): Promise<{ success: boolean }> {
    throw this.unavailable('enableASAM is not available on web.');
  }

  disableASAM(): Promise<{ success: boolean }> {
    throw this.unavailable('disableASAM is not available on web.');
  }

  isASAMEnabled(): Promise<{ enabled: boolean }> {
    throw this.unavailable('isASAMEnabled is not available on web.');
  }

  isSupervised(): Promise<{ supervised: boolean }> {
    return Promise.resolve({ supervised: false });
  }
}
