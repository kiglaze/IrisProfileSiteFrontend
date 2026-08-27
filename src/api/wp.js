const BASE = process.env.VUE_APP_WP_URL || 'http://localhost:8080'

export async function getPostBySlug(slug) {
    if (!slug) return null

    const url = `${BASE}/wp-json/wp/v2/posts?slug=${encodeURIComponent(slug)}&_embed`

    let res
    try {
        res = await fetch(url, { headers: { Accept: 'application/json' } })
    } catch (e) {
        throw new Error('Could not reach the content server.')
    }

    if (!res.ok) throw new Error(`WordPress returned ${res.status}`)

    const posts = await res.json()

    // The slug filter returns an array, not a bare object.
    return posts[0] || null
}
