<template>
  <div class="bg-light">

    <!-- Upload Section -->
    <div class="container py-4" style="max-width: 900px;">
      <div class="card shadow-sm">
        <div class="card-body p-4">

          <!-- Header -->
          <div class="d-flex align-items-center gap-3 mb-4">
            <IBiupload class="text-purple fs-4" />
            <h2 class="mb-0">Upload Activity</h2>
          </div>

          <!-- Upload UI -->
          <div v-if="activities.length === 0">

            <div
              class="upload-zone"
              :class="{ 'drag-active': dragActive }"
              @dragenter.prevent="handleDrag"
              @dragleave.prevent="handleDrag"
              @dragover.prevent="handleDrag"
              @drop.prevent="handleDrop"
            >
              <i
                class="bi bi-upload"
                :class="dragActive ? 'text-primary' : 'text-muted'"
                style="font-size: 4rem;"
              />
              <h5 class="mt-3 mb-2">Drop your activity files here</h5>
              <p class="text-muted mb-3">Supports .gpx, .fit, .tcx files</p>

              <label class="btn btn-primary">
                Browse Files
                <input
                  type="file"
                  class="d-none"
                  multiple
                  accept=".gpx,.fit,.tcx"
                  @change="handleFileInput"
                />
              </label>
            </div>

            <!-- Formats -->
            <div class="row g-3 mt-3">
              <FormatCard title=".GPX" text="GPS Exchange Format" colour="primary" />
              <FormatCard title=".FIT" text="Garmin Activity" colour="success" />
              <FormatCard title=".TCX" text="Training Center XML" colour="purple" />
            </div>

          </div>
        </div>
      </div>
    </div>

    <!-- Activities Editor -->
    <div v-if="activities.length > 0" class="container-fluid pb-4">

      <div class="card shadow-sm">
        <div class="card-body">

          <!-- Header -->
          <div class="d-flex justify-content-between align-items-center mb-3">
            <h5>Edit Uploaded Activities</h5>

            <button
              class="btn btn-success d-flex align-items-center gap-2"
              @click="saveAllActivities"
              :disabled="isSaving || !isFormValid"
            >
              <div v-if="isSaving" class="spinner-border spinner-border-sm" />
              <IBiCloudArrowUpFill v-else />
              {{ isSaving ? 'Saving...' : 'Save All to Database' }}
            </button>
          </div>

          <!-- Activity Cards -->
          <div
            v-for="(act, index) in activities"
            :key="index"
            class="card border-primary mb-3"
          >
            <div class="card-header bg-primary text-white">
              File: {{ act.hrmfile }}
            </div>

            <div class="card-body overflow-auto p-3">

              <div class="d-flex gap-3" style="min-width: 1200px;">

                <!-- Example Fields (repeat pattern) -->
                <Field label="Name">
                  <BFormInput v-model="act.name" size="sm" />
                </Field>

                <Field label="Date">
                  <BFormInput v-model="act.date" size="sm" />
                </Field>

                <Field label="Sport">
                  <BFormSelect v-model="act.sport" size="sm" @change="handleSportChange(act)">
                    <option :value="null">-- Select Sport --</option>
                    <option v-for="s in sports" :key="s.id" :value="s.id">
                      {{ s.name }}
                    </option>
                  </BFormSelect>
                </Field>

                <Field label="Subsport">
                  <BFormSelect
                    v-model="act.subsport"
                    size="sm"
                    :disabled="!act.subsportOptions.length"
                  >
                    <option :value="null">-- Select Subsport --</option>
                    <option v-for="ss in act.subsportOptions" :key="ss.id" :value="ss.id">
                      {{ ss.name }}
                    </option>
                  </BFormSelect>
                </Field>

                <Field label="Duration">
                  <BFormInput type="text" size="sm"
                    :state="/^(\d{1,2}):(\d{1,2}):(\d{1,2})$/.test(secondsToHMS(act.duration))"
                    :value="secondsToHMS(act.duration)"
                    @blur="act.duration = hmsToSeconds($event.target.value, act.duration)" />
                </Field>

                <Field label="Intensity">
                  <select v-model="act.intensity" class="form-select form-select-sm">
                    <option :value="null">-- Optional --</option>
                    <option :value="1">Recovery</option>
                    <option :value="2">Base</option>
                    <option :value="3">Tempo</option>
                    <option :value="5">Threshold</option>
                    <option :value="6">VO2 Max</option>
                    <option :value="7">Anaerobic</option>
                    <option :value="4">Sprint</option>
                  </select>
                </Field>

                <Field label="Distance">
                  <BFormInput type="number" step="0.01" size="sm" :value="metersToKm(act.distance)"
                    @blur="act.distance = kmToMeters($event.target.value, act.distance)" />
                </Field>

                <Field label="Speed">
                  <BFormInput type="number" step="0.1" size="sm" :value="msToKmh(act.avgspeed)"
                    @blur="act.avgspeed = kmhToMs($event.target.value, act.avgspeed)" />
                </Field>

                <Field label="Latitude">
                  <input
                    type="number"
                    v-model.number="act.latitude"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Longitude">
                  <input
                    type="number"
                    v-model.number="act.longitude"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Equipment">
                  <select v-model="act.equipment" class="form-select form-select-sm"
                    :disabled="!act.equipmentOptions.length">
                    <option :value="null">-- Select Equipment --</option>
                    <option v-for="e in act.equipmentOptions" :key="e.id" :value="e.id">
                      {{ e.name }}
                    </option>
                  </select>
                </Field>

                <Field label="Avg HR">
                  <input
                    type="number"
                    v-model.number="act.heartrate"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Notes">
                  <input
                    type="number"
                    v-model.number="act.comments"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Ascent">
                  <input
                    type="number"
                    v-model.number="act.ascent"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Calories">
                  <input
                    type="number"
                    v-model.number="act.calories"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Cadence">
                  <input
                    type="number"
                    v-model.number="act.avgcadence"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Power">
                  <input
                    type="number"
                    v-model.number="act.avgpower"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Aerobic TE">
                  <input
                    type="number"
                    v-model.number="act.ate"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Anaerobic TE">
                  <input
                    type="number"
                    v-model.number="act.ante"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Load">
                  <input
                    type="number"
                    v-model.number="act.training_load"
                    class="form-control form-control-sm"
                  />
                </Field>                

                <Field label="Feel">
                  <input
                    type="number"
                    v-model.number="act.workout_feel"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="RPE">
                  <input
                    type="number"
                    v-model.number="act.workout_rpe"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Device">
                  <input
                    type="number"
                    v-model.number="act.device"
                    class="form-control form-control-sm"
                  />
                </Field>

                <Field label="Offset">
                  <input
                    type="number"
                    v-model.number="act.tzoffset"
                    class="form-control form-control-sm"
                  />
                </Field>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue';
import Field from '@/components/ui/Field.vue'
import FormatCard from '@/components/ui/FormatCard.vue'



const apiBaseUrl = import.meta.env.VITE_API_BASE_URL
const hrmData = ref([])
const dragActive = ref(false);
const uploadedFiles = ref<{ file: File, name: string, status: 'pending' | 'uploading' | 'success' | 'error' }[]>([]);
const activities = ref([]);
const sports = ref<any[]>([]);

onMounted(async () => {
  const res = await fetch(apiBaseUrl + 'sports');
  if (res.ok) sports.value = await res.json();
});

const createActivityTemplate = () => ({
  hrmfile: '', name: '', date: '', sport: null, subsport: null, subsportOptions: [], duration: 0,
  intensity: null, distance: 0.0, avgspeed: 0.0, latitude: 0.0, longitude: 0.0,
  secondhrmfile: '', equipment: null, equipmentOptions: [], heartrate: 0, comments: '', ascent: 0,
  calories: 0, avgcadence: 0, avgpower: 0, device: '', ate: 0.0, ante: 0.0,
  training_load: 0, workout_feel: 0, workout_rpe: 0, offset: 0
});

const uploadFile = async (fileItem: any) => {
  fileItem.status = 'uploading';
  const formData = new FormData();
  formData.append('file', fileItem.file);

  try {
    // Upload the new hrm file
    const response = await fetch(apiBaseUrl + 'uploadhrm2', {
      method: 'POST',
      body: formData,
    });
    if (!response.ok) throw new Error('Upload failed');

    fileItem.status = 'success';
    console.log('Upload successful, now fetching HRM data for:', fileItem.name);

    // Read the HRM file data immediately after upload
    try {
      const res = await fetch(apiBaseUrl + `hrm/${fileItem.name}`);
      if (res.ok) {
        const data = await res.json();
        hrmData.value.push(data);
        console.log('Fetched HRM data:', data);
        const newActivity = createActivityTemplate();
        const rawData = data.Activities || {};
        newActivity.hrmfile = fileItem.name;
        newActivity.name = rawData.workout_name || '';
        newActivity.date = rawData.start_time || '';
        newActivity.sport = rawData.sport || 0;
        newActivity.subsport = rawData.sub_sport || 0;
        newActivity.duration = Math.floor(rawData.total_elapsed_time || 0);        
        newActivity.intensity = data.Activities.intensity || '';
        newActivity.distance = data.Activities.total_distance || 0;
        newActivity.avgspeed = data.Activities.avg_speed || 0;
        newActivity.latitude = data.Activities.start_position_lat || 0.0;
        newActivity.longitude = data.Activities.start_position_long || 0.0;
        //newActivity.secondhrmfile = data.Activities.secondhrmfile || '';
        newActivity.equipment = data.Activities.equipment || '';
        newActivity.heartrate = data.Activities.avg_heart_rate || 0;
        //newActivity.comments = data.Activities.comments || '';
        newActivity.avgcadence = data.Activities.avg_cadence || 0;
        newActivity.ascent = data.Activities.total_ascent || 0;
        newActivity.calories = data.Activities.total_calories || 0;
        newActivity.avgpower = data.Activities.avg_power || 0;
        newActivity.device = data.Activities.device || '';
        newActivity.ate = data.Activities.total_training_effect || 0.0;
        newActivity.ante = data.Activities.total_anaerobic_training_effect || 0.0;
        newActivity.training_load = data.Activities.training_load_peak || 0;
        newActivity.workout_feel = data.Activities.workout_feel || 0;
        newActivity.workout_rpe = data.Activities.workout_rpe || 0;
        newActivity.offset = data.Activities.tzoffset || 0;


    // 1. Get the Garmin text from the FIT data
    const garminSportName = (rawData.sport || '').toLowerCase(); // e.g., "cycling"
    const garminSubsportName = (rawData.sub_sport || '').toLowerCase(); // e.g., "road"

    // 2. Find the match in your locally cached 'sports' list
    const matchedSport = sports.value.find(
      s => s.garmin_name?.toLowerCase() === garminSportName
    );

    if (matchedSport) {
      newActivity.sport = matchedSport.id;
      
      // 3. Fetch subsports for this specific sport
      await handleSportChange(newActivity);
      
      // 4. Find the match in the newly fetched 'subsportOptions'
      const matchedSubsport = newActivity.subsportOptions.find(
        ss => ss.garmin_name?.toLowerCase() === garminSubsportName
      );
      const matchedEq = newActivity.equipmentOptions.find(
        e => e.garmin_name?.toLowerCase() === rawData.equipment?.toLowerCase()
      );
      if (matchedSubsport) {
        newActivity.subsport = matchedSubsport.id;
      }
      if (matchedEq) {
        newActivity.equipment = matchedEq.id;
      }
    }

        activities.value.push(newActivity);
        console.log('Updated activity array:', activities.value);



      } else {
        console.error('Failed to fetch HRM data after upload', res.status);
      }
    } catch (err) {
      console.error('Error fetching HRM data after upload', err);
      fileItem.status = 'error';
    }

  } catch (error) {
    console.error('Error uploading:', error);
    fileItem.status = 'error';
  }
};

const processFiles = (files: FileList) => {
  const newFiles = Array.from(files).map(file => ({
    file,
    name: file.name,
    status: 'pending' as const
  }));

  // Add to the UI list immediately
  uploadedFiles.value.push(...newFiles);

  // Trigger the upload (and subsequent fetch) for each file
  newFiles.forEach(fileItem => uploadFile(fileItem));
};
console.log('Uploaded files:', hrmData.value);

// Function to fetch subsports when a sport is selected
const handleSportChange = async (act: any) => {
  act.subsport = null; // Reset subsport when sport changes
  act.equipment = null; // Reset equipment when sport changes
  if (!act.sport) {
    act.subsportOptions = [];
    act.equipmentOptions = [];
    return;
  }

   try {
    // Fetch Subsports and Equipment in parallel for better performance
    const [ssRes, eqRes] = await Promise.all([
      fetch(apiBaseUrl + `subsport/${act.sport}`),
      fetch(apiBaseUrl + `equipment/${act.sport}`)
    ]);

    if (ssRes.ok) act.subsportOptions = await ssRes.json();
    if (eqRes.ok) act.equipmentOptions = await eqRes.json();
    
  } catch (err) {
    console.error('Error fetching cascading data:', err);
  }
};

const handleDrag = (e: DragEvent) => {
  e.preventDefault();
  dragActive.value = (e.type === 'dragenter' || e.type === 'dragover');
};

const handleDrop = (e: DragEvent) => {
  e.preventDefault();
  dragActive.value = false;
  if (e.dataTransfer?.files) processFiles(e.dataTransfer.files);
};

const handleFileInput = (e: Event) => {
  const target = e.target as HTMLInputElement;
  if (target.files) processFiles(target.files);
};

const isSaving = ref(false);

const saveAllActivities = async () => {
  if (activities.value.length === 0) return;

  isSaving.value = true;
  let successCount = 0;
  let errorCount = 0;

  for (const act of activities.value) {
    try {
      const response = await fetch(apiBaseUrl + 'activities', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(serializeActivityForApi(act))
      });

      if (!response.ok) throw new Error(`Failed to save ${act.name}`);

      successCount++;
    } catch (error) {
      console.error('Error saving activity:', error);
      errorCount++;
    }
  }

  isSaving.value = false;

  if (errorCount === 0) {
    alert(`Successfully saved all ${successCount} activities!`);
    activities.value = []; // Clear the list on total success
  } else {
    alert(`Finished with mixed results: ${successCount} saved, ${errorCount} failed.`);
    // Optionally: Filter out the successful ones so the user only sees the failures
  }
};

const isFormValid = computed(() => {
  if (activities.value.length === 0) return false;

  return activities.value.every(act => {
    // Safely check if name exists and has content
    const hasName = act.name && typeof act.name === 'string' && act.name.trim() !== '';
    
    // Check other mandatory fields
    const hasSport = act.sport !== null && act.sport !== undefined;

    return hasName && hasSport;
  });
});

const secondsToHMS = (seconds: number | string): string => {
  const s = Number(seconds) || 0;
  const h = Math.floor(s / 3600).toString().padStart(2, '0');
  const m = Math.floor((s % 3600) / 60).toString().padStart(2, '0');
  const sec = (s % 60).toString().padStart(2, '0');
  return `${h}:${m}:${sec}`;
};

const hmsToSeconds = (hms: string, currentValue: number): number => {
  // Regex: 1-2 digits : 1-2 digits : 1-2 digits
  const hmsRegex = /^(\d{1,2}):(\d{1,2}):(\d{1,2})$/;
  const match = hms.trim().match(hmsRegex);
  

  if (!match) {
    console.warn("Invalid format. Keeping original value:", hms);
    return currentValue; // Fallback to what was there before
  }

  const [_, h, m, s] = match;
  return parseInt(h) * 3600 + parseInt(m) * 60 + parseInt(s);
};

const metersToKm = (m: number | string) => (Number(m) / 1000).toFixed(2);
const kmToMeters = (km: string, current: number) => {
  const val = parseFloat(km);
  return isNaN(val) ? current : Math.round(val * 1000);
};


// Speed: m/s <-> km/h (Conversion factor: 3.6)
const msToKmh = (ms: number | string) => (Number(ms) * 3.6).toFixed(2);
const kmhToMs = (kmh: string, current: number) => {
  const val = parseFloat(kmh);
  return isNaN(val) ? current : val / 3.6;
};

const serializeActivityForApi = (act: any) => {
  return {
    ...act,
    distance: Number((act.distance / 1000).toFixed(2)), // metres → km
    //avgspeed: Number((act.avgspeed * 3.6).toFixed(2)), // optional: m/s → km/h if your API expects it
  };
};

</script>

<style scoped>
.text-purple {
  color: #6f42c1;
}

.upload-zone {
  border: 2px dashed #dee2e6;
  border-radius: 0.5rem;
  padding: 3rem;
  text-align: center;
  background-color: #f8f9fa;
  transition: all 0.2s;
}

.upload-zone:hover {
  border-color: #adb5bd;
}

.upload-zone.drag-active {
  border-color: #0d6efd;
  background-color: #e7f1ff;
}

.bg-success-subtle {
  background-color: #d1e7dd;
}

/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
</style>