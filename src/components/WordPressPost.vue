<template>
  <div v-if="post">
    <h2 class="wp-post-title" v-if="includeTitle" v-html="post.title.rendered"></h2>
    <div class="wp-post-content" v-html="post.content.rendered"></div>
  </div>
  <div v-else-if="loading">Loading...</div>
  <div v-else-if="error">{{ error }}</div>
</template>

<script>
import { getPostBySlug } from "@/api/wp";

export default {
  name: "WordPressPost",
  props: {
    slug: {
      type: String,
      default: "education"
    },
    includeTitle: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      post: null,
      loading: true,
      error: null,
    };
  },
  async mounted() {
    try {
      this.post = await getPostBySlug(this.slug);
    } catch (e) {
      this.error = e?.message || String(e);
      console.error(e);
    } finally {
      this.loading = false;
    }
  },
};
</script>

<style scoped>
.wp-post-title {
  color: purple;
}

.wp-post-content {

}
</style>
