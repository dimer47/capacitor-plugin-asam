import { WebPlugin } from '@capacitor/core';

import type { AsamPlugin } from './definitions';

export class AsamAndroid extends WebPlugin implements AsamPlugin {
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  setASAM(_options: { enable: boolean }): Promise<{ success: boolean }> {
    throw this.unimplemented('setASAM is not implemented on web.');
  }

  enableASAM(): Promise<{ success: boolean }> {
    throw this.unimplemented('enableASAM is not implemented on web.');
  }

  disableASAM(): Promise<{ success: boolean }> {
    throw this.unimplemented('disableASAM is not implemented on web.');
  }

  isASAMEnabled(): Promise<{ enabled: boolean }> {
    throw this.unimplemented('isASAMEnabled is not implemented on web.');
  }

  isSupervised(): Promise<{ supervised: boolean }> {
    return Promise.resolve({ supervised: false });
  }
}
