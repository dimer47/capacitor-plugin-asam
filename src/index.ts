import { registerPlugin } from '@capacitor/core';

import type { AsamPlugin } from './definitions';

const Asam = registerPlugin<AsamPlugin>('Asam', {
  web: () => import('./web').then(m => new m.AsamWeb()),
});

export * from './definitions';
export { Asam };
