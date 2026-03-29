<template>
  <BContainer class="py-4">
    <BCard v-if="form" class="shadow-sm">
      <template #header>
        <div class="d-flex justify-content-between align-items-center">
          <h4 class="mb-0">Edit Activity: {{ form.name }}</h4>
          <span class="text-muted small">ID: {{ form.id }} | File: {{ form.hrmfile }}</span>
        </div>
      </template>

      <BForm @submit.prevent="saveActivity">
        <!-- Basic Info Section -->
        <h5 class="border-bottom pb-2 mb-3">General Information</h5>
        <BRow class="g-3 mb-4">
          <BCol cols="12" md="6">
            <BFormGroup label="Activity Name">
              <BFormInput v-model="form.name" />
            </BFormGroup>
          </BCol>
          <BCol cols="12" md="4">
            <BFormGroup label="Date">
              <BFormInput v-model="form.date" type="datetime-local" />
            </BFormGroup>
          </BCol>
          <BCol cols="12" md="2">
            <!-- Ensure lowercase 'tzoffset' -->
            <BFormGroup label="TZ Offset">
              <BFormInput v-model.number="form.offset" type="number" step="0.5" />
            </BFormGroup>
          </BCol>
        </BRow>

        <!-- Categorization -->
        <BRow class="g-3 mb-4">
          <BCol cols="12" md="4">
            <BFormGroup label="Sport">
              <BFormSelect v-model="form.sport" :options="sportOptions" />
            </BFormGroup>
          </BCol>
          <BCol cols="12" md="4">
            <BFormGroup label="Subsport">
              <BFormSelect v-model="form.subsport" :options="subsportOptions" />
            </BFormGroup>
          </BCol>
          <BCol cols="12" md="4">
            <BFormGroup label="Equipment">
              <BFormSelect v-model="form.equipment" :options="equipmentOptions" />
            </BFormGroup>
          </BCol>
        </BRow>

        <!-- Core Metrics -->
        <h5 class="border-bottom pb-2 mb-3">Performance Metrics</h5>
        <BRow class="g-3 mb-4">
          <BCol cols="6" md="3">
            <BFormGroup label="Distance (km)">
              <BFormInput v-model.number="form.distance" type="number" step="0.01" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="3">
            <BFormGroup label="Duration (sec)">
              <BFormInput v-model.number="form.duration" type="number" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="3">
            <BFormGroup label="Avg Speed (km/h)">
              <BFormInput v-model.number="form.avgspeed" type="number" step="0.1" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="3">
            <BFormGroup label="Calories">
              <BFormInput v-model.number="form.calories" type="number" />
            </BFormGroup>
          </BCol>
        </BRow>

        <!-- Technical Stats -->
        <BRow class="g-3 mb-4">
          <BCol cols="6" md="2">
            <BFormGroup label="Avg HR">
              <BFormInput v-model.number="form.heartrate" type="number" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="2">
            <BFormGroup label="Avg Power">
              <BFormInput v-model.number="form.avgpower" type="number" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="2">
            <BFormGroup label="Avg Cadence">
              <BFormInput v-model.number="form.avgcadence" type="number" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="2">
            <BFormGroup label="Ascent (m)">
              <BFormInput v-model.number="form.ascent" type="number" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="6">
            <!-- Ensure lowercase 'device' -->
            <BFormGroup label="Device">
              <BFormInput v-model="form.device" />
            </BFormGroup>
          </BCol>
        </BRow>

        <!-- Training Load & Effect -->
        <h5 class="border-bottom pb-2 mb-3">Training Load & Effect</h5>
        <BRow class="g-3 mb-4">
          <BCol cols="6" md="2">
            <BFormGroup label="Load">
              <BFormInput v-model.number="form.training_load" type="number" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="2">
            <BFormGroup label="ATE (Aerobic)">
              <BFormInput v-model.number="form.ate" type="number" step="0.1" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="3">
            <!-- Ensure lowercase 'ante' -->
            <BFormGroup label="ANTE">
              <BFormInput v-model.number="form.ante" type="number" step="0.1" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="3">
            <BFormGroup label="Intensity">
              <BFormSelect v-model="form.intensity" :options="intensityOptions" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="2">
            <BFormGroup label="Feel (1-100)">
              <BFormInput v-model.number="form.workout_feel" type="number" />
            </BFormGroup>
          </BCol>
          <BCol cols="6" md="2">
            <BFormGroup label="RPE (1-100)">
              <BFormInput v-model.number="form.workout_rpe" type="number" />
            </BFormGroup>
          </BCol>
        </BRow>

        <BFormGroup label="Comments">
          <BFormTextarea v-model="form.comments" rows="3" />
        </BFormGroup>

        <div class="mt-4 d-flex gap-2">
          <BButton type="submit" variant="primary" :disabled="isSaving">
            <BSpinner v-if="isSaving" small class="me-1" /> Save Changes
          </BButton>
          <BButton variant="outline-secondary" @click="$router.back()">Cancel</BButton>
        </div>
      </BForm>
    </BCard>
  </BContainer>
</template>

<script setup lang="ts">
import { ref, onMounted, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';

const route = useRoute();
const router = useRouter();
const apiBaseUrl = import.meta.env.VITE_API_BASE_URL;

const form = ref<any>(null);
const isSaving = ref(false);

const sportOptions = ref([]);
const subsportOptions = ref([]);
const equipmentOptions = ref([]);
const intensityOptions = [
  { value: '1', text: '1: Recovery' },
  { value: '2', text: '2: Base' },
  { value: '3', text: '3: Tempo' },
  { value: '4', text: '4: Sprint' }
];

// Reusable fetchers for the cascading selects
const updateCascadingOptions = async (sportId: number) => {
  try {
    const [ssRes, eqRes] = await Promise.all([
      fetch(`${apiBaseUrl}subsport/${sportId}`),
      fetch(`${apiBaseUrl}equipment/${sportId}`)
    ]);

    const ssData = await ssRes.json();
    const eqData = await eqRes.json();

    subsportOptions.value = ssData.map((ss: any) => ({ value: ss.id, text: ss.name }));
    equipmentOptions.value = eqData.map((e: any) => ({ value: e.id, text: e.name }));
  } catch (err) {
    console.error('Error fetching cascading options:', err);
  }
};

const fetchData = async () => {
  try {
    // 1. Initial Meta Fetch (Sports)
    const sportRes = await fetch(`${apiBaseUrl}sports`);
    const sports = await sportRes.json();
    sportOptions.value = sports.map((s: any) => ({ value: s.id, text: s.name }));

    // 2. Fetch Activity Data
    const actRes = await fetch(`${apiBaseUrl}activities/${route.params.id}`);
    const data = await actRes.json();

    // Normalize date for input
    if (data.date) {
      const d = new Date(data.date);
      data.date = new Date(d.getTime() - d.getTimezoneOffset() * 60000).toISOString().slice(0, 16);
    }

    form.value = data;

    // 3. Initial load of Subsport/Equipment based on current activity sport
    if (data.sport) {
      await updateCascadingOptions(data.sport);
    }
  } catch (err) {
    console.error('Fetch error:', err);
  }
};

watch(() => form.value?.sport, (newSportId) => {
  if (newSportId) {
    // Reset selections if the sport changes
    form.value.subsport = null;
    form.value.equipment = null;
    updateCascadingOptions(newSportId);
  }
});

const saveActivity = async () => {
  isSaving.value = true;
  const payload = { ...form.value };
  if (payload.date) payload.date = new Date(payload.date).toISOString();

  try {
    const res = await fetch(`${apiBaseUrl}activities/${route.params.id}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    });
    if (res.ok) router.push({ name: 'activity', params: { id: route.params.id } });
  } catch (err) {
    alert('Failed to update activity.');
  } finally {
    isSaving.value = false;
  }
};

onMounted(fetchData);
</script>
