import { createApp } from 'vue'
import App from './App.vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import '@mdi/font/css/materialdesignicons.css' // Add this line

const app = createApp(App)

document.title = "Iris's Profile"

app.use(Vuetify)

app.mount('#app')