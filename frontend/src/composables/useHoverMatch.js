export function findNearestPoint(data, { timestamp, index } = {}, { toleranceMs = 500 } = {}){
  if (!data || data.length === 0) return null

  // normalize timestamp to number
  const ts = timestamp != null ? (typeof timestamp === 'string' ? new Date(timestamp).getTime() : timestamp) : null

  if (ts != null){
    // binary search for nearest timestamp
    let lo = 0, hi = data.length - 1
    const timeAt = (i) => {
      const t = data[i]?.timestamp
      return t == null ? null : (typeof t === 'string' ? new Date(t).getTime() : t)
    }

    // find insertion point
    while (lo <= hi){
      const mid = Math.floor((lo + hi) / 2)
      const mt = timeAt(mid)
      if (mt == null) break
      if (mt === ts) return { index: mid, point: data[mid] }
      if (mt < ts) lo = mid + 1; else hi = mid - 1
    }

    const cand = []
    if (lo < data.length) cand.push(lo)
    if (hi >= 0) cand.push(hi)
    if (cand.length){
      let best = null
      let bestDiff = Infinity
      for (const i of cand){
        const mt = timeAt(i)
        if (mt == null) continue
        const diff = Math.abs(mt - ts)
        if (diff < bestDiff){ bestDiff = diff; best = i }
      }
      if (best != null && bestDiff <= toleranceMs) return { index: best, point: data[best] }
    }
  }

  if (typeof index === 'number' && index >= 0 && index < data.length) return { index, point: data[index] }

  return null
}
