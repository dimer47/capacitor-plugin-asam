import { registerPlugin } from '@capacitor/core';

import type { AsamPlugin } from './definitions';

const Asam = registerPlugin<AsamPlugin>('Asam', {
  web: () => import('./web').then(m => new m.AsamWeb()),
  android: () => import('./android').then(m => new m.AsamAndroid()),
});

export * from './definitions';
export { Asam };
