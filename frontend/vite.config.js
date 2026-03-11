import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'
import Icons from 'unplugin-icons/vite'
import IconsResolver from 'unplugin-icons/resolver'
import Components from 'unplugin-vue-components/vite'
// ✅ MUST import from bootstrap-vue-next/resolvers
import { BootstrapVueNextResolver } from 'bootstrap-vue-next/resolvers' 

export default defineConfig({
  plugins: [
    vue(),
    Components({
      resolvers: [
        // ✅ BootstrapVueNext components auto-import
        BootstrapVueNextResolver(), 
        // ✅ Iconify icons auto-import (prefix 'i' means <i-bi-icon-name />)
        IconsResolver({ 
          prefix: 'i', 
          enabledCollections: ['bi'] 
        }),
      ],
      dts: true, // Recommended: generates a components.d.ts for Volar/TypeScript
    }),
    Icons({ 
      autoInstall: true, 
      compiler: 'vue3' 
    }),
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})

