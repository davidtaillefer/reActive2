import { chromium } from 'playwright';

;(async () => {
  const browser = await chromium.launch();
  const context = await browser.newContext();
  const page = await context.newPage();

  page.on('console', msg => {
    console.log('PAGE_CONSOLE', msg.type(), msg.text());
  });

  page.on('requestfailed', req => {
    try {
      console.log('REQUEST_FAILED', req.url(), req.failure() && req.failure().errorText ? req.failure().errorText : req.failure())
    } catch (e) { console.log('REQUEST_FAILED probe failed', e) }
  });

  page.on('response', resp => {
    try {
      console.log('PAGE_RESPONSE', resp.status(), resp.url())
    } catch (e) { }
  });

  page.on('pageerror', err => {
    console.log('PAGE_ERROR', err.toString());
  });

  try {
    // try the season view which contains a RouteMap instance
    await page.goto('http://localhost:5174/season', { waitUntil: 'networkidle' });
    await page.waitForTimeout(5000);
    // attempt hover simulation on season view map as well
    try {
      const mapEl = await page.$('.map-container')
      if (mapEl) {
        const box = await mapEl.boundingBox()
        if (box) {
          const cx = box.x + box.width / 2
          const cy = box.y + box.height / 2
          await page.mouse.move(cx - 20, cy - 5)
          await page.waitForTimeout(120)
          await page.mouse.move(cx, cy)
          await page.waitForTimeout(250)
          await page.mouse.move(box.x - 50, box.y - 50)
          await page.waitForTimeout(120)
        }
      }
    } catch (e) {
      console.error('HOVER_SIM_ERROR', e && e.message ? e.message : e)
    }
    // also try root and activity later if needed
    await page.goto('http://localhost:5174', { waitUntil: 'networkidle' });
    await page.waitForTimeout(2000);
    await page.screenshot({ path: 'frontend/collect_console_screenshot.png', fullPage: true });

    // Try to simulate mouse movement over the Leaflet map so RouteMap's
    // mousemove handler emits hover events which should trigger chart watchers
    // and the `Chart verticalLine` debug messages.
    try {
      const mapEl = await page.$('.map-container')
      if (mapEl) {
        const box = await mapEl.boundingBox()
        if (box) {
          const cx = box.x + box.width / 2
          const cy = box.y + box.height / 2
          // move in small steps across center to better emulate a real hover
          await page.mouse.move(cx - 40, cy - 10)
          await page.waitForTimeout(150)
          await page.mouse.move(cx - 10, cy)
          await page.waitForTimeout(150)
          await page.mouse.move(cx, cy)
          await page.waitForTimeout(250)
          await page.mouse.move(cx + 10, cy)
          await page.waitForTimeout(150)
          // move out to trigger mouseout
          await page.mouse.move(box.x - 50, box.y - 50)
          await page.waitForTimeout(200)
        }
      }
    } catch (e) {
      console.error('HOVER_SIM_ERROR', e && e.message ? e.message : e)
    }

    // Try to open a specific activity page (where map and charts live together)
    try {
      const activitiesRes = await context.request.get('http://localhost:5000/activities/recent/5')
      if (activitiesRes.ok()) {
        const acts = await activitiesRes.json()
        if (Array.isArray(acts) && acts.length > 0) {
          const aid = acts[0].id || acts[0].activityid || acts[0].activity_id
          if (aid) {
            console.log('NAV_TO_ACTIVITY', aid)
            await page.goto(`http://localhost:5174/activity/${aid}`, { waitUntil: 'networkidle' })
            await page.waitForTimeout(2000)
            try {
              const mapEl2 = await page.$('.map-container')
              if (mapEl2) {
                const box2 = await mapEl2.boundingBox()
                if (box2) {
                  const cx2 = box2.x + box2.width / 2
                  const cy2 = box2.y + box2.height / 2
                  await page.mouse.move(cx2 - 30, cy2 - 10)
                  await page.waitForTimeout(120)
                  await page.mouse.move(cx2, cy2)
                  await page.waitForTimeout(400)
                  await page.mouse.move(cx2 + 20, cy2)
                  await page.waitForTimeout(200)
                  await page.mouse.move(box2.x - 50, box2.y - 50)
                  await page.waitForTimeout(200)
                }
              }
            } catch (e) { console.error('ACTIVITY_HOVER_SIM_ERROR', e && e.message ? e.message : e) }
          }
        }
      }
    } catch (e) { console.error('ACTIVITY_NAV_ERROR', e && e.message ? e.message : e) }
  } catch (e) {
    console.error('NAV_ERROR', e && e.message ? e.message : e);
  } finally {
    await browser.close();
  }

  console.log('CAPTURE_DONE');
})();
