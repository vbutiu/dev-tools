## Build requirements

**To build this project**, you need around **16GB** (as it builds on Github workers). Below, you will get some `out of memory` or `node allocation failed`.

## PR Welcome

Especially for UI improvements and translation. And for anything else.

Want to support this fork of IT Tools: [Buy me a coffee](https://www.buymeacoffee.com/vbutiu)

## HTTPS is recommended

Some tools like PGP encryption rely on WebCrypto API that is only available in HTTPS/SSL. Also, if you want to use PWA, HTTPS is required. GitHub Pages serves over HTTPS by default.

### Check out these change here: <https://vbutiu.github.io/dev-tools/>

- github action triggers on every push to `main` - [view workflow here](https://github.com/vbutiu/dev-tools/tree/main/.github/workflows/vbutiu-deploy-github-pages.yml)

(Thanks to [gitmotion](https://github.com/gitmotion/it-tools) for this model of README fork)

## Contributors

Big thanks to all the people who have already contributed!

[![contributors](https://contrib.rocks/image?repo=vbutiu/dev-tools&refresh=1)](https://github.com/vbutiu/dev-tools/graphs/contributors)

## Development under Windows

Use of WSL2 is recommended to develop using VSCode on Windows. Direct development is tricky (because of some dependencies)

## Added features

- Almost [all tools PR, 192 of mine, of original it-tools](https://github.com/CorentinTh/it-tools/pulls)
- 95% of [issues if original it-tools](https://github.com/CorentinTh/it-tools/issues)
- Full UI translation in many language (Google Translated)
- Many [new tools](https://vbutiu.github.io/dev-tools/about)
- Many bug fixes and enhancements

## Deploy to GitHub Pages

This repo is deployed with [.github/workflows/vbutiu-deploy-github-pages.yml](.github/workflows/vbutiu-deploy-github-pages.yml) on every push to `main` (or manually via `workflow_dispatch`).

To deploy your own fork:

1. Enable GitHub Pages build and deployment in **Settings** > **Pages**, and select **GitHub Actions** as the source.
2. Set the repository variable `BASE_URL` (e.g. `/dev-tools/`) under **Settings** > **Secrets and variables** > **Actions** > **Variables**, matching your GitHub Pages subpath.
3. Push to `main` or trigger the workflow manually.

## Customization

You can customize the app at build time by editing files in `public/` before building:

- `public/home.custom.md`: adds custom content to the Home page.
- `public/tools-filter.json`: filters available tools/categories using regex (`excludeCategoryFilterRegex`, `includeCategoryFilterRegex`, `excludeToolsFilterRegex`, `includeToolsFilterRegex`).
- `public/external-tools.json`: adds custom external tools (`href` or `markdownContent`).
- `public/tools-settings.json`: sets default tool parameters and the default UI language (`default_locale`), keyed by `tool name` then `parameter name`, matching the `useQueryParam`/`useITStorage` calls in each tool's source under `src/tools`.



### Recommended IDE Setup

To install VSCode in WSL2 (Windows), see: https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-vscode

[VSCode](https://code.visualstudio.com/) with the following extensions:

- [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur)
- [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).
- [Oxc](https://marketplace.visualstudio.com/items?itemName=oxc.oxc-vscode) (oxlint + oxfmt)
- [i18n Ally](https://marketplace.visualstudio.com/items?itemName=lokalise.i18n-ally)

with the following settings:

```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "oxc.oxc-vscode",
  "editor.codeActionsOnSave": {
    "source.fixAll.oxc": "always"
  },
  "i18n-ally.localesPaths": ["locales", "src/tools/*/locales"],
  "i18n-ally.keystyle": "nested"
}
```

### Type Support for `.vue` Imports in TS

TypeScript cannot handle type information for `.vue` imports by default, so we replace the `tsc` CLI with `vue-tsc` for type checking. In editors, we need [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin) to make the TypeScript language service aware of `.vue` types.

If the standalone TypeScript plugin doesn't feel fast enough to you, Volar has also implemented a [Take Over Mode](https://github.com/johnsoncodehk/volar/discussions/471#discussioncomment-1361669) that is more performant. You can enable it by the following steps:

1. Disable the built-in TypeScript Extension
   1. Run `Extensions: Show Built-in Extensions` from VSCode's command palette
   2. Find `TypeScript and JavaScript Language Features`, right click and select `Disable (Workspace)`
2. Reload the VSCode window by running `Developer: Reload Window` from the command palette.

### Project Setup

```sh
pnpm install --ignore-scripts
```

### Compile and Hot-Reload for Development

```sh
pnpm dev
```

### Type-Check, Compile and Minify for Production

```sh
pnpm build
```

### Run Unit Tests with [Vitest](https://vitest.dev/)

```sh
pnpm test
```

### Lint with [Oxlint](https://oxc.rs/docs/guide/usage/linter)

```sh
pnpm lint
```

### Format with [Oxfmt](https://oxc.rs/docs/guide/usage/formatter)

```sh
pnpm fmt
```

### Ensure CI (lock, oxlint, typecheck) will succeed

Before submitting a PR, run:

```sh
pnpm install --ignore-scripts && pnpm lint:fix && pnpm typecheck
```

### Create a new tool

To create a new tool, there is a script that generate the boilerplate of the new tool, simply run:

```sh
pnpm run script:create:tool my-tool-name
```

It will create a directory in `src/tools` with the correct files. You will need to fill `src/tools/_my-tool-name_/index.ts` with tool name, category, description... and then develop the tool.

## Installation methods

Local installation requires installing first: `python3 make g++`

```bash
sudo apt-get install python3 make g++ && git clone -b main https://github.com/vbutiu/dev-tools.git && cd dev-tools/ && pnpm i --ignore-scripts && pnpm dev
```

<picture>
    <source srcset="./.github/logo-dark.png" media="(prefers-color-scheme: light)">
    <source srcset="./.github/logo-white.png" media="(prefers-color-scheme: dark)">
    <img src="./.github/logo-dark.png" alt="logo">
</picture>

## License

This project is under the [GNU GPLv3](LICENSE).
