<template>
  <a :href="urlString" target="_blank">
    <svg-icon type="mdi" :path="computedPath"></svg-icon>
  </a>
</template>

<script>
import SvgIcon from '@jamescoyle/vue-icon';
import { mdiLinkedin, mdiGithub } from '@mdi/js';

export default {
  name: "IconAccountLink",
  components: {
    SvgIcon
  },
  props: {
    urlString: {
      type: String,
      default: "https://www.linkedin.com/in/kiglaze/"
    },
    type: {
      type: String,
      default: "linkedin"
    }
  },
  computed: {
    computedPath() {
      switch (this.type) {
        case 'github':
          return mdiGithub;
        case 'linkedin':
        default:
          return mdiLinkedin;
      }
    }
  }
}
</script>