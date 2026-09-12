const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  pages: {
    index: {
      entry: 'src/pages/home/main.js',
      template: 'public/home.html',
      filename: 'index.html',
      title: 'Home'
    },
    thesis: {
      entry: 'src/pages/thesis/main.js',
        template: 'public/thesis.html',
        filename: 'thesis.html',
        title: 'Thesis'
      }
  }
})
