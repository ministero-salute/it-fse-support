import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

const site = "https://vincenzo-ingenito.github.io";

// https://astro.build/config
export default defineConfig({
	site,
	base: "/it-fse-support",
	trailingSlash: 'never',
	outDir: "./../../docs",
	integrations: [
		starlight({
			title: 'FSE2.0',
			defaultLocale: 'it',
			sidebar: [
				{
					label: 'Indice',
					items: [
						// Each item here is one entry in the navigation menu.
						{ label: 'Crashprogram', link: '/crashprogram' },
					],
				}
			],
			defaultLocale: "root",
			pagination: true,
			lastUpdated: true,
		}),
	],
});
