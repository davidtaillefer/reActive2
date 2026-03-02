<template>
  <div class="h-100 bg-light overflow-auto">
    <div class="container py-4" style="max-width: 900px;">
      <div class="card shadow-sm">
        <div class="card-body p-4">
          <!-- Header -->
          <div class="d-flex align-items-center gap-3 mb-4">
            <i class="bi bi-upload text-purple fs-4"></i>
            <h2 class="mb-0">Upload Activity</h2>
          </div>

          <!-- Upload Area -->
          <div
            :class="['upload-zone', dragActive ? 'drag-active' : '']"
            @dragenter="handleDrag"
            @dragleave="handleDrag"
            @dragover="handleDrag"
            @drop="handleDrop"
          >
            <i :class="['bi bi-upload', dragActive ? 'text-primary' : 'text-muted']" style="font-size: 4rem;"></i>
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

          <!-- Supported Formats -->
          <div class="row g-3 mt-3">
            <div class="col-md-4">
              <div class="card bg-light text-center">
                <div class="card-body">
                  <i class="bi bi-file-earmark-text text-primary fs-3"></i>
                  <h6 class="mt-2 mb-1">.GPX</h6>
                  <small class="text-muted">GPS Exchange Format</small>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card bg-light text-center">
                <div class="card-body">
                  <i class="bi bi-file-earmark-text text-success fs-3"></i>
                  <h6 class="mt-2 mb-1">.FIT</h6>
                  <small class="text-muted">Garmin Activity</small>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card bg-light text-center">
                <div class="card-body">
                  <i class="bi bi-file-earmark-text text-purple fs-3"></i>
                  <h6 class="mt-2 mb-1">.TCX</h6>
                  <small class="text-muted">Training Center XML</small>
                </div>
              </div>
            </div>
          </div>

          <!-- Uploaded Files -->
          <div v-if="uploadedFiles.length > 0" class="mt-4">
            <h5 class="mb-3">Uploaded Files</h5>
            <div class="d-flex flex-column gap-2">
              <div
                v-for="(file, index) in uploadedFiles"
                :key="index"
                class="card border-success bg-success-subtle"
              >
                <div class="card-body d-flex align-items-center justify-content-between p-3">
                  <div class="d-flex align-items-center gap-3">
                    <i class="bi bi-check-circle-fill text-success fs-5"></i>
                    <span class="fw-medium">{{ file }}</span>
                  </div>
                  <span class="badge bg-success">Uploaded</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';

const dragActive = ref(false);
const uploadedFiles = ref([]);

const handleDrag = (e: DragEvent) => {
  e.preventDefault();
  e.stopPropagation();
  if (e.type === 'dragenter' || e.type === 'dragover') {
    dragActive.value = true;
  } else if (e.type === 'dragleave') {
    dragActive.value = false;
  }
};

const handleDrop = (e: DragEvent) => {
  e.preventDefault();
  e.stopPropagation();
  dragActive.value = false;

  if (e.dataTransfer?.files && e.dataTransfer.files[0]) {
    const fileNames = Array.from(e.dataTransfer.files).map(f => f.name);
    uploadedFiles.value = [...uploadedFiles.value, ...fileNames];
  }
};

const handleFileInput = (e: Event) => {
  const target = e.target as HTMLInputElement;
  if (target.files && target.files[0]) {
    const fileNames = Array.from(target.files).map(f => f.name);
    uploadedFiles.value = [...uploadedFiles.value, ...fileNames];
  }
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
</style>